import 'package:common_barkibu_dart/models/breed.dart';

import 'consultation_options.dart';

class Consultation {
  final int maxNameLength;

  String name;
  Species specie;
  Breed breed;
  Sex sex;
  Age age;
  Symptom symptom;
  SymptomDuration duration;

  Consultation(this.maxNameLength);

  bool isNameValid() {
    var length = name?.length ?? 0;
    return length > 0 && length <= maxNameLength;
  }
}
