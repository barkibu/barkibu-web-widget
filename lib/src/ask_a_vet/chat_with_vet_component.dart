import 'dart:async';
import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/viewmodels/chat_with_vet/chat_with_vet_flow.dart';
import 'package:web_widget/src/chat/chat_control_events.dart';
import 'package:web_widget/src/chat/chat_controls_component.dart';
import 'package:web_widget/src/chat/chat_messages_component.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/navigation/spinner_component.dart';
import 'package:web_widget/src/ask_a_vet/ask_a_vet_messages_component.dart';
import 'package:web_widget/src/ask_a_vet/ask_a_vet_text_input_component.dart';
import 'package:web_widget/src/alerts/alert_component.dart';
import 'package:web_widget/src/video_stream/video_stream_component.dart';
import 'package:web_widget/src/widget_configuration.dart';

ChatWithVetBloc chatWithVetBlocFactory(AuthBloc authBloc) =>
    ServiceLocator.container<ChatWithVetBloc>(param1: authBloc);
ConnectChatUseCase connectChatUseCaseFactory() => ServiceLocator.container<ConnectChatUseCase>();

@Component(selector: 'chat-with-vet', templateUrl: 'chat_with_vet_component.html', styleUrls: [
  'chat_with_vet_component.css'
], providers: [
  FactoryProvider(ChatWithVetBloc, chatWithVetBlocFactory),
  FactoryProvider(ConnectChatUseCase, connectChatUseCaseFactory),
], directives: [
  coreDirectives,
  GoBackComponent,
  AskAVetMessagesComponent,
  AskAVetTextInputComponent,
  SpinnerComponent,
  AlertComponent,
  ChatMessagesComponent,
  ChatControlsComponent,
  layoutDirectives,
  VideoStreamComponent,
])
class ChatWithVetComponent implements OnInit, OnDestroy {
  final ChatWithVetBloc chatBloc;
  final MessagesModel messages;
  final ConnectChatUseCase connectUseCase;
  final backButtonEventsController = StreamController();
  final WidgetConfiguration config;
  ChatWithVetState chatState;

  @ViewChild(ChatMessagesComponent)
  ChatMessagesComponent chatMessagesComponent;

  @ViewChild(AskAVetMessagesComponent)
  AskAVetMessagesComponent askAVetMessagesComponent;

  @Input()
  bool reconnect = false;

  @Input()
  String consultationId;

  @Output()
  Stream get goBackButtonEvents => backButtonEventsController.stream;

  ChatWithVetComponent(this.chatBloc, this.messages, this.connectUseCase, this.config);

  @override
  void ngOnDestroy() {
    chatBloc.close();
  }

  @override
  void ngOnInit() {
    reconnect ? _reconnectWithVet() : _connectWithVet();
    chatBloc.listen(chatBlocListener);
  }

  void onBackButtonClicked() {
    backButtonEventsController.add(null);
  }

  void _connectWithVet() {
    chatBloc.add(ChatWithVetStarted((b) => b..consultationId = consultationId));
  }

  void _reconnectWithVet() async {
    final activeConnection = await connectUseCase.retrieveActiveChatConnection();
    if (activeConnection == null) {
      return _connectWithVet();
    }
    chatBloc.add(ChatWithVetStarted((b) => b
      ..consultationId = consultationId
      ..channelSid = activeConnection.channelSid
      ..chatService = activeConnection.twilio));
  }

  void chatBlocListener(state) {
    chatState = state;
    if (isChatTerminated) {
      chatMessagesComponent?.scrollToTheLastMessage();
    } else {
      askAVetMessagesComponent?.scrollToTheLastMessage();
    }
  }

  bool get isChatInitialized => chatState is ChatWithVetConnectSuccess;

  bool get isChatLoading => !isChatInitialized && !isChatError && !isChatTerminated;

  bool get isChatTerminated => chatState is ChatWithVetTerminateSuccess;

  ChatViewModel get afterTerminateInput => (chatState as ChatWithVetTerminateSuccess).afterTerminateInput;
  List<ChatViewModel> get afterTerminateMessages => (chatState as ChatWithVetTerminateSuccess).afterTerminateMessages;

  void processFeedback(YesNoUnkownConfirmed event) =>
      chatBloc.add(ChatWithVetFeedbackPressed((b) => b.answer = event.answer));

  void onChatControlEvent(ChatControlEvent event) {
    if (event is YesNoUnkownConfirmed && event.flow is AskFeedbackChatWithVetFlow) {
      return processFeedback(event);
    } else if (event is ChatOptionButtonPressed && event.optionType == ChatButtonOptionType.goBack) {
      return onBackButtonClicked();
    }
  }

  bool get isChatError =>
      chatState is ChatWithVetAvailabilityCheckFailure || chatState is ChatWithVetListenerBindFailure;

  String get errorMessage {
    if (chatState is ChatWithVetAvailabilityCheckFailure &&
        (chatState as ChatWithVetAvailabilityCheckFailure).connectionStatus == TwilioConnectionStatus.noAgents) {
      return messages.chatMessages.chatWithVet.noVetsAvailable;
    } else {
      return messages.chatMessages.chatWithVet.errorConnectionToAVet;
    }
  }

  bool get telehealthVideoCapabilityEnabled => config.telehealthVideoCapabilityEnabled;
}
