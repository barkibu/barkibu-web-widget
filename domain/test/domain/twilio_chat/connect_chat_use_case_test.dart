import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockChatRepository extends Mock implements ChatRepository {}

class MockTwilioChatService extends Mock implements TwilioChatService {}

void main() {
  group('ConnectChatUseCase (unit)', () {
    final mockTwilioService = MockTwilioChatService();
    final mockChatRepository = MockChatRepository();

    final connectChatUseCase = ConnectChatUseCaseImpl(mockTwilioService, mockChatRepository);

    group('#retrieveActionChatConnection', () {
      test('asks the repository for an active chat', () async {
        await connectChatUseCase.retrieveActiveChatConnection();
        verify(mockChatRepository.getActiveChat()).called(1);
      });

      group('without any currently active chat', () {
        test('returns null', () async {
          when(mockChatRepository.getActiveChat()).thenAnswer((_) => Future.value(null));

          final activeChatConnection = await connectChatUseCase.retrieveActiveChatConnection();
          expect(activeChatConnection, null);
        });
      });

      group('with an active chat', () {
        final channelSid = 'CH_XXX_TEST';
        final accessToken = 'fakeAccessToken';
        final consultationId = 'aivet-consultation-id';
        final petId = 3;

        final channel = ActiveChannel(
          accessToken: accessToken,
          channelSid: channelSid,
          consultationId: consultationId,
          petId: petId,
        );

        setUp(() {
          reset(mockTwilioService);
          when(mockChatRepository.getActiveChat()).thenAnswer((_) => Future.value(channel));
        });

        test('returns an ActiveChatConnection with the provided Channel Sid', () async {
          final activeChatConnection = await connectChatUseCase.retrieveActiveChatConnection();
          expect(activeChatConnection, isA<ActiveChatConnection>());
          expect(activeChatConnection.channelSid, channelSid);
        });

        test('initialize the twilioService', () async {
          await connectChatUseCase.retrieveActiveChatConnection();
          verify(mockTwilioService.init()).called(1);
        });

        test('initialize the twilioService chat client', () async {
          await connectChatUseCase.retrieveActiveChatConnection();
          verify(mockTwilioService.initChatClient(accessToken)).called(1);
        });

        group('given a failing twilioService initialization', () {
          final exception = Exception('Token Expired');
          setUp(() {
            when(mockTwilioService.initChatClient(any)).thenThrow(exception);
          });

          test('error is propagated to be handle as client decides [Monitoring/Ignore]', () async {
            expect(() async => await connectChatUseCase.retrieveActiveChatConnection(), throwsA(exception));
          });
        });
      });
    });
  });
}
