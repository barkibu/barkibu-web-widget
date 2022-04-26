@TestOn('browser')

import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_test/angular_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:pageloader/html.dart';
import 'package:pageloader/testing.dart';
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;
import 'package:common_barkibu_dart/services/navigation_service.dart';

import 'page_objects/widget_po.dart';
import 'page_objects/chat_po.dart';
import 'aivet_chat_completion_test.template.dart' as self;
import 'utils/utils.dart';

NgTestFixture<AppComponent> fixture;
Router router;
WidgetPO widgetPO;
ChatPO chatPO;
NavigationService navigationService;
WidgetConfiguration configuration;
HtmlPageLoaderElement context;

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  String chatRequestAssessmentId;
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(
    ng.AppComponentNgFactory,
    rootInjector: injector.factory,
  );

  Future<void> initializeApp(requestHandler) async {
    initializeServiceLocator(requestHandler: requestHandler);
    storeAccessToken();
    fixture = await testBed.create();
    context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    router = injector.get<Router>(Router);
    navigationService = ServiceLocator.container.get<NavigationService>();
    configuration = ServiceLocator.container.get<Configuration>();

    when(configuration.telehealthChatEnabled).thenReturn(true);
    when(configuration.telehealthEmailEnabled).thenReturn(true);
    when(configuration.telehealthPhoneCallEnabled).thenReturn(true);
    when(configuration.telehealthChatEnabled).thenReturn(true);
    when(configuration.reminderEnabled).thenReturn(true);
    when(configuration.embeddedEmailClientEnabled).thenReturn(true);
    when(configuration.isChatMobileClient).thenReturn(false);
    await fixture.update();
    await widgetPO.navigateToAiVetChat();
    await fixture.update();
    chatPO = ChatPO.lookup(context);
  }

  tearDown(disposeAnyRunningTest);

  setUp(() async {
    chatRequestAssessmentId = null;
    Future<http.Response> successResponseHandler(http.Request request) async {
      if (isCurrentUserRequest(request)) {
        return currentUserResponse;
      }
      if (isPetsListRequest(request)) {
        return petsListResponse;
      }
      if (isActiveChatRequest(request)) {
        return activeChatResponse;
      }
      if (isShortLivedTokenRequest(request)) {
        return shortLivedTokenResponse;
      }

      if (request.url.pathSegments.last == 'symptoms') {
        var body = json.encode([
          {'key': 'sneezing', 'name': 'Sneezing', 'duration': false, 'frequency': false}
        ]);
        return Future.value(http.Response(body, 200));
      }

      if (request.url.pathSegments.last == 'anamnesis') {
        var body = json.encode(assessmentResultResponseBody);
        return Future.value(http.Response(body, 200));
      }

      if (request.url.path == '/assessments/${assessmentResultResponseBody["consultationId"]}') {
        var body = json.encode(assessmentResultResponseBody);
        return Future.value(http.Response(body, 200));
      }

      if (request.url.path == '/chats/new') {
        chatRequestAssessmentId = request.url.queryParameters['aivetConsultationId'];
      }

      return defaultResponse;
    }

    await initializeApp(successResponseHandler);
  });

  test('Viewing assessment report after aivet consultation', () async {
    final condition1 = assessmentResultResponseBody['conditions'][0];
    final condition2 = assessmentResultResponseBody['conditions'][1];
    final symptom = assessmentResultResponseBody['symptoms'][0];
    expect(chatPO.messages.receivedMessages(), contains('Which pet would you like to talk about?'));
    await chatPO.controls.selectOption('Snoopy');
    await fixture.update();
    await chatPO.controls.enterText('sneezing');
    await fixture.update();
    await chatPO.controls.selectOption('Sneezing');
    await fixture.update();
    await chatPO.controls.selectYesNoOption('No');
    await fixture.update();
    await chatPO.controls.clickActionButton('Open report');
    await fixture.update();
    expect(chatPO.report.hasUrgentConditionNextStep('Snoopy'), isTrue);
    expect(chatPO.report.hasSymptomInfo(symptom, 0), isTrue);
    expect(condition1, chatPO.report.isConditionIndexed(1));
    expect(condition2, chatPO.report.isConditionIndexed(0));
    await chatPO.report.openSymptomInformation(0);
    await fixture.update();
    expect(widgetPO.symptomInfoScreen.showsInfo(symptom['name'], symptom['article']), isTrue);
    await widgetPO.goBack();
    await fixture.update();
    await chatPO.report.openConditionInformation(0);
    await fixture.update();
    expect(widgetPO.symptomInfoScreen.showsInfo(condition2['name'], condition2['article']), isTrue);
    await fixture.update();
    await widgetPO.goBack();
    await fixture.update();
    await chatPO.reportContinueAssessment();
    await fixture.update();
    await chatPO.givePositiveFeedback();
    await fixture.update();
    await chatPO.controls.clickChatButton('Talk with a vet');
    await fixture.update();
    await chatPO.controls.selectOption('Chat');
    await fixture.update();
    expect(widgetPO.chatWithVet, exists);
    expect(chatRequestAssessmentId, assessmentResultResponseBody['consultationId']);
  });

  test('Shows ask a vet contact options from assessment report', () async {
    await chatPO.controls.selectOption('Snoopy');
    await fixture.update();
    await chatPO.controls.enterText('sneezing');
    await fixture.update();
    await chatPO.controls.selectOption('Sneezing');
    await fixture.update();
    await chatPO.controls.selectYesNoOption('No');
    await fixture.update();
    await chatPO.controls.clickActionButton('Open report');
    await fixture.update();
    final expectedUrl = "http://example.com/pets/${petsListResponseBody[0]['pet']['id']}"
        "/reports/${assessmentResultResponseBody['consultationId']}"
        "?token=${shortLivedTokenResponseBody['token']}&locale=en";
    expect(chatPO.report.exportUrl, expectedUrl);
    await chatPO.reportAskAVet();
    await fixture.update();
    expect(chatPO.askAVetContactModal, exists);
  });

  test('Returning from ask a vet chat after assessment report', () async {
    await chatPO.controls.selectOption('Snoopy');
    await fixture.update();
    await chatPO.controls.enterText('sneezing');
    await fixture.update();
    await chatPO.controls.selectOption('Sneezing');
    await fixture.update();
    await chatPO.controls.selectYesNoOption('No');
    await fixture.update();

    final receivedMessages = chatPO.messages.receivedMessages();
    final sentMessages = chatPO.messages.sentMessages();

    await chatPO.controls.clickActionButton('Open report');
    await fixture.update();
    await chatPO.reportAskAVet();
    await fixture.update();
    expect(chatPO.askAVetContactModal, exists);
    await chatPO.askAVetFromModal();
    await fixture.update();
    await widgetPO.goBack();
    await fixture.update();

    final reloadedChatPO = ChatPO.lookup(context);
    expect(reloadedChatPO.messages.receivedMessages(), containsAll(receivedMessages));
    expect(reloadedChatPO.messages.sentMessages(), containsAll(sentMessages));
  });
  test('Shows email sender component when finished all aivet flow', () async {
    when(configuration.embeddedEmailClientEnabled).thenReturn(true);
    when(configuration.telehealthEnabled).thenReturn(true);
    when(configuration.telehealthEmailEnabled).thenReturn(true);
    await chatPO.controls.selectOption('Snoopy');
    await fixture.update();
    await chatPO.controls.enterText('sneezing');
    await fixture.update();
    await chatPO.controls.selectOption('Sneezing');
    await fixture.update();
    await chatPO.controls.selectYesNoOption('No');
    await fixture.update();
    await chatPO.controls.clickActionButton('Open report');
    await fixture.update();
    await chatPO.reportAskAVet();
    await fixture.update();
    expect(chatPO.askAVetContactModal, exists);
    await chatPO.askAVetFromModal();
    await fixture.update();
    await widgetPO.goBack();
    await fixture.update();
    await chatPO.controls.selectYesNoOption('Yes');
    await fixture.update();
    await chatPO.controls.clickChatButton('Talk with a vet');
    await fixture.update();
    await chatPO.controls.selectOption('Email');
    await fixture.update();
    await chatPO.controls.clickChatButton('Ok');
    await fixture.update();
    expect(chatPO.emailSender.isEmailAddressPresent, true);
    expect(chatPO.emailSender.isEmailTextAreaPresent, true);
    await chatPO.emailSender.sendMail();
    await fixture.update();
    expect(chatPO.emailSender.isInfoMessageDisplayed, true);
  });

  test('Opens feedback form', () async {
    when(configuration.englishFeedbackUrl).thenReturn('http://dummy.com');
    await chatPO.controls.selectOption('Snoopy');
    await fixture.update();
    await chatPO.controls.enterText('sneezing');
    await fixture.update();
    await chatPO.controls.selectOption('Sneezing');
    await fixture.update();
    await chatPO.controls.selectYesNoOption('No');
    await fixture.update();
    await chatPO.controls.clickActionButton('Open report');
    await fixture.update();
    await chatPO.reportContinueAssessment();
    await fixture.update();
    await chatPO.givePositiveFeedback();
    await fixture.update();
    final expectedUrl =
        'http://dummy.com?pet_parent_id=1&pet_id=1&species=dog&pet_age_range=2010-01-01&aivet_only=true&conditions_shown=2&aivet_helpful=true&consultation_id=5ebc134cecc6280253e6d804&country=Undefined&version=null&interface=widget&symptom_article_shown=1';
    verify(navigationService.launchUrl(expectedUrl));
  });
}
