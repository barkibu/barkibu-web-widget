@TestOn('browser')

import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_test/angular_test.dart';
import 'package:common_barkibu_dart/models/create_pet/birthdate.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:pageloader/html.dart';
import 'package:pageloader/testing.dart';
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;

import 'page_objects/widget_po.dart';
import 'page_objects/my_pets_po.dart';
import 'page_objects/pet_form_po.dart';
import 'page_objects/pet_create_po.dart';
import 'page_objects/pet_edit_po.dart';
import 'pet_form_test.template.dart' as self;
import 'utils/utils.dart';

NgTestFixture<AppComponent> fixture;
Router router;
WidgetPO widgetPO;
MyPetsPO myPetsPO;
PetEditPO petEditPO;
PetCreatePO petCreatePO;
PetFormPO petFormPO;
final pet = petsListResponseBody[0]['pet'];
final birthdate = pet['birthdate'];
final months = Birthdate.getMonthOld(birthdate);
final years = Birthdate.getYearsOld(birthdate);
WidgetConfiguration config;

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

Future<http.Response> authRequestHandler(http.Request request) async {
  if (isCurrentUserRequest(request)) {
    return currentUserResponse;
  } else if (isPetsListRequest(request)) {
    return petsListResponse;
  } else if (isActiveChatRequest(request)) {
    return activeChatResponse;
  } else if (request.url.pathSegments.last == pet['id'].toString() && request.method == 'GET') {
    return Future.value(http.Response(json.encode(petsListResponseBody[0]), 200));
  } else {
    return defaultResponse;
  }
}

void main() {
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory, rootInjector: injector.factory);

  Future<void> initializeApp(requestHandler) async {
    initializeServiceLocator(requestHandler: requestHandler);
    storeAccessToken(token: 'access_token');
    fixture = await testBed.create();
    router = injector.get<Router>(Router);
    config = injector.get<WidgetConfiguration>(WidgetConfiguration);
    when(config.petBreedEnabled).thenReturn(false);
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    await fixture.update();
    await widgetPO.navigateToMyPets();
    await fixture.update();
    myPetsPO = widgetPO.myPets;
  }

  tearDown(disposeAnyRunningTest);

  group('when creating a pet', () {
    setUp(() async {
      Future<http.Response> createHandler(http.Request request) async {
        if (request.url.pathSegments.last == 'pets' && request.method == 'POST') {
          var requestBody = json.decode(request.body);
          expect(requestBody['pet']['name'], 'Snoopy the second');
          expect(requestBody['pet']['species'], 'dog');
          expect(requestBody['pet']['gender'], 'female');
          expect(requestBody['pet']['neutered'], true);
          expect(requestBody['pet']['birthdate'], birthdate);
          return Future.value(http.Response(json.encode(petsListResponseBody[0]), 200));
        } else {
          return authRequestHandler(request);
        }
      }

      await initializeApp(createHandler);
      await myPetsPO.navigateToAddPet();
      await fixture.update();
      petCreatePO = widgetPO.petCreate;
      petFormPO = petCreatePO.petForm;
    });

    test('Creates a pet', () async {
      await petFormPO.fillInName('Snoopy the second');
      await petFormPO.selectDogOption();
      await petFormPO.selectFemaleOption();
      await petFormPO.selectNeuteredOption();
      await petFormPO.enterAge(years, months);
      await fixture.update();
      await petCreatePO.savePet();
      await fixture.update();
      expect(widgetPO.myPets, exists);
    });

    test('shows information about age', () async {
      await petFormPO.ageLearnMore();
      await fixture.update();
      expect(petCreatePO.isFormHidden(), isTrue);
      expect(widgetPO.symptomInfoScreen.showsAgeInfo('Cat'), isTrue);
      await widgetPO.symptomInfoScreen.goBack();
      await fixture.update();
      expect(petCreatePO.isFormHidden(), isFalse);
    });
  });

  group('when updating a pet', () {
    final updatedBirthdate = '2018-05-01';
    final updatedMonths = Birthdate.getMonthOld(updatedBirthdate);
    final updatedYears = Birthdate.getYearsOld(updatedBirthdate);

    setUp(() async {
      Future<http.Response> updateHandler(http.Request request) async {
        if (request.method == 'PUT') {
          expect(request.url.path, '/pets/1');
          var requestBody = json.decode(request.body);
          expect(requestBody['pet']['name'], 'Snoopy updated');
          expect(requestBody['pet']['species'], 'dog');
          expect(requestBody['pet']['gender'], 'female');
          expect(requestBody['pet']['neutered'], true);
          expect(requestBody['pet']['birthdate'], updatedBirthdate);
          return Future.value(http.Response('{"pet": {}}', 200));
        } else {
          return authRequestHandler(request);
        }
      }

      await initializeApp(updateHandler);
      await myPetsPO.navigateToPetProfile('Snoopy');
      await fixture.update();
      await widgetPO.petProfile.navigateToPetEdit();
      await fixture.update();
      petEditPO = widgetPO.petEdit;
      petFormPO = petEditPO.petForm;
    });

    test('shows pet information on the form', () async {
      expect(petFormPO.hasName(pet['name']), isTrue);
      expect(petFormPO.hasSpecies(pet['species']), isTrue);
      expect(petFormPO.hasSex(pet['gender']), isTrue);
      expect(petFormPO.hasNeutered(pet['neutered']), isTrue);
      expect(petFormPO.hasAge(years, months), isTrue);
    });

    test('shows information about age', () async {
      await petFormPO.ageLearnMore();
      await fixture.update();
      expect(petEditPO.isFormHidden(), isTrue);
      expect(widgetPO.symptomInfoScreen.showsAgeInfo('Dog'), isTrue);
      await widgetPO.symptomInfoScreen.goBack();
      await fixture.update();
      expect(petEditPO.isFormHidden(), isFalse);
    });

    test('Updates a pet', () async {
      await petFormPO.fillInName(' updated');
      await petFormPO.selectDogOption();
      await petFormPO.selectFemaleOption();
      await petFormPO.selectNeuteredOption();
      await petFormPO.enterAge(updatedYears, updatedMonths);
      await fixture.update();
      await petEditPO.savePet();
      await fixture.update();
      expect(widgetPO.myPets, exists);
    });
  });
}
