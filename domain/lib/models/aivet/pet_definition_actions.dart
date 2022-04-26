import 'package:common_barkibu_dart/models/aivet/aivet_actions.dart';
import 'package:common_barkibu_dart/models/models.dart';

abstract class AskPetDefinitionAction implements AiVetAction {
  factory AskPetDefinitionAction.askPetName() = AskPetNameAiVetAction;

  factory AskPetDefinitionAction.askPetSpecies() = AskPetSpeciesAiVetAction;

  factory AskPetDefinitionAction.askPetGender() = AskPetGenderAiVetAction;

  factory AskPetDefinitionAction.askPetNeutered() = AskPetNeuteredAiVetAction;

  factory AskPetDefinitionAction.askPetBreed() = AskPetBreedAiVetAction;

  factory AskPetDefinitionAction.askPetBirthdate() = AskPetBirthdateAiVetAction;

  factory AskPetDefinitionAction.selectPet(List<Pet> pets) => SelectPetAiVetAction(pets);

  factory AskPetDefinitionAction.stopPetDefinitionProcess() => StopPetDefinitionProcess();
}

class AskPetNameAiVetAction implements AskPetDefinitionAction {}

class AskPetGenderAiVetAction implements AskPetDefinitionAction {}

class AskPetSpeciesAiVetAction implements AskPetDefinitionAction {}

class AskPetNeuteredAiVetAction implements AskPetDefinitionAction {}

class AskPetBreedAiVetAction implements AskPetDefinitionAction {}

class AskPetBirthdateAiVetAction implements AskPetDefinitionAction {}

class StopPetDefinitionProcess implements AskPetDefinitionAction {}

class SelectPetAiVetAction implements AskPetDefinitionAction {
  final List<Pet> pets;

  SelectPetAiVetAction(this.pets);
}
