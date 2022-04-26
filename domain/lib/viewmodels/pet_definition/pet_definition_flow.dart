import 'package:common_barkibu_dart/viewmodels/viewmodels.dart';

abstract class PetDefinitionChatFlow extends ChatFlow implements PetHealthChatFlow, NutribotChatFlow {
  PetDefinitionChatFlow();

  factory PetDefinitionChatFlow.selectPet() = SelectPetPetDefinitionChatFlow;
  factory PetDefinitionChatFlow.selectSpecie() = SelectSpeciesPetDefinitionChatFlow;
  factory PetDefinitionChatFlow.selectSex() = SelectSexPetDefinitionChatFlow;
  factory PetDefinitionChatFlow.selectAgeRange() = SelectAgeRangePetDefinitionChatFlow;
  factory PetDefinitionChatFlow.selectAge() = AgeSelectorPetDefinitionChatFlow;
  factory PetDefinitionChatFlow.selectNeutered() = SelectNeuteredPetDefinitionChatFlow;
  factory PetDefinitionChatFlow.inputPetName() = InputPetNamePetDefinitionChatFlow;
  factory PetDefinitionChatFlow.inputPetBreed() = InputPetBreedPetDefinitionChatFlow;
}

class SelectPetPetDefinitionChatFlow extends PetDefinitionChatFlow {}

class SelectSpeciesPetDefinitionChatFlow extends PetDefinitionChatFlow {}

class SelectSexPetDefinitionChatFlow extends PetDefinitionChatFlow {}

class AgeSelectorPetDefinitionChatFlow extends PetDefinitionChatFlow {}

class SelectAgeRangePetDefinitionChatFlow extends PetDefinitionChatFlow {}

class SelectNeuteredPetDefinitionChatFlow extends PetDefinitionChatFlow {}

class InputPetNamePetDefinitionChatFlow extends PetDefinitionChatFlow {}

class InputPetBreedPetDefinitionChatFlow extends PetDefinitionChatFlow {}
