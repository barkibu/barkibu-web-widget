@TestOn('browser')

import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:pageloader/html.dart';
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;

import 'page_objects/widget_po.dart';
import 'page_objects/pet_assessment_history_po.dart';
import 'pet_assessment_history_test.template.dart' as self;
import 'utils/utils.dart';

NgTestFixture<AppComponent> fixture;
WidgetPO widgetPO;
PetAssessmentHistoryPO historyPO;

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

final pet = petsListResponseBody[0]['pet'];
final assessment = assessmentHitoryResponseBody[1];
final condition = assessment['conditions'][0];
final symptom0 = assessment['symptoms'][0];
final symptom1 = assessment['symptoms'][1];

Future<http.Response> requestHandler(http.Request request) async {
  if (isCurrentUserRequest(request)) {
    return currentUserResponse;
  } else if (isPetsListRequest(request)) {
    return petsListResponse;
  } else if (isActiveChatRequest(request)) {
    return activeChatResponse;
  } else if (request.url.path == '/pets/${pet['id']}') {
    return Future.value(http.Response(json.encode(petsListResponseBody[0]), 200));
  } else if (request.url.path == '/pets/${pet['id']}/assessments') {
    return Future.value(http.Response(json.encode(assessmentHitoryResponseBody), 200));
  } else if (request.url.path == '/assessments/${assessment["consultationId"]}') {
    return Future.value(http.Response(json.encode(assessment), 200));
  } else {
    return defaultResponse;
  }
}

void main() {
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory, rootInjector: injector.factory);

  Future<void> initializeApp() async {
    initializeServiceLocator(requestHandler: requestHandler);
    storeAccessToken(token: 'access_token');
    fixture = await testBed.create();
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    await fixture.update();
    await widgetPO.navigateToMyPets();
    await fixture.update();
    await widgetPO.myPets.navigateToPetProfile(pet['name']);
    await fixture.update();
    await widgetPO.petProfile.navigateToAssessmentHistory();
    await fixture.update();
    historyPO = widgetPO.petAssessmentHistoryPO;
  }

  setUp(initializeApp);
  tearDown(disposeAnyRunningTest);

  test('shows a list of assessments', () async {
    expect(historyPO.hasAssessmentItem(assessmentHitoryResponseBody[0]['symptoms'][0]['name']), isTrue);
    expect(historyPO.hasAssessmentItem(assessmentHitoryResponseBody[1]['symptoms'][0]['name']), isTrue);
  });

  test('opens assessment report details', () async {
    await historyPO.openAssessmentReport(symptom0['name']);
    await fixture.update();
    expect(historyPO.report.hasUrgentSymptomsNextStep(pet['name']), isTrue);
    expect(symptom0, historyPO.report.isSymptomIndexed(0));
    expect(symptom1, historyPO.report.isSymptomIndexed(1));
    expect(condition, historyPO.report.isConditionIndexed(0));
    await historyPO.report.openSymptomInformation(1);
    await fixture.update();
    expect(widgetPO.symptomInfoScreen.showsInfo(symptom1['name'], symptom1['article']), isTrue);
    await fixture.update();
    await widgetPO.goBack();
    await fixture.update();
    await historyPO.report.openConditionInformation(0);
    await fixture.update();
    expect(widgetPO.symptomInfoScreen.showsInfo(condition['name'], condition['article']), isTrue);
  });
}
