import 'dart:async';

import 'package:common_barkibu_dart/bloc/pet_definition/pet_definition.dart';
import 'package:common_barkibu_dart/bloc/pet_definition/pet_definition_bloc.dart';
import 'package:common_barkibu_dart/bloc/pet_definition/pet_definition_state.dart';
import 'package:common_barkibu_dart/bloc/pet_profile/pet_profile_state.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/domain/aivet/patient_definition_next_step_use_case.dart';
import 'package:common_barkibu_dart/domain/pet/get_pet_features_use_case.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks/mocks.dart';
import '../../service_locator.dart' as test_service_locator;
import '../utils/view_model_matcher.dart';

class MockPatientDefinitionNextStepUseCase extends Mock implements PatientDefinitionNextStepUseCase {}

class MockSetUserPropertiesUseCase extends Mock implements SetUserPropertiesUseCase {}

void main() {
  test_service_locator.ServiceLocator.setup();
  PetDefinitionBloc petDefinitionBloc;
  PetProfileBloc petProfileBloc;
  UpdatePetUseCase updatePetUseCase;
  CreatePetUseCase createPetUseCase;
  GetPetFeaturesUseCase getPetFeaturesUseCase;
  PatientDefinitionNextStepUseCase patientDefinitionNextStepUseCase;
  AnalyticsService analyticsService;
  SetUserPropertiesUseCase setUserPropertiesUseCase;

  void initializeBloc({bool setupInitialState = true}) {
    petDefinitionBloc?.close();
    petProfileBloc = MockPetProfileBloc();
    patientDefinitionNextStepUseCase = MockPatientDefinitionNextStepUseCase();
    updatePetUseCase = MockUpdatePetUseCase();
    createPetUseCase = MockCreatePetUseCase();
    getPetFeaturesUseCase = MockGetPetFeaturesUseCase();
    patientDefinitionNextStepUseCase = MockPatientDefinitionNextStepUseCase();
    analyticsService = MockAnalyticsService();
    setUserPropertiesUseCase = MockSetUserPropertiesUseCase();
    petDefinitionBloc = PetDefinitionBloc(
      patientDefinitionNextStepUseCase,
      createPetUseCase,
      getPetFeaturesUseCase,
      updatePetUseCase,
      analyticsService,
      setUserPropertiesUseCase,
    );
  }

  setUp(() {
    initializeBloc();
    when(petDefinitionBloc.configuration.addPetOptionEnabled).thenReturn(true);
  });

  tearDown(() {
    petDefinitionBloc?.close();
  });

  group('PetDefinitionBloc', () {
    final isSelectPetStateMatcher = predicate((PetDefinitionState state) =>
        state.viewModel is SingleOptionsSelectorViewModel &&
        (state.viewModel as SingleOptionsSelectorViewModel).chatFlow is SelectPetPetDefinitionChatFlow);

    final hasAddAPetOption = predicate((PetDefinitionState state) =>
        (state.viewModel as SingleOptionsSelectorViewModel).items.any((option) => option.description == 'Add a pet'));

    test('PetHealthChatPetDefinitionStarted ask for Pet Selection', () {
      when(patientDefinitionNextStepUseCase.nextStep(any))
          .thenAnswer((_) => Future.value(AskPetDefinitionAction.selectPet([])));
      final event = PetDefinitionStarted(null);

      expectLater(
        petDefinitionBloc,
        emitsInOrder([
          isA<PetDefinitionState>(), // Initial State
          botMessageMatcher(PetHealthChatMessageType.selectPet),
          allOf(isSelectPetStateMatcher, hasAddAPetOption),
        ]),
      );
      petDefinitionBloc.add(event);
    });

    test('PetHealthChatPetDefinitionStarted does not ask for Pet Selection if external pets enabled', () {
      when(petDefinitionBloc.configuration.addPetOptionEnabled).thenReturn(false);
      when(patientDefinitionNextStepUseCase.nextStep(any))
          .thenAnswer((_) => Future.value(AskPetDefinitionAction.selectPet([])));
      final event = PetDefinitionStarted(null);

      expectLater(
        petDefinitionBloc,
        emitsInOrder([
          isA<PetDefinitionState>(), // Initial State
          botMessageMatcher(PetHealthChatMessageType.selectPet),
          allOf(isSelectPetStateMatcher, isNot(hasAddAPetOption)),
        ]),
      );
      petDefinitionBloc.add(event);
    });

    test('PetHealthChatPetNameConfirmed sets the name and asks for AgeRange', () {
      when(patientDefinitionNextStepUseCase.nextStep(any))
          .thenAnswer((_) => Future.value(AskPetDefinitionAction.askPetBirthdate()));
      when(petDefinitionBloc.configuration.petAgeSelectorEnabled).thenReturn(true);

      final petName = 'Foo';
      final event = PetNameConfirmed((b) => b..petName = petName);
      expectLater(
        petDefinitionBloc,
        emitsInOrder([
          isA<PetDefinitionState>(), // Initial State
          ownMessageMatcher(petName),
          botMessageTypeWithHelpMatcher(messageType: PetHealthChatMessageType.selectAgeRange),
          allOf(
            hasViewModel<AgeSelectorViewModel>(),
            predicate((state) => state.pet.name == petName, 'Pet\'s name is $petName'),
          )
        ]),
      );
      petDefinitionBloc.add(event);
    });

    test('PetHealthChatPetBirthdateConfirmed sets the birthdate and asks for Species', () {
      when(patientDefinitionNextStepUseCase.nextStep(any))
          .thenAnswer((_) => Future.value(AskPetDefinitionAction.askPetSpecies()));
      when(petDefinitionBloc.configuration.petAgeSelectorEnabled).thenReturn(true);

      final birthday = '2018-01-01';
      final event = PetBirthdayConfirmed((b) => b..petBirthday = birthday);

      expectLater(
        petDefinitionBloc,
        emitsInOrder([
          isA<PetDefinitionState>(), // Initial State
          ownMessageTypeMatcher(PetHealthChatMessageType.age),
          botMessageMatcher(PetHealthChatMessageType.selectSpecies),
          predicate((state) => state.viewModel is SingleOptionsSelectorViewModel && state.pet.birthdate == birthday),
        ]),
      );
      petDefinitionBloc.add(event);
    });

    test('PetHealthChatPetBirthdateConfirmed launch logSelectsPetAge on analytics', () async {
      when(patientDefinitionNextStepUseCase.nextStep(any))
          .thenAnswer((_) => Future.value(AskPetDefinitionAction.stopPetDefinitionProcess()));
      when(petDefinitionBloc.configuration.petAgeSelectorEnabled).thenReturn(true);
      when(createPetUseCase.createPet(any)).thenAnswer((_) => Future.value(Pet(species: 'Dog')));

      final birthday = '2018-01-01';
      petDefinitionBloc.add(PetBirthdayConfirmed((b) => b..petBirthday = birthday));
      petDefinitionBloc.state.pet.species = 'Dog';

      await expectLater(
        petDefinitionBloc,
        emitsThrough(predicate((state) => state.pet.birthdate == birthday, 'State is updated with Confirmed Pet Age')),
      );

      await expectLater(petDefinitionBloc, emitsThrough(emitsDone));

      verify(analyticsService.event.pets.logSelectsPetAge('2018-01-01', 'AI Vet'));
    });

    test('PetHealthChatPetSpeciesConfirmed sets the species and ask for Sex', () {
      when(patientDefinitionNextStepUseCase.nextStep(any))
          .thenAnswer((_) => Future.value(AskPetDefinitionAction.askPetGender()));
      final event = PetSpeciesConfirmed((b) => b..petSpecies = 'dog');

      expectLater(
        petDefinitionBloc,
        emitsInOrder([
          isA<PetDefinitionState>(), // Initial State
          ownMessageTypeMatcher(PetHealthChatMessageType.dog),
          botMessageMatcher(PetHealthChatMessageType.selectSex),
          predicate((state) => state.viewModel is SingleOptionsSelectorViewModel && state.pet.species == 'dog'),
        ]),
      );

      petDefinitionBloc.add(event);
    });

    test('PetHealthChatPetSexConfirmed sets the sex and asks for Neutered', () {
      when(patientDefinitionNextStepUseCase.nextStep(any))
          .thenAnswer((_) => Future.value(AskPetDefinitionAction.askPetNeutered()));
      final event = PetSexConfirmed((b) => b..petSex = 'female');

      expectLater(
        petDefinitionBloc,
        emitsInOrder([
          isA<PetDefinitionState>(), // Initial State
          ownMessageTypeMatcher(PetHealthChatMessageType.female),
          botMessageMatcher(PetHealthChatMessageType.selectNeutered),
          predicate((state) => state.viewModel is YesNoViewModel && (state.pet as Pet).sex == 'female'),
        ]),
      );
      petDefinitionBloc.add(event);
    });

    test('PetHealthChatPetNeuteredConfirmed sets the neutered attribute', () {
      var petProfileListener;
      final pet = Pet(name: 'JMJ');
      when(petProfileBloc.listen(any)).thenAnswer((Invocation invocation) {
        petProfileListener = invocation.positionalArguments.first;
        return null;
      });

      when(petProfileBloc.add(any)).thenAnswer((_) {
        petProfileListener(PetProfilePetCreateSuccess((b) => b
          ..pet = pet
          ..pets = [pet]));
        return Future.value();
      });

      final event = PetNeuteredConfirmed((b) => b..petNeutered = true);
      expectLater(
        petDefinitionBloc,
        emitsInOrder([
          isA<PetDefinitionState>(), // Initial State
          ownMessageTypeMatcher(PetHealthChatMessageType.yes),
        ]),
      );
      petDefinitionBloc.add(event);
    });

    group('PetHealthChatPetConfirmed', () {
      test('sets the Pet if provided', () async {
        final pet = Pet(name: 'foo', species: 'dog', sex: 'female', neutered: false, birthdate: '1-01-2018');
        final event = PetConfirmed((b) => b..pet = pet);

        petDefinitionBloc.add(event);

        await expectLater(petDefinitionBloc, emitsThrough(emitsDone));
        expect(petDefinitionBloc.state.pet, pet);
      });
      test('sets the Features of the provided Pet', () async {
        when(getPetFeaturesUseCase.getFeatures(any))
            .thenAnswer((_) => Future.value(Features(insurance: true, telehealth: true)));
        final pet = Pet(name: 'foo', species: 'dog', sex: 'female', neutered: false, birthdate: '1-01-2018');
        final event = PetConfirmed((b) => b..pet = pet);

        petDefinitionBloc.add(event);

        await expectLater(petDefinitionBloc, emitsThrough(emitsDone));

        expect(petDefinitionBloc.state.pet.features.insurance, true);
        expect(petDefinitionBloc.state.pet.features.telehealth, true);
      });
    });

    test('PetDefinitionStarted asks for Pet Name', () {
      when(patientDefinitionNextStepUseCase.nextStep(any))
          .thenAnswer((_) => Future.value(AskPetDefinitionAction.askPetName()));
      final event = PetDefinitionStarted((b) => b..pet = Pet());

      expectLater(
        petDefinitionBloc,
        emitsInOrder([
          isA<PetDefinitionState>(), // Initial State
          botMessageMatcher(PetHealthChatMessageType.askPetName),
          predicate((state) => state.viewModel is TextInputSimpleChatViewModel),
        ]),
      );
      petDefinitionBloc.add(event);
    });

    group('Defining an existing pet', () {
      final existingPet = Pet(id: 1, name: 'Patrick');
      final petSelectionEvent = PetConfirmed((b) => b..pet = existingPet);
      final event = PetNeuteredConfirmed((b) => b..petNeutered = true);

      setUp(() {
        var firstRequest = true;
        when(updatePetUseCase.updatePet(existingPet)).thenAnswer((_) => Future.value(true));
        when(patientDefinitionNextStepUseCase.nextStep(any)).thenAnswer((_) {
          if (firstRequest) {
            firstRequest = false;
            return Future.value(AskPetDefinitionAction.askPetNeutered());
          }
          return Future.value(AskPetDefinitionAction.stopPetDefinitionProcess());
        });
      });

      test('PetDefinitionBloc is closed when PetProfileBloc emits the pet updated', () async {
        petDefinitionBloc.add(petSelectionEvent);
        petDefinitionBloc.add(event);

        await expectLater(
          petDefinitionBloc,
          emitsThrough(predicate((state) => state.pet == existingPet, 'State is updated with Pet')),
        );
        await expectLater(petDefinitionBloc, emitsThrough(emitsDone));
        verify(updatePetUseCase.updatePet(existingPet));
        verify(setUserPropertiesUseCase.setProperties());
      });
    });

    group('Defining a new pet', () {
      final petCreated = Pet(id: 2, name: 'Jmj', species: 'dog');
      final event = PetNeuteredConfirmed((b) => b..petNeutered = true);

      setUp(() {
        when(createPetUseCase.createPet(any)).thenAnswer((_) => Future.value(petCreated));
        when(patientDefinitionNextStepUseCase.nextStep(any))
            .thenAnswer((_) => Future.value(AskPetDefinitionAction.stopPetDefinitionProcess()));
      });

      test('PetDefinitionBloc is closed when PetProfileBloc emits the neutered pet created', () async {
        petDefinitionBloc.add(event);

        await expectLater(
          petDefinitionBloc,
          emitsThrough(predicate((state) => state.pet == petCreated, 'State is updated with Created Pet')),
        );
        await expectLater(petDefinitionBloc, emitsThrough(emitsDone));
        final neuteredPetMatcher = predicate((Pet pet) => pet.neutered == true, 'Create a neutered pet');
        verify(createPetUseCase.createPet(argThat(neuteredPetMatcher)));
        verify(setUserPropertiesUseCase.setProperties());
      });

      test(
          'PetDefinitionBloc is closed when PetProfileBloc emits StopPetDefinitionProcess launch logPetCreated on analytics',
          () async {
        petDefinitionBloc.add(event);

        await expectLater(
          petDefinitionBloc,
          emitsThrough(predicate((state) => state.pet == petCreated, 'State is updated with Created Pet')),
        );
        await expectLater(petDefinitionBloc, emitsThrough(emitsDone));
        verify(analyticsService.event.aivet.logPetCreated(petDefinitionBloc.state.pet.species));
        verify(setUserPropertiesUseCase.setProperties());
      });
    });
  });
}
