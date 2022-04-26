import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/models/models.dart';

part 'triage_state.g.dart';

enum TriageFlow { petDefinition, mainSymptom, full }

abstract class TriageState {
  @nullable
  String get userQuestion;
  @nullable
  Anamnesis get anamnesisResults;
  @nullable
  AiVetModel get aiVetModel;
  @nullable
  ChatViewModel get viewModel;
  @nullable
  TriageFlow get flow;

  bool get toHandOver;

  TriageState rebuild(void Function(dynamic) updates);
}

abstract class TriageInitial implements Built<TriageInitial, TriageInitialBuilder>, TriageState {
  static Serializer<TriageInitial> get serializer => _$triageInitialSerializer;

  static void _initializeBuilder(TriageInitialBuilder b) => b
    ..aiVetModel = AiVetModel()
    ..toHandOver = false;
  TriageInitial._();
  factory TriageInitial([Function(TriageInitialBuilder builder) updates]) = _$TriageInitial;
}

abstract class TriageInitSuccess implements Built<TriageInitSuccess, TriageInitSuccessBuilder>, TriageState {
  TriageInitSuccess._();

  static void _initializeBuilder(TriageInitSuccessBuilder b) => b..aiVetModel = AiVetModel();
  factory TriageInitSuccess([Function(TriageInitSuccessBuilder builder) updates]) = _$TriageInitSuccess;
}

abstract class TriagePetDefinitionHandOverSuccess
    implements Built<TriagePetDefinitionHandOverSuccess, TriagePetDefinitionHandOverSuccessBuilder>, TriageState {
  static Serializer<TriagePetDefinitionHandOverSuccess> get serializer =>
      _$triagePetDefinitionHandOverSuccessSerializer;

  TriagePetDefinitionHandOverSuccess._();

  factory TriagePetDefinitionHandOverSuccess([Function(TriagePetDefinitionHandOverSuccessBuilder builder) updates]) =
      _$TriagePetDefinitionHandOverSuccess;
}

abstract class TriageSymptomDefinitionSkippedSuccess
    implements Built<TriageSymptomDefinitionSkippedSuccess, TriageSymptomDefinitionSkippedSuccessBuilder>, TriageState {
  static Serializer<TriageSymptomDefinitionSkippedSuccess> get serializer =>
      _$triageSymptomDefinitionSkippedSuccessSerializer;

  TriageSymptomDefinitionSkippedSuccess._();
  factory TriageSymptomDefinitionSkippedSuccess([void Function(TriageSymptomDefinitionSkippedSuccessBuilder) updates]) =
      _$TriageSymptomDefinitionSkippedSuccess;
}

abstract class TriageDiagnoseSuccess
    implements Built<TriageDiagnoseSuccess, TriageDiagnoseSuccessBuilder>, TriageState {
  static Serializer<TriageDiagnoseSuccess> get serializer => _$triageDiagnoseSuccessSerializer;

  TriageDiagnoseSuccess._();
  factory TriageDiagnoseSuccess([Function(TriageDiagnoseSuccessBuilder builder) updates]) = _$TriageDiagnoseSuccess;
}
