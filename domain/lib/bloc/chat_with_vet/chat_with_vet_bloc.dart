import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/bloc/auth/authentication/auth_bloc.dart';
import 'package:common_barkibu_dart/bloc/chat_with_vet/chat_with_vet_event.dart';
import 'package:common_barkibu_dart/bloc/chat_with_vet/chat_with_vet_state.dart';
import 'package:common_barkibu_dart/bloc/chat_with_vet/video_stream_bloc.dart';
import 'package:common_barkibu_dart/domain/twilio_chat/connect_chat_usecase.dart';
import 'package:common_barkibu_dart/messages/chatMessages.i18n.dart';
import 'package:common_barkibu_dart/models/user.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/services/analytics_service.dart';
import 'package:common_barkibu_dart/services/locale_service.dart';
import 'package:common_barkibu_dart/services/twilio.dart';
import 'package:common_barkibu_dart/shared/chat/actions_chat.dart';
import 'package:common_barkibu_dart/viewmodels/chat/chat_viewmodel.dart';
import 'package:common_barkibu_dart/viewmodels/chat_with_vet/chat_with_vet_flow.dart';
import 'package:common_barkibu_dart/viewmodels/chat_with_vet/chat_with_vet_message_type.dart';
import 'package:pedantic/pedantic.dart';

class ChatWithVetBloc extends Bloc<ChatWithVetEvent, ChatWithVetState> {
  final ConnectChatUseCase _connectChatUseCase;
  final AnalyticsService _analyticsService;
  User _user;
  StreamSubscription _authBlocSubscription;
  bool _disposed = false;
  ChatWithVetChatMessages _botMessagesChatMessages;
  VideoStreamBloc videoStreamBloc;
  ActionsChat actionsChat;

  ChatWithVetBloc(this._connectChatUseCase, this._analyticsService, _authBloc) {
    _botMessagesChatMessages = ServiceLocator.container<LocaleService>().messagesModel().chatMessages.chatWithVet;
    videoStreamBloc = ServiceLocator.container<VideoStreamBloc>(param1: _requestStreamSharing);
    _listenAuthBloc(_authBloc);
    actionsChat = ActionsChat<ChatWithVetFlow>();
  }

  @override
  ChatWithVetState get initialState => ChatWithVetInitial();

  @override
  Stream<ChatWithVetState> mapEventToState(ChatWithVetEvent event) async* {
    if (event is ChatWithVetStarted) {
      if (event.chatService != null && event.channelSid != null) {
        yield* _reconnectWithVet(event);
      } else {
        yield* _connectWithVets(event);
      }
    }

    if (state is ChatWithVetConnectSuccess) {
      final ChatWithVetConnectSuccess connectedState = state;
      if (event is ChatWithVetTextMessageSent) {
        final message = SendingChatMessage(event.messageBody, event.attributes);
        final attributes = event.showMessage ? event.attributes : (event.attributes..[hideMessageKey] = true) ?? {};
        yield connectedState
            .rebuild((b) => b..pendingMessages = (List.from(connectedState.pendingMessages)..add(message)));
        await connectedState.chatService.sendMessage(connectedState.channelSid, event.messageBody, attributes);
      }

      if (event is ChatWithVetMediaMessageSent) {
        final attributes = Map<String, dynamic>.from(event.attributes)
          ..addEntries([MapEntry(tmpIdKey, event.mediaPath)]);
        final message = SendingChatMediaMessage(attributes);
        yield connectedState
            .rebuild((b) => b..pendingMessages = (List.from(connectedState.pendingMessages)..add(message)));
        if (event.formData == null) {
          await connectedState.chatService
              .sendMediaFile(connectedState.channelSid, event.mediaPath, event.mimeType, attributes);
        } else {
          await connectedState.chatService.sendMediaFormData(connectedState.channelSid, event.formData, attributes);
        }
      }

      if (event is ChatWithVetMessageReceived) {
        final twilioMessage = event.message;
        final messages = List<TwilioMessage>.from(connectedState.messages)..add(twilioMessage);
        final pendingMessages = List<SimpleChatMessage>.from(connectedState.pendingMessages)
          ..removeWhere((message) =>
              (message is SendingChatMediaMessage &&
                  message.attributes[tmpIdKey] == twilioMessage.attributes[tmpIdKey]) ||
              (message is SendingChatMessage && message.body == twilioMessage.body));
        yield connectedState.rebuild((b) => b
          ..messages = messages
          ..pendingMessages = pendingMessages);
        if (twilioMessage.isVideoRequest()) {
          videoStreamBloc.onMessage(twilioMessage);
        }
      }

      if (event is ChatWithVetMemberTyped) {
        final typingMembers = List<TwilioMember>.from(connectedState.typingMembers);
        if (event.isTyping) {
          if (typingMembers.where((m) => m.sid == event.member.sid).isEmpty) {
            typingMembers.add(event.member);
          }
        } else {
          typingMembers.removeWhere((m) => m.sid == event.member.sid);
        }
        yield connectedState.rebuild((b) => b..typingMembers = typingMembers);
      }

      if (event is ChatWithVetMemberJoined) {
        final members = List<TwilioMember>.from(connectedState.members)..add(event.member);
        yield connectedState.rebuild((b) => b..members = members);
        final chatUser = await event.member.fetchUser();
        add(ChatWithVetBotMessageSent(
            (b) => b..messageBody = _botMessagesChatMessages.vetJoined(chatUser.friendlyName)));
      }
      if (event is ChatWithVetMemberLeft) {
        final members = List<TwilioMember>.from(connectedState.members)..removeWhere((m) => m.sid == event.member.sid);
        yield connectedState.rebuild((b) => b..members = members);
        if (members.length == 1) {
          add(ChatWithVetClosed());
        }
      }
    }

    if (event is ChatWithVetClosed) {
      final currentState = state;
      var terminationState = ChatWithVetTerminateSuccess();
      unawaited(_endChat(true));

      if (currentState is ChatWithVetConnectSuccess) {
        terminationState = terminationState.rebuild((b) => b
          ..channelSid = currentState.channelSid
          ..messages = currentState.messages);
      }
      yield terminationState;
      yield* _addChatViewModelStreamToFlowState(_askForFeedback());
    }

    if (event is ChatWithVetFeedbackPressed) {
      final currentState = state;

      if (currentState is ChatWithVetTerminateSuccess) {
        _analyticsService.event.askAVet.logAskAVetHelpful(event.answer);
        if (event.answer) {
          yield _addChatViewModelToFlowState(state, actionsChat.ownMessageType(ChatWithVetMessageType.yes));
          yield* _addChatViewModelStreamToFlowState(
              actionsChat.botMessageType(ChatWithVetMessageType.positiveFeedbackAnswer));
        } else {
          yield _addChatViewModelToFlowState(state, actionsChat.ownMessageType(ChatWithVetMessageType.no));
          yield* _addChatViewModelStreamToFlowState(
              actionsChat.botMessageType(ChatWithVetMessageType.negativeFeedbackAnswer));
        }
        yield* _addChatViewModelStreamToFlowState(_goBackOptions());
      }
    }
  }

  Stream<ChatViewModel> _goBackOptions() async* {
    yield actionsChat.menuOptions([ChatButtonOptionType.goBack], {});
  }

  Stream<ChatWithVetState> _addChatViewModelStreamToFlowState(Stream<ChatViewModel> chatViewModelStream) async* {
    await for (ChatViewModel chatViewModel in chatViewModelStream) {
      yield _addChatViewModelToFlowState(state, chatViewModel);
    }
  }

  ChatWithVetState _addChatViewModelToFlowState(
      ChatWithVetTerminateSuccess terminateState, ChatViewModel chatViewModel) {
    if (chatViewModel.type == ChatViewModelType.input) {
      return terminateState.rebuild((b) => b..afterTerminateInput = chatViewModel);
    } else {
      final list = List<ChatViewModel>.from([...terminateState.afterTerminateMessages, chatViewModel]);
      return terminateState.rebuild((b) => b
        ..afterTerminateMessages = list
        ..afterTerminateInput = null);
    }
  }

  Stream<ChatViewModel> _askForFeedback() async* {
    yield* actionsChat.botMessageType(ChatWithVetMessageType.askFeedback);
    yield actionsChat.yesNo(ChatWithVetFlow.askFeedback());
  }

  Stream<ChatWithVetState> _reconnectWithVet(ChatWithVetStarted event) async* {
    final channelSid = event.channelSid;
    final chatService = event.chatService;
    yield ChatWithVetListenerBindInProgress((b) => b
      ..channelSid = channelSid
      ..chatService = chatService);
    yield* _listenAndLoad(chatService, channelSid);
  }

  Stream<ChatWithVetState> _connectWithVets(ChatWithVetStarted event) async* {
    yield ChatWithVetAvailabilityCheckInProgress();
    final connectionResponse = await _connectChatUseCase.connect(event.consultationId);
    final channelSid = connectionResponse.channelSid;
    final chatService = connectionResponse.twilio;
    if (connectionResponse.status != TwilioConnectionStatus.connected) {
      yield ChatWithVetAvailabilityCheckFailure((b) => b..connectionStatus = connectionResponse.status);
      return;
    }

    yield ChatWithVetAvailabilityCheckSuccess((b) => b..channelSid = channelSid);

    yield ChatWithVetListenerBindInProgress((b) => b
      ..channelSid = channelSid
      ..chatService = chatService);

    yield* _listenAndLoad(chatService, channelSid);
  }

  Stream<ChatWithVetState> _listenAndLoad(TwilioChatService chatService, String channelSid) async* {
    try {
      await chatService.addOnMemberJoinChannelHandler(channelSid, _onMemberJoin);
      await chatService.addOnTypingHandler(channelSid, _onMemberType);
      await chatService.addOnMemberLeaveChannelHandler(channelSid, _onMemberLeave);
      await chatService.addOnMessageAddedHandler(channelSid, _onChatMessageAdded);

      final messages = await chatService.loadMessages(channelSid);
      final members = await chatService.loadMembers(channelSid);
      if (messages.isEmpty) {
        _sendInitialMessage();
      }

      yield ChatWithVetConnectSuccess((b) => b
        ..channelSid = channelSid
        ..messages = messages.map((message) => message.rebuild((m) => m..me = _isMessageAuthor(message))).toList()
        ..chatService = chatService
        ..members = members
        ..typingMembers = []);
    } catch (e) {
      yield ChatWithVetListenerBindFailure((b) => b
        ..status = ChatWithVetFailureStatus.channelUnavailable
        ..details = e.toString());
    }
  }

  Future<void> _onChatMessageAdded(TwilioMessage message) async {
    _addIfNotDisposed(
      ChatWithVetMessageReceived((b) => b..message = (message.toBuilder()..me = _isMessageAuthor(message))),
    );
  }

  Future<void> _onMemberJoin(TwilioMember member) async {
    _addIfNotDisposed(ChatWithVetMemberJoined((b) => b..member = member.toBuilder()));
  }

  Future<void> _onMemberLeave(TwilioMember member) async {
    _addIfNotDisposed(ChatWithVetMemberLeft((b) => b..member = member.toBuilder()));
  }

  Future<void> _onMemberType(TwilioMember member, bool isTyping) async {
    _addIfNotDisposed(
      ChatWithVetMemberTyped((b) => b
        ..member = member.toBuilder()
        ..isTyping = isTyping),
    );
  }

  Future<void> _endChat(bool initiatedByVet) async {
    final currentState = state;
    if (currentState is ChatWithVetConnectSuccess) {
      final channelSid = currentState.channelSid;
      currentState.chatService.removeHandlers(channelSid);
      if (initiatedByVet) {
        await currentState.chatService.leaveChannel(channelSid);
      } else {
        add(ChatWithVetMessageSent((b) => b
          ..messageBody = _botMessagesChatMessages.petParentLeftChat
          ..showMessage = false));
      }
    }
  }

  void _listenAuthBloc(AuthBloc _authBloc) {
    _authBlocSubscription = _authBloc.listen((state) {
      _user = state is Authenticated ? state.user : null;
    });
  }

  void _sendInitialMessage() {
    add(ChatWithVetMessageSent((b) => b
      ..messageBody = '👋🏼'
      ..attributes = {hideMessageKey: true}));
  }

  bool _isMessageAuthor(TwilioMessage message) {
    return message.author == _user?.twilioIdentity;
  }

  @override
  Future<void> close() async {
    if (!_disposed) {
      _disposed = true;
      await _authBlocSubscription?.cancel();
      await _endChat(false);
    }
    return super.close();
  }

  void _requestStreamSharing(String roomSid) {
    final videoRequestAttributes = {
      videoSharingKey: true,
      videoSharingRoomSidKey: roomSid,
      videoSharingStatusKey: VideoChatRoomStatus.requested.toScreamyString()
    };
    add(ChatWithVetMessageSent((b) => b
      ..messageBody = 'I want to share my video'
      ..showMessage = false
      ..attributes = videoRequestAttributes));
  }

  void _addIfNotDisposed(ChatWithVetEvent event) {
    if (!_disposed) {
      add(event);
    }
  }
}
