import 'package:common_barkibu_dart/bloc/bloc.dart';
import 'package:common_barkibu_dart/domain/domain.dart';
import 'package:common_barkibu_dart/domain/pet/delete_pet_use_case.dart';
import 'package:common_barkibu_dart/domain/pet/get_breeds_use_case.dart';
import 'package:common_barkibu_dart/domain/pet/update_pet_use_case.dart';
import 'package:common_barkibu_dart/models/pet.dart';
import 'package:common_barkibu_dart/services/analytics_service.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks/service_mocks.dart';

class MockCreatePetUseCase extends Mock implements CreatePetUseCase {}

class MockUpdatePetUseCase extends Mock implements UpdatePetUseCase {}

class MockBreedsUseCase extends Mock implements GetBreedsUseCase {}

class MockDeletePetUseCase extends Mock implements DeletePetUseCase {}

class MockGetPetsUseCase extends Mock implements GetPetsUseCase {}

class MockSetUserPropertiesUseCase extends Mock implements SetUserPropertiesUseCase {}

void main() {
  GetPetsUseCase getPetsUseCase;
  CreatePetUseCase createPetUseCase;
  UpdatePetUseCase updatePetUseCase;
  DeletePetUseCase deletePetUseCase;
  PetProfileBloc petProfileBloc;
  AnalyticsService analyticsService;
  SetUserPropertiesUseCase setUserPropertiesUseCase;

  final pet = Pet(id: 1);
  final emptyPet = Pet();
  var pets = <Pet>[];

  setUp(() {
    pets = [pet];
    createPetUseCase = MockCreatePetUseCase();
    getPetsUseCase = MockGetPetsUseCase();
    updatePetUseCase = MockUpdatePetUseCase();
    deletePetUseCase = MockDeletePetUseCase();
    analyticsService = MockAnalyticsService();
    setUserPropertiesUseCase = MockSetUserPropertiesUseCase();
    petProfileBloc = PetProfileBloc(
      getPetsUseCase,
      createPetUseCase,
      updatePetUseCase,
      deletePetUseCase,
      analyticsService,
      setUserPropertiesUseCase,
    );
    when(getPetsUseCase.getPets()).thenAnswer((_) => Future.value(pets));
    when(getPetsUseCase.getPet(pet.id)).thenAnswer((_) => Future.value(pet));
  });
  tearDown(() async {
    await petProfileBloc?.close();
  });

  group('PetProfileBloc', () {
    test('initial state is correct', () {
      expect(petProfileBloc.initialState, isA<PetProfileInitial>());
    });
  });

  group('PetProfilePetCreated event', () {
    group('Successful', () {
      setUp(() {
        when(createPetUseCase.createPet(emptyPet)).thenAnswer((_) => Future.value(pet));
      });
      test('it yields PetProfilePetCreateSuccess state with the new pet', () async {
        petProfileBloc.add(PetProfilePetCreated((b) => b..pet = emptyPet));
        await expectLater(
          petProfileBloc,
          emitsInOrder([
            isA<PetProfileInitial>(),
            isA<PetProfilePetCreateInProgress>(),
            isA<PetProfilePetCreateSuccess>(),
          ]),
        );

        expect(petProfileBloc.state.pets.length, 1);
        expect(petProfileBloc.state.pets.first, pet);
        expect(petProfileBloc.state.pets.first.id, pet.id);
        expect(emptyPet.id, null);
      });
    });

    group('Failing', () {
      setUp(() {
        when(createPetUseCase.createPet(pet)).thenAnswer((_) => Future.value(null));
      });
      test('it yields PetProfilePetCreateFailure state without pet if request fails', () async {
        petProfileBloc.add(PetProfilePetCreated((b) => b..pet = pet));
        await expectLater(
          petProfileBloc,
          emitsInOrder([
            isA<PetProfileInitial>(),
            isA<PetProfilePetCreateInProgress>(),
            isA<PetProfilePetCreateFailure>(),
          ]),
        );

        expect(petProfileBloc.state.pets.length, 0);
      });
    });
  });

  group('PetProfilePetUpdated event', () {
    final petUpdated = pet.createCopy()..name = 'JMJ';

    group('Successful', () {
      setUp(() {
        when(updatePetUseCase.updatePet(petUpdated)).thenAnswer((_) => Future.value(true));
      });
      test('it yields PetProfilePetUpdateSuccess state with the updated pet', () async {
        petProfileBloc.add(PetProfileStarted());
        petProfileBloc.add(PetProfilePetUpdated((b) => b..pet = petUpdated));
        await expectLater(
          petProfileBloc,
          emitsInOrder([
            isA<PetProfileInitial>(),
            isA<PetProfileLoadInProgress>(),
            isA<PetProfileLoadSuccess>(),
            isA<PetProfilePetUpdateInProgress>(),
            isA<PetProfilePetUpdateSuccess>(),
          ]),
        );

        expect(petProfileBloc.state.pets.length, 1);
        expect(petProfileBloc.state.pets.first, petUpdated);
        verify(setUserPropertiesUseCase.setProperties());
      });
    });

    group('Failing', () {
      setUp(() {
        when(updatePetUseCase.updatePet(petUpdated)).thenAnswer((_) => Future.value(false));
      });
      test('it yields PetProfilePetUpdateFailure state with the updated pet if failing', () async {
        petProfileBloc.add(PetProfileStarted());
        petProfileBloc.add(PetProfilePetUpdated((b) => b..pet = petUpdated));
        await expectLater(
          petProfileBloc,
          emitsInOrder([
            isA<PetProfileInitial>(),
            isA<PetProfileLoadInProgress>(),
            isA<PetProfileLoadSuccess>(),
            isA<PetProfilePetUpdateInProgress>(),
            isA<PetProfilePetUpdateFailure>(),
          ]),
        );

        final lastState = petProfileBloc.state;
        expect(lastState.pets.length, 1);
        expect(lastState.pets.first, pet);
      });
    });
  });

  group('PetProfileStarted event', () {
    group('With no pets', () {
      setUp(() {
        when(getPetsUseCase.getPets()).thenAnswer((_) => Future.value([]));
      });

      test('it yields PetProfileLoadSuccess with an empty List when no pets', () async {
        petProfileBloc.add(PetProfileStarted());

        await expectLater(
          petProfileBloc,
          emitsInOrder([isA<PetProfileInitial>(), isA<PetProfileLoadInProgress>(), isA<PetProfileLoadSuccess>()]),
        );
        expect(petProfileBloc.state.pets.length, 0);
      });
    });

    group('With pets', () {
      Matcher petLoadedMatcher(Pet pet) =>
          predicate((PetProfileState state) => state is PetProfileLoadSuccess && state.pets.first == pet);

      test('it yields PetProfileLoadSuccess with an non empty List when there are pets', () async {
        petProfileBloc.add(PetProfileStarted());
        await expectLater(
          petProfileBloc,
          emitsInOrder([
            isA<PetProfileInitial>(),
            isA<PetProfileLoadInProgress>(),
            PetProfileLoadSuccess((b) => b..pets = pets)
          ]),
        );
        verify(getPetsUseCase.getPets());
      });

      test('it yields PetProfileLoadSuccess when requesting a single pet', () async {
        petProfileBloc.add(PetProfileStarted((b) => b..petId = pet.id));
        await expectLater(
          petProfileBloc,
          emitsInOrder([
            isA<PetProfileInitial>(),
            isA<PetProfileLoadInProgress>(),
            petLoadedMatcher(pet),
          ]),
        );
        verify(getPetsUseCase.getPet(pet.id));
      });
    });
  });

  group('PetProfilePetDeleted event', () {
    final petDeleted = pet.createCopy();
    group('Successful', () {
      setUp(() {
        when(deletePetUseCase.deletePet(petDeleted.id)).thenAnswer((_) => Future.value(true));
      });
      test('it yields PetProfilePetDeleteSuccess with pet deleted', () async {
        petProfileBloc.add(PetProfileStarted());
        petProfileBloc.add(PetProfilePetDeleted((b) => b..pet = petDeleted));
        await expectLater(
          petProfileBloc,
          emitsInOrder([
            isA<PetProfileInitial>(),
            isA<PetProfileLoadInProgress>(),
            isA<PetProfileLoadSuccess>(),
            isA<PetProfilePetDeleteInProgress>(),
            isA<PetProfilePetDeleteSuccess>(),
          ]),
        );
        expect(petProfileBloc.state.pets.length, 0);
        verify(setUserPropertiesUseCase.setProperties());
      });
    });

    group('Failing', () {
      setUp(() {
        when(deletePetUseCase.deletePet(petDeleted.id)).thenAnswer((_) => Future.value(false));
      });
      test('it yields PetProfilePetDeleteFailure with pet deleted', () async {
        petProfileBloc.add(PetProfileStarted());
        petProfileBloc.add(PetProfilePetDeleted((b) => b..pet = petDeleted));
        await expectLater(
          petProfileBloc,
          emitsInOrder([
            isA<PetProfileInitial>(),
            isA<PetProfileLoadInProgress>(),
            isA<PetProfileLoadSuccess>(),
            isA<PetProfilePetDeleteInProgress>(),
            isA<PetProfilePetDeleteFailure>(),
          ]),
        );
        expect(petProfileBloc.state.pets.length, 1);
      });
    });
  });
}
