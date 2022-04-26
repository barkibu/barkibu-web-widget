@TestOn('browser')

import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:angular/angular.dart';
import 'package:angular_test/angular_test.dart';
import 'package:common_barkibu_dart/models/create_pet/birthdate.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:pageloader/html.dart';
import 'package:mockito/mockito.dart';
import 'package:pageloader/testing.dart';
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;

import 'page_objects/widget_po.dart';
import 'page_objects/nutribot_po.dart';
import 'nutribot_flow_test.template.dart' as self;
import 'utils/utils.dart';

NgTestFixture<AppComponent> fixture;
WidgetPO widgetPO;
NutribotPO nutribotPO;
WidgetConfiguration config;

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  final injector = InjectorProbe(rootInjector);
  final birthdate = '2018-01-01';
  final months = Birthdate.getMonthOld(birthdate);
  final years = Birthdate.getYearsOld(birthdate);

  final testBed = NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory, rootInjector: injector.factory);

  Future<void> initializeApp(requestHandler) async {
    initializeServiceLocator(requestHandler: requestHandler);
    storeAccessToken();
    fixture = await testBed.create();
    config = injector.get<WidgetConfiguration>(WidgetConfiguration);
    when(config.nutribotEnabled).thenReturn(true);
    when(config.nutribotRecommendationShortJourneyEnabled).thenReturn(false);
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    await fixture.update();
    await widgetPO.navigateToNutribot();
    await fixture.update();
    nutribotPO = widgetPO.nutribot;
  }

  tearDown(disposeAnyRunningTest);

  setUp(() async {
    Future<http.Response> successResponseHandler(http.Request request) async {
      if (request.url.pathSegments.last == 'auth') {
        var body = json.encode({
          'user': {'email': 'john.doe@example.com', 'firstName': 'Testy', 'lastName': 'Smith'}
        });
        return Future.value(http.Response(body, 200));
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

      if (request.url.path == '/pets/1' && request.method == 'PUT') {
        var requestBody = json.decode(request.body);

        expect(requestBody['pet']['name'], 'Snoopy');
        expect(requestBody['pet']['foodPreferences']['hasHipJointIssues'], false);
        expect(requestBody['pet']['foodPreferences']['hasDullCoatOrDrySkin'], true);
        expect(requestBody['pet']['foodPreferences']['needsWeightManagementFood'], true);
        expect(requestBody['pet']['foodPreferences']['preferedFoodType'], 'dry');
        expect(requestBody['pet']['foodPreferences']['foodSensitivities'], ['seafood', 'dairy', 'beef']);

        return Future.value(http.Response('', 200));
      }

      if (request.url.pathSegments.last == 'food_recommendations') {
        expect(request.url.queryParameters['petId'], '1');

        var body = json.encode([
          {'foodRecommendation': recommendation1},
          {'foodRecommendation': recommendation2}
        ]);
        return Future.value(http.Response(body, 200));
      }

      if (isActiveChatRequest(request)) {
        return activeChatResponse;
      }
      return defaultResponse;
    }

    await initializeApp(successResponseHandler);
  });

  test('Allows user to add a pet as part of nutribot flow', () async {
    when(config.petBreedEnabled).thenReturn(false);
    expect(nutribotPO.messages.receivedMessages(),
        contains('Hello Testy! I’m the Nutrition Helper.\nBefore I can help you I’ll need a little info.'));
    await fixture.update();
    expect(nutribotPO.messages.receivedMessages(), contains('Which pet would you like to talk about?'));
    await fixture.update();
    expect(nutribotPO.controls.listSelectOptions(), contains('Snoopy'));
    expect(nutribotPO.controls.listSelectOptions(), contains('Purry'));
    expect(nutribotPO.controls.listSelectOptions(), contains('Add a pet'));
    await nutribotPO.controls.selectOption('Add a pet');
    await fixture.update();
    expect(nutribotPO.messages.receivedMessages(), contains('What is your pet’s name?'));
    await nutribotPO.controls.enterText('New pet');
    await fixture.update();
    expect(nutribotPO.messages.sentMessages(), contains('New pet'));
    expect(nutribotPO.messages.receivedMessages(), contains('Is New pet a Dog or a Cat?'));
    expect(nutribotPO.controls.listSelectOptions(), contains('Dog'));
    expect(nutribotPO.controls.listSelectOptions(), contains('Cat'));
    await nutribotPO.controls.selectOption('Dog');
    await fixture.update();
    expect(nutribotPO.messages.receivedMessages(), contains('How old is New pet?'));
    await nutribotPO.controls.enterAge(years, months);
    await fixture.update();
    await nutribotPO.controls.submitAge();
    await fixture.update();
    expect(nutribotPO.messages.sentMessages(), contains('$years years $months months'));
    expect(nutribotPO.messages.sentMessages(), contains('Dog'));
    expect(nutribotPO.messages.receivedMessages(), contains('Is New pet a he or she?'));
    expect(nutribotPO.controls.listSelectOptions(), contains('Male'));
    expect(nutribotPO.controls.listSelectOptions(), contains('Female'));
    await nutribotPO.controls.selectOption('Male');
    await fixture.update();
    expect(nutribotPO.messages.sentMessages(), contains('Male'));
    expect(nutribotPO.messages.receivedMessages(), contains('Is New pet castrated?'));
    await nutribotPO.controls.selectYesNoOption('Yes');
    await fixture.update();
    expect(nutribotPO.messages.sentMessages(), contains('Yes'));
    expect(nutribotPO.messages.receivedMessages(),
        contains('Ok, for New pet. Great. Let’s start by exploring some key nutrition areas.'));
  });

  test('Shows recommendations info', () async {
    await fixture.update();
    expect(nutribotPO.messages.receivedMessages(), contains('Which pet would you like to talk about?'));
    await fixture.update();
    await nutribotPO.controls.selectOption('Snoopy');
    await fixture.update();
    expect(nutribotPO.messages.receivedMessages(),
        contains('Ok, for Snoopy. Great. Let’s start by exploring some key nutrition areas.'));
    expect(nutribotPO.messages.receivedMessages(), contains('Does Snoopy have sensitivities to any of these foods?'));
    await fixture.update();
    await nutribotPO.controls.selectMultipleOptions(['Beef', 'Lamb']);
    await fixture.update();
    await nutribotPO.controls.selectMultipleOptions(['No']);
    await fixture.update();
    await nutribotPO.controls.selectMultipleOptions(['Dairy', 'Beef', 'Seafood']);
    await fixture.update();
    await nutribotPO.controls.submitSelectedOptions();
    await fixture.update();
    expect(nutribotPO.messages.sentMessages(), contains('Snoopy has a sensitivity to Seafood, Dairy and Beef'));
    await fixture.update();
    expect(nutribotPO.messages.receivedMessages(), contains('Does Snoopy need a food to help control their weight?'));
    await nutribotPO.controls.selectYesNoOption('Yes');
    await fixture.update();
    expect(nutribotPO.messages.receivedMessages(), contains('Does Snoopy have dry skin and/or a dull coat?'));
    await nutribotPO.controls.selectYesNoOption('Yes');
    await fixture.update();
    expect(nutribotPO.messages.receivedMessages(), contains('Does Snoopy have joint issues/arthritis?'));
    await nutribotPO.controls.selectYesNoOption('No');
    await fixture.update();
    expect(nutribotPO.messages.receivedMessages(),
        contains('Lastly, do you prefer Wet or Dry food for Snoopy? (choose one of the options below)'));
    expect(ListEquality().equals(nutribotPO.controls.listSelectOptions(), ['Wet', 'Dry', 'No Preference']), isTrue);
    await nutribotPO.controls.selectOption('Dry');
    await fixture.update();
    expect(
        nutribotPO.messages.receivedMessages(),
        contains(
            'Ok, based on Snoopy (their age, size, etc.) and the answers you just gave us here, we recommend the following.'));
    expect(nutribotPO.messages.receivedMessages(),
        contains('Remember that these results are not intended to replace professional veterinary advice.'));
    await fixture.update();
    expect(nutribotPO.hasRecommendationMessage(recommendation1, primary: true), isTrue);
    expect(nutribotPO.hasRecommendationMessage(recommendation2, primary: false), isTrue);
    await nutribotPO.openRecommendationCard(recommendation1);
    await fixture.update();
    expect(nutribotPO.showsRecommendationDetails(primary: true), isTrue);
    await nutribotPO.closeRecommendationCard();
    await fixture.update();
    await nutribotPO.openRecommendationCard(recommendation2);
    await fixture.update();
    expect(nutribotPO.showsRecommendationDetails(primary: false), isTrue);
    await nutribotPO.closeRecommendationCard();
    await fixture.update();
    expect(nutribotPO.messages.receivedMessages(), contains('Was my answer helpful?'));
    await fixture.update();
    await nutribotPO.controls.selectYesNoOption('Yes');
    await fixture.update();
    await nutribotPO.controls.clickChatButton('Go back home');
    await fixture.update();
    expect(widgetPO.home, exists);
  });
}
