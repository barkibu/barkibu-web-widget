@TestOn('browser')

import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_test/angular_test.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:pageloader/html.dart';
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;

import 'page_objects/widget_po.dart';
import 'page_objects/chat_po.dart';
import 'aivet_chat_flow_test.template.dart' as self;
import 'utils/utils.dart';

NgTestFixture<AppComponent> fixture;
WidgetPO widgetPO;
ChatPO chatPO;
NavigationService navigationService;
WidgetConfiguration configuration;

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  final birthdate = '2018-01-01';
  final months = Birthdate.getMonthOld(birthdate);
  final years = Birthdate.getYearsOld(birthdate);
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(
    ng.AppComponentNgFactory,
    rootInjector: injector.factory,
  );

  Future<void> initializeApp(requestHandler) async {
    initializeServiceLocator(requestHandler: requestHandler);
    storeAccessToken();
    fixture = await testBed.create();
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    await fixture.update();
    await widgetPO.navigateToAiVetChat();
    await fixture.update();
    chatPO = ChatPO.lookup(context);
    navigationService = ServiceLocator.container.get<NavigationService>();
    configuration = ServiceLocator.container.get<Configuration>();
    when(configuration.reminderEnabled).thenReturn(true);
    when(configuration.isChatMobileClient).thenReturn(false);
    when(configuration.embeddedEmailClientEnabled).thenReturn(true);
  }

  tearDown(disposeAnyRunningTest);

  setUp(() async {
    var anamnesisRequestCount = 0;
    Future<http.Response> successResponseHandler(http.Request request) async {
      if (isCurrentUserRequest(request)) {
        return currentUserResponse;
      }
      if (isPetsListRequest(request)) {
        return petsListResponse;
      }

      if (request.url.pathSegments.last == 'pets' && request.method == 'POST') {
        var requestBody = json.decode(request.body);
        expect(requestBody['pet']['name'], 'New pet');
        expect(requestBody['pet']['species'], 'dog');
        expect(requestBody['pet']['gender'], 'male');
        expect(requestBody['pet']['neutered'], true);
        expect(requestBody['pet']['birthdate'], birthdate);

        var body = json.encode({
          'pet': {
            'name': 'New pet',
            'species': 'dog',
            'gender': 'male',
            'neutered': true,
            'birthdate': birthdate,
            'healthPlanDetails': {}
          }
        });
        return Future.value(http.Response(body, 200));
      }

      if (isSymptomSearchRequest(request)) {
        return symptomSearchResponse;
      }

      if (request.url.pathSegments.last == 'anamnesis' && anamnesisRequestCount == 0) {
        var body = json.encode(anamnesisNextQuetionResponseBody);
        anamnesisRequestCount++;
        return Future.value(http.Response(body, 200));
      }

      if (request.url.pathSegments.last == 'anamnesis' && anamnesisRequestCount == 1) {
        var requestBody = json.decode(request.body);

        expect(requestBody['symptoms'][0],
            {'duration': 'short', 'frequency': 'low', 'key': 'sneezing', 'presence': 'yes'});
        expect(requestBody['consultationId'], '5ebc134cecc6280253e6d804');

        var body = json.encode(assessmentResultResponseBody);
        return Future.value(http.Response(body, 200));
      }

      if (request.url.path == '/assessments/${assessmentResultResponseBody["consultationId"]}') {
        return Future.value(http.Response(json.encode(assessmentResultResponseBody), 200));
      }

      if (isActiveChatRequest(request)) {
        return activeChatResponse;
      }
      return defaultResponse;
    }

    await initializeApp(successResponseHandler);
  });

  test('Allows aivet consultation', () async {
    when(configuration.englishFeedbackUrl).thenReturn('http://dummy.com');

    expect(chatPO.messages.receivedMessages(), contains('Which pet would you like to talk about?'));
    expect(chatPO.controls.listSelectOptions(), contains('Snoopy'));
    expect(chatPO.controls.listSelectOptions(), contains('Purry'));
    expect(chatPO.controls.listSelectOptions(), contains('Add a pet'));
    await chatPO.controls.selectOption('Snoopy');
    await fixture.update();
    expect(chatPO.messages.sentMessages(), contains('Snoopy'));
    expect(chatPO.messages.receivedMessages(), contains('What is the primary symptom Snoopy is experiencing?'));
    await chatPO.controls.enterText('sneezing');
    await fixture.update();
    expect(chatPO.messages.sentMessages(), contains('sneezing'));
    expect(chatPO.controls.listSelectOptions(), contains('Sneezing'));
    expect(chatPO.controls.listSelectOptions(), contains('Wheezing'));
    expect(chatPO.controls.listSelectOptions(), contains('None of these'));
    await chatPO.controls.selectOption('Sneezing');
    await fixture.update();
    expect(chatPO.messages.receivedMessages(), contains('Got it. Symptom is Sneezing'));
    expect(chatPO.messages.receivedMessages(), contains('How long has this symptom been going on?'));
    expect(chatPO.controls.listSelectOptions(), contains('Unknown'));
    expect(chatPO.controls.listSelectOptions(), contains('less than 1 day'));
    expect(chatPO.controls.listSelectOptions(), contains('1-3 days'));
    expect(chatPO.controls.listSelectOptions(), contains('4 days or more'));
    await chatPO.controls.selectOption('less than 1 day');
    await fixture.update();
    expect(chatPO.messages.sentMessages(), contains('less than 1 day'));
    expect(chatPO.messages.receivedMessages(), contains('How many times has it been happening?'));
    expect(chatPO.controls.listSelectOptions(), contains('Unknown'));
    expect(chatPO.controls.listSelectOptions(), contains('once or less per day'));
    expect(chatPO.controls.listSelectOptions(), contains('2 to 5 times per day'));
    expect(chatPO.controls.listSelectOptions(), contains('6 or more times per day'));
    await chatPO.controls.selectOption('once or less per day');
    await fixture.update();
    expect(chatPO.messages.sentMessages(), contains('once or less per day'));
    expect(chatPO.messages.receivedMessages(), contains('Does Snoopy have a runny nose?'));
    await chatPO.messages.learnMore('Does Snoopy have a runny nose?');
    await fixture.update();
    expect(
        widgetPO.symptomInfoScreen.showsInfo(anamnesisNextQuetionResponseBody['nextQuestion']['symptomName'],
            anamnesisNextQuetionResponseBody['nextQuestion']['hint']),
        isTrue);
    await widgetPO.goBack();
    await fixture.update();
    await chatPO.controls.selectYesNoOption('Yes');
    await fixture.update();
    expect(chatPO.messages.sentMessages(), contains('Yes'));
    expect(chatPO.messages.receivedMessages(), contains('How many times has it been happening?'));
    await chatPO.controls.selectOption('6 or more times per day');
    await fixture.update();
    expect(chatPO.messages.sentMessages(), contains('6 or more times per day'));
    expect(chatPO.messages.receivedMessages(), contains('Does Snoopy have any other symptoms you’d like to add?'));
    await chatPO.controls.selectYesNoOption('No');
    await fixture.update();
    expect(chatPO.messages.receivedMessages(),
        contains('All done! I have put together a report that outlines possible causes for those symptoms'));
    expect(
        chatPO.messages.receivedMessages(),
        contains(
            'Don\'t forget that this is not a medical diagnosis. If in doubt, it is always best to seek advice from a veterinarian'));
    await chatPO.controls.clickActionButton('Open report');
    await fixture.update();
    await chatPO.reportContinueAssessment();
    await fixture.update();
    expect(chatPO.messages.sentMessages(), contains('Open report'));
    expect(chatPO.messages.receivedMessages(),
        contains("Remember that you can always come back to Snoopy's profile to check the assessment report again"));
    expect(chatPO.messages.receivedMessages(), contains('Has my answer been helpful?'));
    await chatPO.givePositiveFeedback();
    await fixture.update();
    verify(navigationService.launchUrl(any));
    expect(chatPO.messages.sentMessages(), contains('Yes'));
    expect(chatPO.messages.receivedMessages(), contains('What can I help you with next?'));
    await chatPO.controls.clickChatButton('Ask another question');
    await fixture.update();
    expect(chatPO.controls.listSelectOptions(), contains('Snoopy'));
    expect(chatPO.controls.listSelectOptions(), contains('Purry'));
  });

  test('Allows user to add a pet as part of chat flow', () async {
    when(configuration.petBreedEnabled).thenReturn(false);
    expect(chatPO.messages.receivedMessages(), contains('Which pet would you like to talk about?'));
    await chatPO.controls.selectOption('Add a pet');
    await fixture.update();
    expect(chatPO.messages.receivedMessages(), contains('What is your pet’s name?'));
    await chatPO.controls.enterText('New pet');
    await fixture.update();
    expect(chatPO.messages.sentMessages(), contains('New pet'));
    expect(chatPO.messages.receivedMessages(), contains('Is New pet a Dog or a Cat?'));
    expect(chatPO.controls.listSelectOptions(), contains('Dog'));
    expect(chatPO.controls.listSelectOptions(), contains('Cat'));
    await chatPO.controls.selectOption('Dog');
    await fixture.update();
    expect(chatPO.messages.sentMessages(), contains('Dog'));
    expect(chatPO.messages.receivedMessages(), contains('How old is New pet?'));
    await chatPO.messages.learnMore('How old is New pet?');
    await fixture.update();
    expect(widgetPO.symptomInfoScreen.showsAgeInfo('Dog'), isTrue);
    await widgetPO.goBack();
    await fixture.update();
    await chatPO.controls.enterAge(years, months);
    await fixture.update();
    await chatPO.controls.submitAge();
    await fixture.update();
    expect(chatPO.messages.sentMessages(), contains('$years years $months months'));
    expect(chatPO.messages.receivedMessages(), contains('Is New pet a he or she?'));
    expect(chatPO.controls.listSelectOptions(), contains('Male'));
    expect(chatPO.controls.listSelectOptions(), contains('Female'));
    await chatPO.controls.selectOption('Male');
    await fixture.update();
    expect(chatPO.messages.sentMessages(), contains('Male'));
    expect(chatPO.messages.receivedMessages(), contains('Is New pet castrated?'));
    await chatPO.controls.selectYesNoOption('Yes');
    await fixture.update();
    expect(chatPO.messages.sentMessages(), contains('Yes'));
    expect(chatPO.messages.receivedMessages(), contains('What is the primary symptom New pet is experiencing?'));
  });
}
