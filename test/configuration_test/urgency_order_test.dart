@TestOn('browser')

import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_test/angular_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:pageloader/html.dart';
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;

import '../page_objects/pet_assessment_history_po.dart';
import '../page_objects/widget_po.dart';
import 'urgency_order_test.template.dart' as self;
import '../utils/utils.dart';

NgTestFixture<AppComponent> fixture;
WidgetConfiguration configuration;
PetAssessmentHistoryPO historyPO;
WidgetPO widgetPO;
HtmlPageLoaderElement context;

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  final petId = petsListResponseBody[0]['pet']['id'];
  final assessment = assessmentHitoryResponseBody[0];
  final condition1 = assessment['conditions'][0];
  final condition2 = assessment['conditions'][1];
  final mainSymptom = assessment['symptoms'][0];
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(
    ng.AppComponentNgFactory,
    rootInjector: injector.factory,
  );

  Future<void> initializeApp(requestHandler) async {
    initializeServiceLocator(requestHandler: requestHandler);
    storeAccessToken();
    fixture = await testBed.create(
        beforeComponentCreated: (_) => injector.get<Location>(Location).go('/pets/$petId/assessments'));
    context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    historyPO = PetAssessmentHistoryPO.lookup(context);
    configuration = ServiceLocator.container.get<Configuration>();
  }

  tearDown(disposeAnyRunningTest);

  setUp(() async {
    Future<http.Response> successResponseHandler(http.Request request) async {
      if (isCurrentUserRequest(request)) {
        return currentUserResponse;
      }
      if (isActiveChatRequest(request)) {
        return activeChatResponse;
      }
      if (request.url.path == '/pets/$petId/assessments') {
        return Future.value(http.Response(json.encode(assessmentHitoryResponseBody), 200));
      }
      if (request.url.path == '/pets/$petId') {
        return Future.value(http.Response(json.encode(petsListResponseBody[0]), 200));
      }
      if (request.url.path == '/assessments/${assessment["consultationId"]}') {
        return Future.value(http.Response(json.encode(assessment), 200));
      }
      return defaultResponse;
    }

    await initializeApp(successResponseHandler);
  });

  test('Setting controls the order of condtitions in report', () async {
    when(configuration.aivetUrgencyOrderEnabled).thenReturn(true);
    historyPO.openAssessmentReport(mainSymptom['name']);
    await fixture.update();
    expect(historyPO.report.hasConditionInfo(condition2, 0), isTrue);
    expect(historyPO.report.hasConditionInfo(condition1, 1), isTrue);
    await widgetPO.goBack();
    await fixture.update();
    when(configuration.aivetUrgencyOrderEnabled).thenReturn(false);
    historyPO.openAssessmentReport(mainSymptom['name']);
    await fixture.update();
    expect(historyPO.report.hasConditionInfo(condition1, 0), isTrue);
    expect(historyPO.report.hasConditionInfo(condition2, 1), isTrue);
  });
}
