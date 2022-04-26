import 'dart:async';

import 'package:common_barkibu_dart/bloc/chat_with_vet/chat_with_vet_bloc.dart';
import 'package:common_barkibu_dart/bloc/chat_with_vet/chat_with_vet_state.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/messages/chatMessages.i18n.dart';
import 'package:common_barkibu_dart/viewmodels/chat_with_vet/chat_with_vet_flow.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks/service_mocks.dart';
import '../../service_locator.dart' as test_service_locator;

class MockAuthBloc extends Mock implements AuthBloc {}

class MockConnectChatUseCase extends Mock implements ConnectChatUseCase {}

class MockTwilioChatService extends Mock implements TwilioChatService {}

class ChatWithVetBlocSpy extends ChatWithVetBloc {
  final List<ChatWithVetEvent> events = [];

  ChatWithVetBlocSpy(ConnectChatUseCase connectChatUseCase, AnalyticsService analyticsService, AuthBloc authBloc)
      : super(connectChatUseCase, analyticsService, authBloc);

  @override
  void add(ChatWithVetEvent event) {
    events.add(event);
    super.add(event);
  }
}

class MockVideoStreamBloc extends Mock implements VideoStreamBloc {
  MockVideoStreamBloc(_);
}

class MockVideoChatUseCase extends Mock implements VideoChatUseCase {}

void main() {
  test_service_locator.ServiceLocator.setup();
  void Function(String) requestStreamSharing;
  test_service_locator.services
      .registerFactoryParam<VideoStreamBloc, void Function(String), void>((_streamSharingRequest, _) {
    requestStreamSharing = _streamSharingRequest;
    return MockVideoStreamBloc(
      _streamSharingRequest,
    );
  });
  ChatWithVetBloc chatWithVetBloc;
  AnalyticsService mockAnalyticsService = MockAnalyticsService();
  AuthBloc mockAuthBloc = MockAuthBloc();
  ConnectChatUseCase mockConnectChatUseCase = MockConnectChatUseCase();
  TwilioChatService mockTwilio = MockTwilioChatService();
  final consultationId = 'test-aivet-xxx-yyy';
  final initialMessageBody = '👋🏼';
  final channelSid = 'CH_XXX';

  void initializeBloc() {
    chatWithVetBloc?.close();
    chatWithVetBloc = ChatWithVetBlocSpy(mockConnectChatUseCase, mockAnalyticsService, mockAuthBloc);
  }

  setUp(() {
    initializeBloc();
    reset(mockTwilio);
  });

  tearDown(() {
    chatWithVetBloc?.close();
  });

  group('ChatWithVetBloc', () {
    group('ChatWithVetStarted to get back with an active conversation', () {
      final startEvent = ChatWithVetStarted((b) => b
        ..chatService = mockTwilio
        ..channelSid = channelSid);

      test('ChatWithVetStarted directly emits ChatWithVetListenerBindInProgress', () {
        expectLater(
            chatWithVetBloc,
            emitsInOrder([
              isA<ChatWithVetInitial>(),
              isA<ChatWithVetListenerBindInProgress>(),
            ]));

        chatWithVetBloc.add(startEvent);
      });
      group('if channel cannot be loaded', () {
        test('ChatWithVetStarted emits ChatWithVetListenerBindFailure', () {
          when(mockTwilio.addOnMemberJoinChannelHandler(any, any)).thenThrow(ChannelUnavailable('Test Error'));

          expectLater(
              chatWithVetBloc,
              emitsInOrder([
                isA<ChatWithVetInitial>(),
                isA<ChatWithVetListenerBindInProgress>(),
                isA<ChatWithVetListenerBindFailure>(),
              ]));

          chatWithVetBloc.add(startEvent);
        });
      });

      group('if channel is loaded successfully', () {
        final meMember = TwilioMember((b) => b
          ..identity = 'me'
          ..sid = 'MB_XXXX_1'
          ..fetchUser = () => Future.value(TwilioUser((b) => b
            ..friendlyName = 'me'
            ..identity = 'me')));

        setUp(() {
          when(mockTwilio.loadMessages(any)).thenAnswer((_) => Future.value([]));
          when(mockTwilio.loadMembers(any)).thenAnswer((_) => Future.value([meMember]));
        });

        final initialPendingMessagePredicate = allOf(
          isA<ChatWithVetConnectSuccess>(),
          hasPendingMessageSatisfying(
              (message) => message.body == initialMessageBody && message.attributes['hide'], 'initial message'),
        );

        final successfulConnectionPredicates = [
          isA<ChatWithVetInitial>(),
          isA<ChatWithVetListenerBindInProgress>(),
          isA<ChatWithVetConnectSuccess>(),
          initialPendingMessagePredicate
        ];

        test('ChatWithVetStarted emits ChatWithVetConnectSuccess', () {
          expectLater(chatWithVetBloc, emitsInOrder(successfulConnectionPredicates));
          chatWithVetBloc.add(startEvent);
        });
      });
    });

    group('ChatWithVetStarted to start a conversation', () {
      final startEvent = ChatWithVetStarted((b) => b..consultationId = consultationId);
      group('When no agent is available', () {
        final noAgentConnectionResponse = ConnectionResponse(TwilioConnectionStatus.noAgents);

        test('ChatWithVetStarted emits ChatWithVetAvailabilityCheckFailure', () {
          when(mockConnectChatUseCase.connect(consultationId))
              .thenAnswer((_) => Future.value(noAgentConnectionResponse));

          expectLater(
              chatWithVetBloc,
              emitsInOrder([
                isA<ChatWithVetInitial>(),
                isA<ChatWithVetAvailabilityCheckInProgress>(),
                isA<ChatWithVetAvailabilityCheckFailure>(),
              ]));

          chatWithVetBloc.add(startEvent);
        });
      });

      group('With agents available', () {
        final agentAvailableConnectionResponse = ConnectionResponse(TwilioConnectionStatus.connected,
            twilio: mockTwilio, accessToken: 'ejyXXX', channelSid: channelSid);
        final testMessage = 'My test message';
        final testAttributes = Map<String, dynamic>.from({'foo': 'bar'});
        final mediaPath = 'fake_path';
        final mimeType = 'image/jpeg';

        final message = TwilioMessage((b) => b
          ..index = 1
          ..author = 'Me'
          ..sid = 'IM_XXX'
          ..body = testMessage
          ..attributes = testAttributes);

        setUp(() {
          when(mockConnectChatUseCase.connect(consultationId))
              .thenAnswer((_) => Future.value(agentAvailableConnectionResponse));
        });

        group('if channel cannot be loaded', () {
          test('ChatWithVetStarted emits ChatWithVetListenerBindFailure', () {
            when(mockTwilio.addOnMemberJoinChannelHandler(any, any)).thenThrow(ChannelUnavailable('Test Error'));

            expectLater(
                chatWithVetBloc,
                emitsInOrder([
                  isA<ChatWithVetInitial>(),
                  isA<ChatWithVetAvailabilityCheckInProgress>(),
                  isA<ChatWithVetAvailabilityCheckSuccess>(),
                  isA<ChatWithVetListenerBindInProgress>(),
                  isA<ChatWithVetListenerBindFailure>(),
                ]));

            chatWithVetBloc.add(startEvent);
          });
        });

        group('if channel is loaded successfully', () {
          TwilioChannelCallbacks twilioCallbacks;
          final meMember = TwilioMember((b) => b
            ..identity = 'me'
            ..sid = 'MB_XXXX_1'
            ..fetchUser = () => Future.value(TwilioUser((b) => b
              ..friendlyName = 'Me'
              ..identity = 'me')));
          final vetMember = TwilioMember((b) => b
            ..identity = 'Vet JmJ'
            ..sid = 'MB_XXXX_2'
            ..fetchUser = () => Future.value(TwilioUser((b) => b
              ..friendlyName = 'Vet Jmj'
              ..identity = 'vet_jmj')));

          setUp(() {
            when(mockTwilio.loadMessages(any)).thenAnswer((_) => Future.value([]));
            when(mockTwilio.loadMembers(any)).thenAnswer((_) => Future.value([meMember]));
            twilioCallbacks = setupTwilioCallbacks(channelSid, mockTwilio);
          });

          final initialPendingMessagePredicate = allOf(
            isA<ChatWithVetConnectSuccess>(),
            hasPendingMessageSatisfying(
                (message) => message.body == initialMessageBody && message.attributes['hide'], 'initial message'),
          );

          final successfulConnectionPredicates = [
            isA<ChatWithVetInitial>(),
            isA<ChatWithVetAvailabilityCheckInProgress>(),
            isA<ChatWithVetAvailabilityCheckSuccess>(),
            isA<ChatWithVetListenerBindInProgress>(),
            isA<ChatWithVetConnectSuccess>(),
            initialPendingMessagePredicate
          ];
          test('ChatWithVetStarted emits ChatWithVetConnectSuccess', () {
            expectLater(chatWithVetBloc, emitsInOrder(successfulConnectionPredicates));
            chatWithVetBloc.add(startEvent);
          });

          test('ChatWithVetMessageSent emits ChatWithVetConnectSuccess with temp message', () async {
            final event = ChatWithVetMessageSent((b) => b
              ..messageBody = testMessage
              ..attributes = testAttributes
              ..showMessage = false);

            chatWithVetBloc.add(startEvent);
            await expectLater(chatWithVetBloc, emitsInOrder(successfulConnectionPredicates));

            chatWithVetBloc.add(event);
            expect(
                chatWithVetBloc,
                emitsInOrder([
                  initialPendingMessagePredicate,
                  allOf(
                    isA<ChatWithVetConnectSuccess>(),
                    hasPendingMessageSatisfying((message) => message.body == testMessage, 'body matches $testMessage'),
                  )
                ]));
          });

          test('ChatWithVetMessageSent calls sendMessage on chatService', () async {
            final event = ChatWithVetMessageSent((b) => b
              ..messageBody = testMessage
              ..attributes = testAttributes
              ..showMessage = false);

            final hasReceivedOwnMessage = Completer();

            chatWithVetBloc.listen((state) {
              if (state is ChatWithVetConnectSuccess &&
                  state.pendingMessages.isNotEmpty &&
                  state.pendingMessages.last.body == testMessage &&
                  !hasReceivedOwnMessage.isCompleted) {
                hasReceivedOwnMessage.complete();
              }
            });

            chatWithVetBloc.add(startEvent);
            chatWithVetBloc.add(event);

            await hasReceivedOwnMessage.future;
            final captures = verify(mockTwilio.sendMessage(channelSid, testMessage, captureAny)).captured;
            final attributesCaptured = captures[0];

            final attributeMatcher = predicate((Map<String, dynamic> attributes) =>
                attributes['foo'] == testAttributes['foo'] && attributes[hideMessageKey] == true);
            expect(attributesCaptured, attributeMatcher, reason: 'miss some attributes');
          });

          test('ChatWithVetMediaMessageSent emits ChatWithVetConnectSuccess with temp media message', () async {
            final event = ChatWithVetMediaMessageSent((b) => b
              ..mediaPath = mediaPath
              ..mimeType = mimeType
              ..attributes = testAttributes);

            chatWithVetBloc.add(startEvent);
            await expectLater(chatWithVetBloc, emitsInOrder(successfulConnectionPredicates));

            chatWithVetBloc.add(event);

            expect(
                chatWithVetBloc,
                emitsInOrder([
                  initialPendingMessagePredicate,
                  allOf(
                    isA<ChatWithVetConnectSuccess>(),
                    allOf(
                      hasPendingMessageSatisfying(
                          (message) => message.attributes[tmpIdKey] == mediaPath, 'tmpId corresponds with media path'),
                      hasPendingMessageSatisfying(
                          (message) => message.attributes['foo'] == 'bar', 'attributes passed along'),
                    ),
                  )
                ]));
          });

          test('ChatWithVetMediaMessageSent calls sendMediaMessage on chatService', () async {
            final event = ChatWithVetMediaMessageSent((b) => b
              ..mediaPath = mediaPath
              ..mimeType = mimeType
              ..attributes = testAttributes);

            final hasReceivedOwnMessage = Completer();

            chatWithVetBloc.listen((state) {
              if (state is ChatWithVetConnectSuccess &&
                  state.pendingMessages.isNotEmpty &&
                  state.pendingMessages.last is SendingChatMediaMessage &&
                  !hasReceivedOwnMessage.isCompleted) {
                hasReceivedOwnMessage.complete();
              }
            });

            chatWithVetBloc.add(startEvent);
            chatWithVetBloc.add(event);

            await hasReceivedOwnMessage.future;
            final captures = verify(mockTwilio.sendMediaFile(channelSid, mediaPath, mimeType, captureAny)).captured;
            final attributesCaptured = captures[0];

            final attributeMatcher = predicate((Map<String, dynamic> attributes) =>
                attributes['foo'] == testAttributes['foo'] && attributes[tmpIdKey] == mediaPath);
            expect(attributesCaptured, attributeMatcher, reason: 'miss some attributes');
          });

          test('onMessageAddedCallback adds ChatWithVetMessageReceived', () async {
            final isConnected = Completer();

            chatWithVetBloc.listen((state) {
              if (state is ChatWithVetConnectSuccess && !isConnected.isCompleted) {
                isConnected.complete();
              }
            });

            chatWithVetBloc.add(startEvent);

            await isConnected.future;
            await twilioCallbacks.onMessageAddedCallback(message);

            await chatWithVetBloc.close();
            final events = (chatWithVetBloc as ChatWithVetBlocSpy).events;
            expect(events, contains(isA<ChatWithVetMessageReceived>()));
          });

          test('ChatWithVetMessageReceived adds message to the state', () {
            final hasSentEvent = Completer();
            final event = ChatWithVetMessageReceived((b) => b.message = message.toBuilder());
            expectLater(
                chatWithVetBloc,
                emitsInOrder([
                  ...successfulConnectionPredicates,
                  allOf(isA<ChatWithVetConnectSuccess>(), lastMessageBodyMatch(testMessage)),
                ]));
            chatWithVetBloc.add(startEvent);

            chatWithVetBloc.listen((state) {
              if (state is ChatWithVetConnectSuccess && !hasSentEvent.isCompleted) {
                hasSentEvent.complete();
                chatWithVetBloc.add(event);
              }
            });
          });

          test('ChatWithVetMessageReceived removes the pending text message in state', () {
            final hasSentEvent = Completer();

            final sendMessageEvent = ChatWithVetMessageSent((b) => b
              ..messageBody = testMessage
              ..attributes = testAttributes);
            final messageReceivedEvent = ChatWithVetMessageReceived((b) => b.message = message.toBuilder());

            expectLater(
                chatWithVetBloc,
                emitsInOrder([
                  ...successfulConnectionPredicates,
                  allOf(
                    isA<ChatWithVetConnectSuccess>(),
                    hasPendingMessageSatisfying((message) => message.body == testMessage),
                  ),
                  allOf(isA<ChatWithVetConnectSuccess>(), lastMessageBodyMatch(testMessage)),
                ]));
            chatWithVetBloc.add(startEvent);

            chatWithVetBloc.listen((state) {
              if (state is ChatWithVetConnectSuccess && !hasSentEvent.isCompleted) {
                hasSentEvent.complete();
                chatWithVetBloc.add(sendMessageEvent); // Pet parent action to send a message
                chatWithVetBloc.add(messageReceivedEvent); // Twilio callback has triggered a message received
              }
            });
          });

          test('ChatWithVetMessageReceived related to VideoRequest are passed to the child bloc', () async {
            final videoRequestMessage =
                message.rebuild((b) => b..attributes = {videoSharingKey: true, videoSharingStatusKey: 'ACCEPTED'});
            final messageReceivedEvent = ChatWithVetMessageReceived((b) => b.message = videoRequestMessage.toBuilder());

            chatWithVetBloc.add(startEvent);
            chatWithVetBloc.add(messageReceivedEvent);
            await expectLater(chatWithVetBloc, emitsThrough(isA<ChatWithVetConnectSuccess>()));
            verify(chatWithVetBloc.videoStreamBloc.onMessage(videoRequestMessage)).called(1);
          });

          test('ChatWithVetMessageReceived removes the pending media message in state', () async {
            final hasSentEvent = Completer();

            final sendMessageEvent = ChatWithVetMediaMessageSent((b) => b
              ..mediaPath = mediaPath
              ..mimeType = mimeType
              ..attributes = testAttributes);
            final messageReceivedEvent =
                ChatWithVetMessageReceived((b) => b.message = message.toBuilder()..attributes[tmpIdKey] = mediaPath);
            final initialMessageReceivedEvent =
                ChatWithVetMessageReceived((b) => b.message = message.toBuilder()..body = initialMessageBody);

            chatWithVetBloc.add(startEvent);
            await expectLater(chatWithVetBloc, emitsInOrder(successfulConnectionPredicates));

            expect(
                chatWithVetBloc,
                emitsInOrder([
                  initialPendingMessagePredicate,
                  allOf(
                    isA<ChatWithVetConnectSuccess>(),
                    hasPendingMessageSatisfying((message) => message.attributes[tmpIdKey] == mediaPath),
                  ),
                  allOf(isA<ChatWithVetConnectSuccess>(), hasMessageCount(1)),
                  allOf(
                    isA<ChatWithVetConnectSuccess>(),
                    hasMessageCount(2),
                    hasNoPendingMessage(),
                  ),
                ]));

            chatWithVetBloc.listen((state) {
              if (state is ChatWithVetConnectSuccess && !hasSentEvent.isCompleted) {
                hasSentEvent.complete();
                chatWithVetBloc.add(sendMessageEvent); // Pet parent action to send a message
                chatWithVetBloc.add(messageReceivedEvent); // Twilio callback has triggered a message received
                chatWithVetBloc.add(initialMessageReceivedEvent); // Twilio callback has triggered a message received
              }
            });
          });

          test('ChatWithVetBotMessageSent emits ChatWithVetConnectSuccess with temp message', () async {
            final event = ChatWithVetBotMessageSent((b) => b..messageBody = testMessage);

            chatWithVetBloc.add(startEvent);
            await expectLater(chatWithVetBloc, emitsInOrder(successfulConnectionPredicates));

            chatWithVetBloc.add(event);
            expect(
                chatWithVetBloc,
                emitsInOrder([
                  initialPendingMessagePredicate,
                  allOf(
                    isA<ChatWithVetConnectSuccess>(),
                    hasPendingMessageSatisfying((message) => message.body == testMessage, 'body matches $testMessage'),
                  )
                ]));
          });

          test('ChatWithVetBotMessageSent calls sendMessage on chatService', () async {
            final event = ChatWithVetBotMessageSent((b) => b..messageBody = testMessage);

            final hasReceivedOwnMessage = Completer();

            chatWithVetBloc.listen((state) {
              if (state is ChatWithVetConnectSuccess &&
                  state.pendingMessages.isNotEmpty &&
                  state.pendingMessages.last.body == testMessage &&
                  !hasReceivedOwnMessage.isCompleted) {
                hasReceivedOwnMessage.complete();
              }
            });

            chatWithVetBloc.add(startEvent);
            chatWithVetBloc.add(event);

            await hasReceivedOwnMessage.future;
            final captures = verify(mockTwilio.sendMessage(channelSid, testMessage, captureAny)).captured;
            final attributesCaptured = captures[0];

            final attributeMatcher =
                predicate((Map<String, dynamic> attributes) => attributes[messageTypeKey] == 'bot');
            expect(attributesCaptured, attributeMatcher, reason: 'miss some attributes');
          });

          group('ChatWithVetMemberTyped event', () {
            final event = ChatWithVetMemberTyped((b) => b
              ..member = vetMember.toBuilder()
              ..isTyping = true);

            Matcher typingMembersCount(int count) =>
                predicate((ChatWithVetConnectSuccess state) => state.typingMembers.length == count);
            Matcher memberIsTyping(TwilioMember member) => predicate(
                (ChatWithVetConnectSuccess state) => state.typingMembers.firstWhere((m) => m.sid == member.sid) != null,
                'has member typing');

            final noMemberIsTyping =
                predicate((ChatWithVetConnectSuccess state) => state.typingMembers.isEmpty, 'has no member typing');

            test('with true adds the member to the list of typing members', () {
              final isConnected = Completer();

              chatWithVetBloc.listen((state) {
                if (state is ChatWithVetConnectSuccess && !isConnected.isCompleted) {
                  chatWithVetBloc.add(event);
                  isConnected.complete();
                }
              });

              expectLater(
                  chatWithVetBloc,
                  emitsInOrder([
                    ...successfulConnectionPredicates,
                    allOf(isA<ChatWithVetConnectSuccess>(), memberIsTyping(vetMember)),
                  ]));

              chatWithVetBloc.add(startEvent);
            });

            test('with event received multiple times only adds typing member once', () {
              var eventSent = false;

              chatWithVetBloc.listen((state) {
                if (state is ChatWithVetConnectSuccess && !eventSent) {
                  chatWithVetBloc.add(event);
                  chatWithVetBloc.add(event);
                  eventSent = true;
                }
              });

              expectLater(
                  chatWithVetBloc,
                  emitsInOrder([
                    ...successfulConnectionPredicates,
                    allOf(isA<ChatWithVetConnectSuccess>(), memberIsTyping(vetMember), typingMembersCount(1)),
                    allOf(isA<ChatWithVetConnectSuccess>(), memberIsTyping(vetMember), typingMembersCount(1)),
                  ]));

              chatWithVetBloc.add(startEvent);
            });

            test('with false removes the member of the list of typing members', () {
              final isConnected = Completer();

              chatWithVetBloc.listen((state) {
                if (state is ChatWithVetConnectSuccess && !isConnected.isCompleted) {
                  chatWithVetBloc.add(event);
                  chatWithVetBloc.add(event.rebuild((b) => b.isTyping = false));
                  isConnected.complete();
                }
              });

              expectLater(
                  chatWithVetBloc,
                  emitsInOrder([
                    ...successfulConnectionPredicates,
                    allOf(isA<ChatWithVetConnectSuccess>(), memberIsTyping(vetMember)), // Member starts typing
                    allOf(isA<ChatWithVetConnectSuccess>(), noMemberIsTyping), // Member stopped typing
                  ]));

              chatWithVetBloc.add(startEvent);
            });
          });

          group('ChatWithVetMember-', () {
            final joinEvent = ChatWithVetMemberJoined((b) => b..member = vetMember.toBuilder());
            final leaveEvent = ChatWithVetMemberLeft((b) => b..member = vetMember.toBuilder());

            Matcher membersContains(TwilioMember member) => predicate(
                (ChatWithVetConnectSuccess state) => state.members.contains(member), 'members contains $member');
            Matcher membersDoesNotContain(TwilioMember member) => predicate(
                (ChatWithVetConnectSuccess state) => !state.members.contains(member),
                'members does not contain $member');

            test('-Join true adds the member to the list of members', () {
              final isConnected = Completer();

              chatWithVetBloc.listen((state) {
                if (state is ChatWithVetConnectSuccess && !isConnected.isCompleted) {
                  chatWithVetBloc.add(joinEvent);
                  isConnected.complete();
                }
              });

              expectLater(
                  chatWithVetBloc,
                  emitsInOrder([
                    ...successfulConnectionPredicates,
                    allOf(isA<ChatWithVetConnectSuccess>(), membersContains(vetMember)),
                  ]));

              chatWithVetBloc.add(startEvent);
            });

            test('-Join true adds a bot message to the state', () {
              final isConnected = Completer();

              chatWithVetBloc.listen((state) {
                if (state is ChatWithVetConnectSuccess && !isConnected.isCompleted) {
                  chatWithVetBloc.add(joinEvent);
                  isConnected.complete();
                }
              });

              expectLater(
                  chatWithVetBloc,
                  emitsInOrder([
                    ...successfulConnectionPredicates,
                    allOf(isA<ChatWithVetConnectSuccess>(), membersContains(vetMember)),
                    allOf(
                        isA<ChatWithVetConnectSuccess>(),
                        hasPendingMessageSatisfying(
                            (message) =>
                                message.attributes[messageTypeKey] == 'bot' &&
                                message.body == ChatWithVetChatMessages(ChatMessages()).vetJoined('Vet Jmj'),
                            'of type bot indicating the vet joined')), // Warn posting message on Channel
                  ]));

              chatWithVetBloc.add(startEvent);
            });

            test('-Leave true removes the member of the list of members', () {
              final isConnected = Completer();

              chatWithVetBloc.listen((state) {
                if (state is ChatWithVetConnectSuccess && !isConnected.isCompleted) {
                  chatWithVetBloc.add(joinEvent);
                  chatWithVetBloc.add(leaveEvent);
                  isConnected.complete();
                }
              });

              expectLater(
                  chatWithVetBloc,
                  emitsInOrder([
                    ...successfulConnectionPredicates,
                    allOf(isA<ChatWithVetConnectSuccess>(), membersContains(vetMember)),
                    allOf(isA<ChatWithVetConnectSuccess>(), membersDoesNotContain(vetMember)),
                  ]));

              chatWithVetBloc.add(startEvent);
            });

            test('-Leave with only one member emits a ChatWithVetTerminateSuccess', () {
              final isConnected = Completer();

              chatWithVetBloc.listen((state) {
                if (state is ChatWithVetConnectSuccess && !isConnected.isCompleted) {
                  chatWithVetBloc.add(joinEvent);
                  chatWithVetBloc.add(leaveEvent);
                  isConnected.complete();
                }
              });

              chatWithVetBloc.add(startEvent);
              expectLater(chatWithVetBloc, emitsThrough(isA<ChatWithVetTerminateSuccess>()));
            });
          });

          test('ChatWithVetClosed calls leave on Twilio', () async {
            final event = ChatWithVetClosed();

            chatWithVetBloc.add(startEvent);
            chatWithVetBloc.add(event);

            await expectLater(chatWithVetBloc, emitsThrough(isA<ChatWithVetTerminateSuccess>()));

            verify(mockTwilio.leaveChannel(channelSid));
            verify(mockTwilio.removeHandlers(channelSid));
          });

          group('After chat termination', () {
            Matcher hasProcessedFeedback() => predicate(
                (ChatWithVetTerminateSuccess state) => state.afterTerminateInput is ButtonsInputChatViewModel);
            Matcher hasRequestedFeedback() => predicate((ChatWithVetTerminateSuccess state) =>
                state.afterTerminateInput is YesNoViewModel &&
                (state.afterTerminateInput as YesNoViewModel).chatFlow is AskFeedbackChatWithVetFlow);
            final positiveFeedbackEvent = ChatWithVetFeedbackPressed((b) => b..answer = true);

            test('asks for feedback after chat has been terminated', () {
              chatWithVetBloc.add(startEvent);
              chatWithVetBloc.add(ChatWithVetClosed());
              expectLater(chatWithVetBloc, emitsThrough(hasRequestedFeedback()));
            });

            test('makes a call to analytics service when feedback is provided', () async {
              chatWithVetBloc.add(startEvent);
              chatWithVetBloc.add(ChatWithVetClosed());
              chatWithVetBloc.add(positiveFeedbackEvent);
              await expectLater(chatWithVetBloc, emitsThrough(hasProcessedFeedback()));
              verify(mockAnalyticsService.event.askAVet.logAskAVetHelpful(true));
            });
          });

          test('StreamSharingRequest sends a message on the channel', () {
            final roomSid = 'BarkiRoom';
            requestStreamSharing(roomSid);
            expect(
                (chatWithVetBloc as ChatWithVetBlocSpy).events, contains(videoStreamingRequestMessageMatcher(roomSid)));
          });
        });
      });
    });
  });
}

Matcher videoStreamingRequestMessageMatcher(String roomSid) => allOf(
      isA<ChatWithVetMessageSent>(),
      predicate((ChatWithVetMessageSent event) =>
          event.attributes[videoSharingKey] && event.attributes[videoSharingRoomSidKey] == roomSid),
    );

Matcher hasMessageCount(int count) =>
    predicate((ChatWithVetConnectSuccess state) => state.messages.length == count, 'count matches');

Matcher lastMessageBodyMatch(String body) =>
    predicate((ChatWithVetConnectSuccess state) => state.messages.last.body == body, 'body matches');

Matcher lastMessageAttributesContain(Map<String, dynamic> partial) => predicate((ChatWithVetConnectSuccess state) {
      final attributes = state.messages.last.attributes;
      return partial.keys.every((key) => attributes[key] == partial[key]);
    }, 'last message attributes contains');

Matcher hasPendingMessageSatisfying(bool Function(SimpleChatMessage) test, [String description = 'function']) =>
    predicate((ChatWithVetConnectSuccess state) {
      return state.pendingMessages.where(test).isNotEmpty;
    }, 'has a pendingMessage satisfying $description');

Matcher hasNoPendingMessage() => predicate((ChatWithVetConnectSuccess state) {
      return state.pendingMessages.isEmpty;
    }, 'has a pendingMessage satisfying function');

TwilioChannelCallbacks setupTwilioCallbacks(String channelSid, TwilioChatService mockTwilio) {
  final twilioChannelCallback = TwilioChannelCallbacks();

  when(mockTwilio.addOnMessageAddedHandler(channelSid, any)).thenAnswer((Invocation callback) async {
    twilioChannelCallback.onMessageAddedCallback =
        callback.positionalArguments[1] as Future<void> Function(TwilioMessage);
  });

  when(mockTwilio.addOnMemberJoinChannelHandler(channelSid, any)).thenAnswer((Invocation callback) async {
    twilioChannelCallback.onMemberJoinedCallback =
        callback.positionalArguments[1] as Future<void> Function(TwilioMember);
  });

  when(mockTwilio.addOnMemberLeaveChannelHandler(channelSid, any)).thenAnswer((Invocation callback) async {
    twilioChannelCallback.onMemberLeftCallback = callback.positionalArguments[1] as Future<void> Function(TwilioMember);
  });

  when(mockTwilio.addOnTypingHandler(channelSid, any)).thenAnswer((Invocation callback) async {
    twilioChannelCallback.onMemberTypedCallback =
        callback.positionalArguments[1] as Future<void> Function(TwilioMember, bool);
  });

  return twilioChannelCallback;
}

class TwilioChannelCallbacks {
  Future<void> Function(TwilioMessage) onMessageAddedCallback;
  Future<void> Function(TwilioMember) onMemberJoinedCallback;
  Future<void> Function(TwilioMember) onMemberLeftCallback;
  Future<void> Function(TwilioMember, bool) onMemberTypedCallback;
}
