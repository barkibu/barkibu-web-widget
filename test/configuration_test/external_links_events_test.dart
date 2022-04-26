@TestOn('browser')

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:pageloader/html.dart';
import 'package:mockito/mockito.dart';
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;

import 'external_links_events_test.template.dart' as self;
import '../page_objects/nutrition_history_po.dart';
import '../page_objects/pet_assessment_history_po.dart';
import '../page_objects/chat_po.dart';
import '../utils/utils.dart';

NgTestFixture<AppComponent> fixture;
HtmlPageLoaderElement context;
WidgetConfiguration config;
ParentWindowService parentWindow;

/// See [nutribotConsultations1]
final firstConsultationDate = '10/08/20';
final pet = nutribotConsultations1['pet'] as Map;

/// See [assessmentHitoryResponseBody]
final symptom = assessmentResultResponseBody['symptoms'][0];
final consultationId = assessmentResultResponseBody['consultationId'];
final exportUrl = "http://example.com/pets/${pet['id']}/reports/${consultationId}"
    "?token=${shortLivedTokenResponseBody['token']}&locale=en";

final chatPet = petsListResponseBody[0]['pet'];
final phoneNumber = '12345';
final phonePrefix = '+0';

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory, rootInjector: injector.factory);

  Future<http.Response> requestHandler(http.Request request) async {
    if (isCurrentUserRequest(request)) {
      return currentUserResponse;
    } else if (request.url.path == '/nutribot_consultations') {
      return nutribotConsultationsResponse;
    } else if (isPetsListRequest(request)) {
      return petsListResponse;
    } else if (request.url.pathSegments.last == pet['id'].toString() && request.method == 'GET') {
      return Future.value(http.Response(json.encode(petsListResponseBody[0]), 200));
    } else if (request.url.path == '/pets/${pet['id']}/assessments') {
      return Future.value(http.Response(json.encode(assessmentHitoryResponseBody), 200));
    } else if (request.url.path == '/assessments/${consultationId}') {
      return Future.value(http.Response(json.encode(assessmentResultResponseBody), 200));
    } else if (isSymptomSearchRequest(request)) {
      return symptomSearchResponse;
    } else if (request.url.path == '/user' && request.method == 'PUT') {
      final updatedPhone = {'phoneNumber': phoneNumber, 'phoneNumberPrefix': phonePrefix};
      final updatedUserResponse = {}..addAll(currentUserResponseBody['user'])..addAll(updatedPhone);
      return Future.value(http.Response(json.encode({'user': updatedUserResponse}), 200));
    } else if (isShortLivedTokenRequest(request)) {
      return shortLivedTokenResponse;
    } else {
      return defaultResponse;
    }
  }

  Future<void> initializeApp(landingPath) async {
    initializeServiceLocator(requestHandler: requestHandler);
    storeAccessToken();
    fixture = await testBed.create(beforeComponentCreated: (_) => injector.get<Location>(Location).go(landingPath));
    config = injector.get<WidgetConfiguration>(WidgetConfiguration);
    parentWindow = injector.get<ParentWindowService>(ParentWindowService);
    context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    when(config.externalLinksEventsEnabled).thenReturn(true);
    when(config.nutribotRecommendationShortJourneyEnabled).thenReturn(false);
    when(config.telehealthChatEnabled).thenReturn(true);
    await fixture.update();
  }

  tearDown(disposeAnyRunningTest);

  test('should notify parent window when clicking "Export" in report', () async {
    await initializeApp('pets/${pet['id']}/assessments');
    final historyPO = PetAssessmentHistoryPO.lookup(context);
    await historyPO.openAssessmentReport(symptom['name']);
    await fixture.update();
    await historyPO.report.clickExportButton();
    await fixture.update();
    verify(parentWindow.notifyExportReportRequested(exportUrl));
  });

  test('should notify parent window when clicking "Buy now" in nutrition recommendation', () async {
    await initializeApp('pets/${pet['id']}/nutrition_history');
    final historyPO = NutritionHistoryPO.lookup(context);
    await historyPO.openNutritionConsultation(firstConsultationDate);
    await fixture.update();
    await historyPO.openRecommendationCard(recommendation1);
    await fixture.update();
    await historyPO.getRecommendationItem(recipe1['productName']).clickBuyNowButton();
    await fixture.update();
    verify(
        parentWindow.notifyNutribotProductRequested(recipe1['buyUrl'], recipe1['productName'], recipe1['productId']));
    await historyPO.getRecommendationItem(treat2['productName']).clickBuyNowButton();
    await fixture.update();
    verify(parentWindow.notifyNutribotProductRequested(treat2['buyUrl'], treat2['productName'], treat2['productId']));
  });

  test('should notify parent window when selecting "Phone" option in ask a vet flow', () async {
    await initializeApp('chat?chatType=ask_a_vet');
    final appointmentUrl = 'http://appointmentUrl?q={fullPhoneNumber}';
    when(config.chatOnPhoneCallUrl).thenReturn(appointmentUrl);
    await fixture.update();
    final chatPO = ChatPO.lookup(context);
    await chatPO.controls.selectOption(chatPet['name']);
    await fixture.update();
    await chatPO.controls.enterText('Search query');
    await fixture.update();
    await chatPO.controls.selectOption(symptomSearchResponseBody[1]['name']);
    await fixture.update();
    await chatPO.controls.selectOption('Phone Call');
    await fixture.update();
    await chatPO.controls.enterPhonePrefix(phonePrefix);
    await chatPO.controls.enterPhoneNumber(phoneNumber);
    await fixture.update();
    await chatPO.controls.submitPhone();
    await fixture.update();
    await chatPO.controls.clickChatButton('Ok');
    await fixture.update();
    final expectedAppointmentUrl = appointmentUrl.replaceAll('{fullPhoneNumber}', '+0 12345');
    verify(parentWindow.notifyPhoneAppointmentRequested(expectedAppointmentUrl));
  });

  test('should notify parent window when adding phoneNumber in ask a vet flow', () async {
    await initializeApp('chat?chatType=ask_a_vet');
    final appointmentUrl = 'http://appointmentUrl?q={fullPhoneNumber}';
    when(config.chatOnPhoneCallUrl).thenReturn(appointmentUrl);
    await fixture.update();
    final chatPO = ChatPO.lookup(context);
    await chatPO.controls.selectOption(chatPet['name']);
    await fixture.update();
    await chatPO.controls.enterText('Search query');
    await fixture.update();
    await chatPO.controls.selectOption(symptomSearchResponseBody[1]['name']);
    await fixture.update();
    await chatPO.controls.selectOption('Phone Call');
    await fixture.update();
    await chatPO.controls.enterPhonePrefix(phonePrefix);
    await chatPO.controls.enterPhoneNumber(phoneNumber);
    await fixture.update();
    await chatPO.controls.submitPhone();
    await fixture.update();
    verify(parentWindow.notifyPhoneNumberAdded(phoneNumber));
  });
}
