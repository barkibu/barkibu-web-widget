import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';

part 'triage_event.g.dart';

abstract class TriageEvent extends PetHealthChatEvent {}

abstract class TriageInitLaunched implements Built<TriageInitLaunched, TriageInitLaunchedBuilder>, TriageEvent {
  static Serializer<TriageInitLaunched> get serializer => _$triageInitLaunchedSerializer;

  @nullable
  String get question;
  @nullable
  Pet get pet;
  @nullable
  TriageFlow get flow;
  bool get toHandOver;

  static void _initializeBuilder(TriageInitLaunchedBuilder builder) => builder..toHandOver = false;

  TriageInitLaunched._();
  factory TriageInitLaunched([void Function(TriageInitLaunchedBuilder) updates]) = _$TriageInitLaunched;
}

abstract class TriageSubStateUpdated
    implements Built<TriageSubStateUpdated, TriageSubStateUpdatedBuilder>, TriageEvent {
  static Serializer<TriageSubStateUpdated> get serializer => _$triageSubStateUpdatedSerializer;

  TriageState get triageState;

  TriageSubStateUpdated._();
  factory TriageSubStateUpdated([void Function(TriageSubStateUpdatedBuilder) updates]) = _$TriageSubStateUpdated;
}

abstract class TriagePetDefinitionEnded
    implements Built<TriagePetDefinitionEnded, TriagePetDefinitionEndedBuilder>, TriageEvent {
  static Serializer<TriagePetDefinitionEnded> get serializer => _$triagePetDefinitionEndedSerializer;

  TriagePetDefinitionEnded._();
  factory TriagePetDefinitionEnded([void Function(TriagePetDefinitionEndedBuilder) updates]) =
      _$TriagePetDefinitionEnded;
}

abstract class TriageSymptomDefinitionEnded
    implements Built<TriageSymptomDefinitionEnded, TriageSymptomDefinitionEndedBuilder>, TriageEvent {
  static Serializer<TriageSymptomDefinitionEnded> get serializer => _$triageSymptomDefinitionEndedSerializer;

  Symptom get symptom;
  List<String> get unknownSymptoms;
  bool get skipped;

  static void _initializeBuilder(TriageSymptomDefinitionEndedBuilder builder) => builder
    ..unknownSymptoms = []
    ..skipped = false;

  TriageSymptomDefinitionEnded._();
  factory TriageSymptomDefinitionEnded([void Function(TriageSymptomDefinitionEndedBuilder) updates]) =
      _$TriageSymptomDefinitionEnded;
}

abstract class PetHealthChatAddMoreSymptomsPressed
    implements Built<PetHealthChatAddMoreSymptomsPressed, PetHealthChatAddMoreSymptomsPressedBuilder>, TriageEvent {
  static Serializer<PetHealthChatAddMoreSymptomsPressed> get serializer =>
      _$petHealthChatAddMoreSymptomsPressedSerializer;
  bool get userWantsToAddMoreSymptoms;

  PetHealthChatAddMoreSymptomsPressed._();
  factory PetHealthChatAddMoreSymptomsPressed([void Function(PetHealthChatAddMoreSymptomsPressedBuilder) updates]) =
      _$PetHealthChatAddMoreSymptomsPressed;
}

class TriageProcessCompleted implements TriageEvent {}
