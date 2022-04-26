@TestOn('browser')

import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_test/angular_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:pageloader/html.dart';
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;

import 'page_objects/widget_po.dart';
import 'pet_profile_test.template.dart' as self;
import 'utils/utils.dart';

NgTestFixture<AppComponent> fixture;
WidgetConfiguration configuration;
WidgetPO widgetPO;

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

final pet = petsListResponseBody[0]['pet'];
final aiVetHistory = [assessmentResultResponseBody, assessmentResultResponseBody2];
final askAVetHistory = [assessmentResultResponseBody];
final nutribotConsultations = nutribotConsultationsResponse;
final nutribotConsultationCountForPet1 =
    1; // nutribotConsultationsResponse contains 1 nutribot consultation for the pet with id 1

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
    switch (request.url.queryParameters['filter']) {
      case 'ask_a_vet':
        return Future.value(http.Response(json.encode(askAVetHistory), 200));
      case 'completed':
        return Future.value(http.Response(json.encode(aiVetHistory), 200));
    }
  } else if (request.url.path == '/nutribot_consultations') {
    return nutribotConsultationsResponse;
  }
  return defaultResponse;
}

void main() {
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(
    ng.AppComponentNgFactory,
    rootInjector: injector.factory,
  );

  Future<void> initializeApp() async {
    initializeServiceLocator(requestHandler: requestHandler);
    storeAccessToken(token: 'access_token');
    configuration = ServiceLocator.container.get<Configuration>();
    when(configuration.nutribotEnabled).thenReturn(true);

    fixture = await testBed.create();
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    await fixture.update();
    await widgetPO.navigateToMyPets();
    await fixture.update();
    await widgetPO.myPets.navigateToPetProfile(pet['name']);
    await fixture.update();
  }

  setUp(initializeApp);
  tearDown(disposeAnyRunningTest);

  group('with aivet feature enabled', () {
    setUp(() {
      when(configuration.aivetEnabled).thenReturn(true);
    });

    test('AiVet Count and link is displayed', () async {
      await fixture.update();
      expect(widgetPO.petProfile.virtualVetHistoryCount, aiVetHistory.length);
    });
  });

  group('with aivet feature disabled', () {
    setUp(() {
      when(configuration.aivetEnabled).thenReturn(false);
    });

    test('aivet Count and link is hidden', () async {
      await fixture.update();
      expect(widgetPO.petProfile.hasAssessmentHistoryLink(), false);
    });
  });

  group('with nutribot feature disabled', () {
    setUp(() {
      when(configuration.nutribotEnabled).thenReturn(false);
    });

    test('Nutribot Count and link is hidden', () async {
      await fixture.update();
      expect(widgetPO.petProfile.hasNutribotHistoryLink(), false);
    });
  });

  group('with nutribot feature enabled', () {
    setUp(() {
      when(configuration.nutribotEnabled).thenReturn(true);
    });

    test('Nutribot Count and link is displayed', () async {
      await fixture.update();
      expect(widgetPO.petProfile.hasNutribotHistoryLink(), true);
      expect(widgetPO.petProfile.nutribotHistoryCount, nutribotConsultationCountForPet1);
    });
  });

  group('with askAVetDirectly feature disabled', () {
    setUp(() {
      when(configuration.askAVetDirectlyEnabled).thenReturn(false);
    });

    test('AskAVet Count and link is hidden', () async {
      await fixture.update();
      expect(widgetPO.petProfile.hasAskAVetHistoryLink(), false);
    });
  });

  group('with askAVetDirectly feature enabled', () {
    setUp(() {
      when(configuration.askAVetDirectlyEnabled).thenReturn(true);
    });

    test('AskAVet Count and link is displayed', () async {
      await fixture.update();
      expect(widgetPO.petProfile.hasAskAVetHistoryLink(), true);
      expect(widgetPO.petProfile.askAVetHistoryCount, askAVetHistory.length);
    });
  });
}
