import 'package:common_barkibu_dart/configuration.dart';
import 'package:common_barkibu_dart/domain/pet/get_pets_use_case.dart';
import 'package:common_barkibu_dart/models/aivet/aivet.dart';
import 'package:common_barkibu_dart/models/pet.dart';

abstract class PatientDefinitionNextStepUseCase {
  Future<AskPetDefinitionAction> nextStep(Pet model);
}

class PatientDefinitionNextStepUseCaseImpl implements PatientDefinitionNextStepUseCase {
  final GetPetsUseCase getPetsUseCase;
  final Configuration configuration;

  PatientDefinitionNextStepUseCaseImpl(this.getPetsUseCase, this.configuration);

  @override
  Future<AskPetDefinitionAction> nextStep(Pet pet) async {
    if (pet == null) {
      return AskPetDefinitionAction.selectPet(await getPetsUseCase.getPets());
    } else if (pet.name == null) {
      return AskPetDefinitionAction.askPetName();
    } else if (pet.species == null) {
      return AskPetDefinitionAction.askPetSpecies();
    } else if (pet.breed == null && configuration.petBreedEnabled) {
      return AskPetDefinitionAction.askPetBreed();
    } else if (pet.birthdate == null) {
      return AskPetDefinitionAction.askPetBirthdate();
    } else if (pet.sex == null) {
      return AskPetDefinitionAction.askPetGender();
    } else if (pet.neutered == null) {
      return AskPetDefinitionAction.askPetNeutered();
    }

    return AskPetDefinitionAction.stopPetDefinitionProcess();
  }
}
