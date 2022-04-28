import 'package:common_barkibu_dart/messages/petProfileMessages.i18n.dart';

class PetProfileMessages_tsc extends PetProfileMessages {
  const PetProfileMessages_tsc();

  @override
  String get title => 'Your Pet History and Profile';

  @override
  String get subtitle => 'See your past consultations, recommendations, and pet info';

  @override
  String get assessmentHistory => 'Virtual Vet Consultations';

  @override
  AgeEstimationPetProfileMessages get ageEstimation => AgeEstimationPetProfileMessages_tsc(this);

  @override
  FormFieldsTitlePetProfileMessages get formFieldsTitle => FormFieldsTitlePetProfileMessages_tsc(this);

  @override
  FormFieldsHintPetProfileMessages get formFieldsHint => FormFieldsHintPetProfileMessages_tsc(this);
}

class FormFieldsTitlePetProfileMessages_tsc extends FormFieldsTitlePetProfileMessages {
  FormFieldsTitlePetProfileMessages_tsc(PetProfileMessages parent) : super(parent);
  @override
  String get castrated => 'Neutered';
}

class FormFieldsHintPetProfileMessages_tsc extends FormFieldsHintPetProfileMessages {
  FormFieldsHintPetProfileMessages_tsc(PetProfileMessages parent) : super(parent);
  @override
  String get castrated => 'Neutered';
}

class AgeEstimationPetProfileMessages_tsc extends AgeEstimationPetProfileMessages {
  AgeEstimationPetProfileMessages_tsc(PetProfileMessages parent) : super(parent);

  @override
  String title(String species) => "How do I find out my ${species.toLowerCase()}'s age?";
}