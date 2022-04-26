import 'package:common_barkibu_dart/models/consultation_options.dart';
import 'package:common_barkibu_dart/models/pet.dart';

class AiVetModel {
  Pet pet;
  Species species;
  Sex gender;
  SymptomFound symptomFound;
  List<Symptom> symptoms = [];
  SymptomDuration duration;
  // List<String> possibleConditions; // Not Used
  List<String> unknownSymptoms = [];
  bool addMoreSymptoms;
  bool shouldStopAnamnesis = false;
  String consultationId;
  bool symptomDefinitionSkipped = false;
  bool triageCompleted = false;

  bool get shouldAskForMainSymptom => symptoms.isEmpty || symptomFound == null && addMoreSymptoms == null;
  bool get shouldAskForOtherSymptom => symptoms.isEmpty || symptomFound == null && addMoreSymptoms;
  bool get shouldContinueAnamnesis => !shouldStopAnamnesis;
}
