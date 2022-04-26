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

import 'page_objects/nutrition_history_po.dart';
import 'page_objects/widget_po.dart';
import 'pet_nutrition_history_test.template.dart' as self;
import 'utils/utils.dart';

NgTestFixture<AppComponent> fixture;
WidgetPO widgetPO;
NutritionHistoryPO historyPO;

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

final pet = petsListResponseBody[0]['pet'];

/// See [nutribotConsultations1]
final firstConsultationDate = '10/08/2020';

Future<http.Response> requestHandler(http.Request request) async {
  if (isCurrentUserRequest(request)) {
    return currentUserResponse;
  } else if (isPetsListRequest(request)) {
    return petsListResponse;
  } else if (isActiveChatRequest(request)) {
    return activeChatResponse;
  } else if (request.url.path == '/pets/${pet['id']}') {
    return Future.value(http.Response(json.encode(petsListResponseBody[0]), 200));
  } else if (request.url.path == '/nutribot_consultations') {
    return nutribotConsultationsResponse;
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
    final configuration = ServiceLocator.container.get<Configuration>() as WidgetConfiguration;
    when(configuration.nutribotEnabled).thenReturn(true);
    when(configuration.nutribotRecommendationShortJourneyEnabled).thenReturn(false);

    fixture = await testBed.create();
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    await fixture.update();
    await widgetPO.navigateToMyPets();
    await fixture.update();
    await widgetPO.myPets.navigateToPetProfile(pet['name']);
    await fixture.update();
    await widgetPO.petProfile.navigateToNutribotHistory();
    await fixture.update();
    historyPO = widgetPO.nutritionHistoryPO;
  }

  setUp(initializeApp);
  tearDown(disposeAnyRunningTest);

  test('shows a list of consultation', () async {
    expect(historyPO.hasNutritionItem(firstConsultationDate), isTrue);
  });

  test('opens a nutrition consultation and its recommendations', () async {
    await historyPO.openNutritionConsultation(firstConsultationDate);
    await fixture.update();
    expect(historyPO.hasRecommendationMessage(recommendation1, primary: true), isTrue);
    expect(historyPO.hasRecommendationMessage(recommendation2), isTrue);
    historyPO.openRecommendationCard(recommendation1);
    await fixture.update();
    historyPO.showsRecommendationDetails(primary: true);
    await widgetPO.goBack();
    await fixture.update();
    historyPO.openRecommendationCard(recommendation2);
    await fixture.update();
    historyPO.showsRecommendationDetails(primary: false);
    var recipe2item = historyPO.getRecommendationItem(recipe2['productName']);
    var treat2Item = historyPO.getRecommendationItem(treat2['productName']);
    expect(recipe2item.hasBuyNowLink(recipe2['buyUrl']), isTrue);
    expect(treat2Item.hasBuyNowLink(treat2['buyUrl']), isTrue);
  });
}
