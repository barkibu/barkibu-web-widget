import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import '../../service_locator.dart' as test_service_locator;
import 'package:common_barkibu_dart/domain/pet/get_pets_use_case.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:common_barkibu_dart/models/pet.dart';
import 'package:common_barkibu_dart/models/aivet/aivet.dart';
import 'package:common_barkibu_dart/domain/aivet/patient_definition_next_step_use_case.dart';

class GetPetsUseCaseMock extends Mock implements GetPetsUseCase {}

void main() {
  test_service_locator.ServiceLocator.setup();
  PatientDefinitionNextStepUseCase nextStepUseCase;
  final configuration = ServiceLocator.container<Configuration>();
  GetPetsUseCase petsUseCase;
  final pet1 = Pet(id: 1);
  final pet2 = Pet(id: 2);
  final existingPets = [pet1, pet2];

  setUp(() {
    petsUseCase = GetPetsUseCaseMock();
    nextStepUseCase = PatientDefinitionNextStepUseCaseImpl(petsUseCase, configuration);
    when(configuration.petBreedEnabled).thenReturn(true);
    when(petsUseCase.getPets()).thenAnswer((_) => Future.value(existingPets));
  });

  group('nextStep', () {
    test('returns select pet action with list of pets', () async {
      var nextStep = await nextStepUseCase.nextStep(null);
      expect(nextStep, isA<SelectPetAiVetAction>());
      expect((nextStep as SelectPetAiVetAction).pets, existingPets);
    });

    test('returns ask for name action when no fields are set', () async {
      var nextStep = await nextStepUseCase.nextStep(Pet());
      expect(nextStep, isA<AskPetNameAiVetAction>());
    });

    test('returns ask for species action when name is set', () async {
      var nextStep = await nextStepUseCase.nextStep(Pet(name: 'Snoopy'));
      expect(nextStep, isA<AskPetSpeciesAiVetAction>());
    });

    test('returns ask for breed when species is set', () async {
      var nextStep = await nextStepUseCase.nextStep(Pet(name: 'Snoopy', species: 'dog'));
      expect(nextStep, isA<AskPetBreedAiVetAction>());
    });

    test('returns ask for age when species is set', () async {
      var nextStep = await nextStepUseCase.nextStep(Pet(name: 'Snoopy', species: 'dog', breed: 'pug'));
      expect(nextStep, isA<AskPetBirthdateAiVetAction>());
    });

    test('returns ask for sex when age is set', () async {
      var pet = Pet(name: 'Snoopy', species: 'dog', breed: 'pug', birthdate: '2020-01-01');
      var nextStep = await nextStepUseCase.nextStep(pet);
      expect(nextStep, isA<AskPetGenderAiVetAction>());
    });

    test('returns ask for sex when age is set', () async {
      var pet = Pet(name: 'Snoopy', species: 'dog', breed: 'pug', birthdate: '2020-01-01');
      var nextStep = await nextStepUseCase.nextStep(pet);
      expect(nextStep, isA<AskPetGenderAiVetAction>());
    });

    test('returns ask for sprayed/neutered when gender is set', () async {
      var pet = Pet(name: 'Snoopy', species: 'dog', breed: 'pug', birthdate: '2020-01-01', sex: 'female');
      var nextStep = await nextStepUseCase.nextStep(pet);
      expect(nextStep, isA<AskPetNeuteredAiVetAction>());
    });

    test('returns null when all fields are filled', () async {
      var pet =
          Pet(name: 'Snoopy', species: 'dog', breed: 'pug', birthdate: '2020-01-01', sex: 'female', neutered: true);
      var nextStep = await nextStepUseCase.nextStep(pet);
      expect(nextStep, isA<StopPetDefinitionProcess>());
    });
  });
}
