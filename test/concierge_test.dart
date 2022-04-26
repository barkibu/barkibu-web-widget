import 'dart:convert';

@TestOn('browser')
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_test/angular_test.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:pageloader/html.dart';
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;

import 'page_objects/chat_po.dart';
import 'page_objects/widget_po.dart';
import 'ask_a_vet_test.template.dart' as self;
import 'utils/utils.dart';

Matcher mapContains(Map<String, dynamic> expected) {
  return predicate((map) {
    if (map is! Map) {
      return false;
    }
    var expectationPassed = true;
    expected.forEach((key, value) {
      if (value is Matcher) {
        if (!value.matches(map[key], {})) {
          expectationPassed = false;
        }
      } else if (map[key] != value) {
        expectationPassed = false;
      }
    });
    return expectationPassed;
  }, 'Message does not include: ${expected}');
}

NgTestFixture<AppComponent> fixture;
Router router;
TwilioTestChatService twilio;
WidgetPO widgetPO;
WidgetConfiguration config;

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

class MockConciergeConnector extends Mock implements ConciergeConnector {
  @override
  Function(dynamic) onMessageReceived;
  @override
  Function() onConnectionErrored;
}

void main() {
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory, rootInjector: injector.factory);
  ChatPO chatPO;
  ParentWindowService parentWindow;
  MockConciergeConnector conciergeConnector;

  Future<void> initializeApp(requestHandler) async {
    conciergeConnector = MockConciergeConnector();
    initializeServiceLocator(requestHandler: requestHandler);
    ServiceLocator.container.registerSingleton<ConciergeConnector>(conciergeConnector);
    storeAccessToken();
    fixture = await testBed.create();
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    router = injector.get<Router>(Router);
    config = injector.get<WidgetConfiguration>(WidgetConfiguration);
    parentWindow = injector.get<ParentWindowService>(ParentWindowService);
    when(config.conciergeUrl).thenReturn('ws://myconcierge.barkibu.com');
    when(config.externalLinksEventsEnabled).thenReturn(true);
    await fixture.update();
    final query = NavigationParams(queryParameters: {'chatType': 'concierge'});
    await router.navigate('/chat', query);
    await fixture.update();
    chatPO = ChatPO.lookup(context);
  }

  tearDown(disposeAnyRunningTest);

  setUp(() async {
    Future<http.Response> successResponseHandler(http.Request request) async {
      if (isCurrentUserRequest(request)) {
        return currentUserResponse;
      } else if (isActiveChatRequest(request)) {
        return activeChatResponse;
      } else if (isPetsListRequest(request)) {
        return petsListResponse;
      }
      return defaultResponse;
    }

    await initializeApp(successResponseHandler);
  });

  String textMessageEvent(String text) => '{"type":"text","body":"$text"}';
  String buttonsMessageEvent(String label,
      {List<String> payloadOptions = const [], List<String> urlOptions = const []}) {
    return jsonEncode({
      'type': 'button',
      'body': label,
      'buttons': payloadOptions
          .map((String opt) => {
                'type': 'payload',
                'payload': {'id': opt},
                'text': opt
              })
          .toList()
            ..addAll(urlOptions.map((String url) => {
                  'type': 'url',
                  'text': 'URL_TEXT: $url',
                  'url': url,
                  'name': 'URL_NAME: $url',
                })),
    });
  }

  final welcomeMessage = 'Hi I am the concierge, what do you want?';
  final vaccinationInfoSelectionLabel = 'Which option do you prefer';
  final whenToVaccinateLabel = 'When to vaccinate?';
  final whatVaccinsLabel = 'When vaccins should I give my pet?';
  final vaccinationInfoSelectionEvent = buttonsMessageEvent(vaccinationInfoSelectionLabel, payloadOptions: [
    whenToVaccinateLabel,
    whatVaccinsLabel,
  ]);
  final petDefintionHandoverEvent = '{"type":"event","name":"pet_definition"}';

  final whenToVaccinateLabel1 = 'when young';
  final whenToVaccinateLabel2 = 'when adult';
  final whenToVaccinateLabel3 = 'when dead';
  final whenToVaccinateEvent1 = '{"type":"text","body":"$whenToVaccinateLabel1"}';
  final whenToVaccinateEvent2 = '{"type":"text","body":"$whenToVaccinateLabel2"}';
  final whenToVaccinateEvent3 = '{"type":"text","body":"$whenToVaccinateLabel3"}';

  final buttonsMessageWithUrl = buttonsMessageEvent(vaccinationInfoSelectionLabel, payloadOptions: [
    whatVaccinsLabel,
  ], urlOptions: [
    'myUrl'
  ]);
  test('Chatting with the concierge', () async {
    verify(conciergeConnector.send(any)).called(1);
    conciergeConnector.onMessageReceived(textMessageEvent(welcomeMessage));
    await fixture.update();
    expect(chatPO.messages.receivedMessages(), contains(welcomeMessage));

    await chatPO.controls.enterText('Vaccination');
    await fixture.update();
    verify(conciergeConnector.send(argThat(mapContains({'message': 'Vaccination'})))).called(1);
    expect(chatPO.messages.sentMessages(), contains('Vaccination'));

    conciergeConnector.onMessageReceived(petDefintionHandoverEvent);
    await fixture.update();
    await fixture.update();
    expect(chatPO.messages.receivedMessages(), contains('Which pet would you like to talk about?'));
    expect(chatPO.controls.listSelectOptions(), contains('Snoopy'));
    expect(chatPO.controls.listSelectOptions(), contains('Purry'));
    expect(chatPO.controls.listSelectOptions(), contains('Add a pet'));

    await chatPO.controls.selectOption('Snoopy');
    await fixture.update();
    expect(chatPO.messages.sentMessages(), contains('Snoopy'));

    final snoopyPredicate = predicate((Pet pet) => pet.name == 'Snoopy', 'is named Snoopy');
    verify(conciergeConnector.send(argThat(mapContains({'payload': allOf(isA<Pet>(), snoopyPredicate)})))).called(1);

    conciergeConnector.onMessageReceived(vaccinationInfoSelectionEvent);
    await fixture.update();
    expect(chatPO.messages.receivedMessages(), contains(vaccinationInfoSelectionLabel));
    expect(chatPO.controls.listSelectOptions(), contains(whatVaccinsLabel));
    expect(chatPO.controls.listSelectOptions(), contains(whenToVaccinateLabel));

    await chatPO.controls.selectOption(whenToVaccinateLabel);
    await fixture.update();
    verify(conciergeConnector.send(argThat(mapContains({'message': whenToVaccinateLabel})))).called(1);
    expect(chatPO.messages.sentMessages(), contains(whenToVaccinateLabel));

    conciergeConnector.onMessageReceived(whenToVaccinateEvent1);
    conciergeConnector.onMessageReceived(whenToVaccinateEvent2);
    conciergeConnector.onMessageReceived(whenToVaccinateEvent3);
    await fixture.update();
    expect(
        chatPO.messages.receivedMessages(),
        containsAllInOrder([
          whenToVaccinateLabel1,
          whenToVaccinateLabel2,
          whenToVaccinateLabel3,
        ]));

    conciergeConnector.onMessageReceived(buttonsMessageWithUrl);
    await fixture.update();
    expect(chatPO.controls.listSelectOptions(), contains('URL_TEXT: myUrl'));
    await chatPO.controls.selectOption('URL_TEXT: myUrl');
    await fixture.update();
    verify(parentWindow.notifyRedirectionRequested('URL_NAME: myUrl', 'myUrl'));
  });
}
