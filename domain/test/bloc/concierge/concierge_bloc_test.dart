import 'dart:async';
import 'dart:convert';

import 'package:common_barkibu_dart/bloc/bloc.dart';
import 'package:common_barkibu_dart/datasources/concierge/concierge_connector.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../service_locator.dart' as test_service_locator;
import '../utils/map_matcher.dart';
import '../utils/view_model_matcher.dart';

class MockLocaleService extends Mock implements LocaleService {}

class MockAuthDatasource extends Mock implements AuthDatasource {}

class MockConciergeConnector extends Mock implements ConciergeConnector {
  @override
  Function(dynamic) onMessageReceived;
  @override
  Function() onConnectionErrored;
}

class SpyConciergeBloc extends ConciergeBloc {
  SpyConciergeBloc(AuthDatasource authDatasource) : super(authDatasource);

  final eventStreamController = StreamController<ConciergeEvent>();

  @override
  void add(ConciergeEvent event) {
    eventStreamController.add(event);
    super.add(event);
  }
}

void main() {
  test_service_locator.ServiceLocator.setup();
  LocaleService localeService;
  ConciergeConnector conciergeConnector;
  MockAuthDatasource mockAuthDatasource;
  SpyConciergeBloc conciergeBloc;

  ServiceLocator.container.registerFactory<ConciergeConnector>(() => conciergeConnector);
  ServiceLocator.container.unregister<LocaleService>();
  ServiceLocator.container.registerFactory<LocaleService>(() => localeService);

  void initializeBloc() {
    mockAuthDatasource = MockAuthDatasource();
    conciergeBloc?.close();
    localeService = MockLocaleService();
    conciergeConnector = MockConciergeConnector();
    conciergeBloc = SpyConciergeBloc(mockAuthDatasource);
  }

  setUp(() {
    initializeBloc();
  });

  tearDown(() {
    conciergeBloc?.close();
  });

  test('Initial State is ConciergeInitial', () {
    final initialState = conciergeBloc.state;
    expect(initialState, isA<ConciergeInitial>());
  });

  final startedEvent = ConciergeStarted();

  group('ConciergeStarted', () {
    test('Sends an initial message with the locale', () async {
      final locale = 'pt';
      when(localeService.currentLocale).thenReturn(locale);
      scheduleMicrotask(() {
        conciergeBloc.add(startedEvent);
      });

      await expectLater(
          conciergeBloc,
          emitsInOrder([
            isA<ConciergeInitial>(),
            isA<ConciergeTurnSuccessful>(),
          ]));
      verify(conciergeConnector.send(argThat(mapContains({
        'payload': mapContains({'locale': locale})
      }))));
    });

    test('binds listener on Connector', () async {
      scheduleMicrotask(() {
        conciergeBloc.add(startedEvent);
      });

      await expectLater(
          conciergeBloc,
          emitsInOrder([
            isA<ConciergeInitial>(),
            isA<ConciergeTurnSuccessful>(),
          ]));

      expect(conciergeConnector.onConnectionErrored, isNotNull);
      expect(conciergeConnector.onMessageReceived, isNotNull);
    });
  });

  group('Sending a message to the concierge', () {
    final message = 'My message to the concierge';
    final payload = {'foo': 'bar'};
    final petParentMsgEvent = ConciergeMessageSent<Map<String, String>>(message: message, payload: payload);

    test('Message is sent on the connector', () async {
      scheduleMicrotask(() {
        conciergeBloc.add(startedEvent);
        conciergeBloc.add(petParentMsgEvent);
      });
      await expectLater(
          conciergeBloc,
          emitsInOrder([
            isA<ConciergeInitial>(),
            allOf(
              isA<ConciergeTurnSuccessful>(),
              isNot(hasViewModel<ChatViewModel>()),
            ),
            allOf(
              isA<ConciergeTurnSuccessful>(),
              hasViewModel<ChatViewModel>(),
            ),
          ]));

      verify(conciergeConnector.send({'message': message, 'payload': payload}));
    });
  });

  group('Receiving a buttons message from the concierge', () {
    final body = 'Concierge Is Asking for a selection!';
    final url = 'http://barkibu.com/blog';
    final urlButtonName = 'barkibu_blog_article_url';
    final buttonPayload = {'id': '1', 'type': 'AnswerOption'};
    final buttonMessage = json.encode({
      'type': 'button',
      'body': body,
      'buttons': [
        {'type': 'url', 'url': url, 'name': urlButtonName},
        {'type': 'payload', 'payload': buttonPayload}
      ]
    });
    final conciergeMsgEvent = ConciergeMessageReceived(buttonMessage);

    Matcher stateContainOption(bool Function(OptionViewModel) check, String description) {
      return predicate((ConciergeState state) {
        final inputViewModel = state.viewModel as SingleOptionsSelectorViewModel;
        return inputViewModel.items.any(check);
      }, 'Options contain at least one element with $description');
    }

    test('SingleOptionsSelectorViewModel is emitted with the Url/Payload Options', () {
      expectLater(
          conciergeBloc,
          emitsInOrder([
            isA<ConciergeInitial>(),
            allOf(
              isA<ConciergeTurnSuccessful>(),
              isNot(hasViewModel<ChatViewModel>()),
            ),
            allOf(
                isA<ConciergeTurnSuccessful>(),
                hasViewModel<MessageChatViewModel>(),
                predicate((ConciergeState state) => (state.viewModel as MessageChatViewModel).message == body,
                    'message body is `$body`')),
            allOf(
              isA<ConciergeTurnSuccessful>(),
              hasViewModel<SingleOptionsSelectorViewModel>(),
              stateContainOption((item) {
                return item.key is MessageUrlButtonDefinition && item.key.url == url;
              }, 'is MessageUrlButtonDefinition'),
              stateContainOption((item) {
                return item.key is MessagePayloadButtonDefinition && item.key.payload.id == buttonPayload['id'];
              }, 'is MessagePayloadButtonDefinition'),
            )
          ]));

      conciergeBloc.add(startedEvent);
      conciergeBloc.add(conciergeMsgEvent);
    });
  });

  group('Receiving a message from the concierge', () {
    final body = 'Concierge is Saying What?';
    final messageFromConcierge = json.encode({'type': 'text', 'body': body});
    final conciergeMsgEvent = ConciergeMessageReceived(messageFromConcierge);
    final conciergeMsgEventMatcher = allOf([
      isA<ConciergeMessageReceived>(),
      predicate((ConciergeMessageReceived event) => event.payload == messageFromConcierge)
    ]);
    test('Connector event triggers a ConciergeMessageReceived event', () async {
      scheduleMicrotask(() {
        conciergeBloc.add(startedEvent);
      });
      await expectLater(conciergeBloc, emitsThrough(isA<ConciergeTurnSuccessful>()));
      scheduleMicrotask(() {
        conciergeConnector.onMessageReceived(messageFromConcierge);
      });
      await expectLater(conciergeBloc.eventStreamController.stream, emitsThrough(conciergeMsgEventMatcher));
    });

    test('Turn is emitted with a MessageChatViewModel', () {
      expectLater(
          conciergeBloc,
          emitsInOrder([
            isA<ConciergeInitial>(),
            allOf(
              isA<ConciergeTurnSuccessful>(),
              isNot(hasViewModel<ChatViewModel>()),
            ),
            allOf(
                isA<ConciergeTurnSuccessful>(),
                hasViewModel<MessageChatViewModel>(),
                predicate((ConciergeState state) => (state.viewModel as MessageChatViewModel).message == body,
                    'message body is `$body`')),
          ]));

      conciergeBloc.add(startedEvent);
      conciergeBloc.add(conciergeMsgEvent);
    });
  });

  group('Handover', () {
    group('Received Message of type', () {
      final aivetHandoverPayload = json.encode({'type': 'event', 'name': 'virtual_vet'});
      final petDefinitionHandoverPayload = json.encode({'type': 'event', 'name': 'pet_definition'});
      final aivetHandoverMsgEvent = ConciergeMessageReceived(aivetHandoverPayload);
      final petDefinitionHandoverMsgEvent = ConciergeMessageReceived(petDefinitionHandoverPayload);

      test('Virtual Vet adds a handover event', () {
        expectLater(
          conciergeBloc.eventStreamController.stream,
          emitsThrough(
            allOf(
              isA<ConciergeHandoverReceived>(),
              predicate((ConciergeHandoverReceived state) => state.type == HandoverType.virtualVet),
            ),
          ),
        );
        conciergeBloc.add(aivetHandoverMsgEvent);
      });

      test('PetDefinition adds a handover event', () {
        expectLater(
          conciergeBloc.eventStreamController.stream,
          emitsThrough(
            allOf(
              isA<ConciergeHandoverReceived>(),
              predicate((ConciergeHandoverReceived state) => state.type == HandoverType.petDefinition),
            ),
          ),
        );
        conciergeBloc.add(petDefinitionHandoverMsgEvent);
      });
    });

    test('Completion sends a message to the concierge', () async {
      final completionPayload = {'foo': 'bar', 'boolValue': false};

      conciergeBloc.add(startedEvent);
      conciergeBloc.add(ConciergeHandoverCompleted<Map<String, dynamic>>(completionPayload));
      await conciergeBloc.close();

      verify(conciergeConnector.send(argThat(mapContains({'payload': completionPayload}))));
    });
  });
}
