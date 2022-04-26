import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:common_barkibu_dart/bloc/nutribot_chat/nutribot_chat.dart';
import 'package:common_barkibu_dart/bloc/pet_health_chat/triage/triage_event.dart';
import 'package:common_barkibu_dart/models/models.dart';

part 'pet_definition_event.g.dart';

abstract class PetDefinitionEvent implements TriageEvent, NutribotChatEvent {}

abstract class PetDefinitionStarted
    implements Built<PetDefinitionStarted, PetDefinitionStartedBuilder>, PetDefinitionEvent {
  static Serializer<PetDefinitionStarted> get serializer => _$petDefinitionStartedSerializer;
  @nullable
  Pet get pet;

  bool get toHandOver;
  static void _initializeBuilder(PetDefinitionStartedBuilder builder) => builder..toHandOver = false;

  PetDefinitionStarted._();
  factory PetDefinitionStarted([void Function(PetDefinitionStartedBuilder) updates]) = _$PetDefinitionStarted;
}

abstract class PetNameConfirmed implements Built<PetNameConfirmed, PetNameConfirmedBuilder>, PetDefinitionEvent {
  static Serializer<PetNameConfirmed> get serializer => _$petNameConfirmedSerializer;
  String get petName;

  PetNameConfirmed._();
  factory PetNameConfirmed([void Function(PetNameConfirmedBuilder) updates]) = _$PetNameConfirmed;
}

abstract class PetSpeciesConfirmed
    implements Built<PetSpeciesConfirmed, PetSpeciesConfirmedBuilder>, PetDefinitionEvent {
  static Serializer<PetSpeciesConfirmed> get serializer => _$petSpeciesConfirmedSerializer;
  String get petSpecies;

  PetSpeciesConfirmed._();
  factory PetSpeciesConfirmed([void Function(PetSpeciesConfirmedBuilder) updates]) = _$PetSpeciesConfirmed;
}

abstract class PetSexConfirmed implements Built<PetSexConfirmed, PetSexConfirmedBuilder>, PetDefinitionEvent {
  static Serializer<PetSexConfirmed> get serializer => _$petSexConfirmedSerializer;
  String get petSex;

  PetSexConfirmed._();
  factory PetSexConfirmed([void Function(PetSexConfirmedBuilder) updates]) = _$PetSexConfirmed;
}

abstract class PetNeuteredConfirmed
    implements Built<PetNeuteredConfirmed, PetNeuteredConfirmedBuilder>, PetDefinitionEvent {
  static Serializer<PetNeuteredConfirmed> get serializer => _$petNeuteredConfirmedSerializer;
  bool get petNeutered;

  PetNeuteredConfirmed._();
  factory PetNeuteredConfirmed([void Function(PetNeuteredConfirmedBuilder) updates]) = _$PetNeuteredConfirmed;
}

abstract class PetBirthdayConfirmed
    implements Built<PetBirthdayConfirmed, PetBirthdayConfirmedBuilder>, PetDefinitionEvent {
  static Serializer<PetBirthdayConfirmed> get serializer => _$petBirthdayConfirmedSerializer;
  String get petBirthday;

  PetBirthdayConfirmed._();
  factory PetBirthdayConfirmed([void Function(PetBirthdayConfirmedBuilder) updates]) = _$PetBirthdayConfirmed;
}

abstract class PetBreedConfirmed implements Built<PetBreedConfirmed, PetBreedConfirmedBuilder>, PetDefinitionEvent {
  static Serializer<PetBreedConfirmed> get serializer => _$petBreedConfirmedSerializer;
  @nullable
  String get petBreed;

  @nullable
  String get breedUuid;

  @nullable
  String get size;

  PetBreedConfirmed._();
  factory PetBreedConfirmed([void Function(PetBreedConfirmedBuilder) updates]) = _$PetBreedConfirmed;
}

abstract class PetConfirmed implements Built<PetConfirmed, PetConfirmedBuilder>, PetDefinitionEvent {
  static Serializer<PetConfirmed> get serializer => _$petConfirmedSerializer;

  Pet get pet;

  PetConfirmed._();
  factory PetConfirmed([void Function(PetConfirmedBuilder) updates]) = _$PetConfirmed;
}

abstract class PetDefinedAndPersisted
    implements Built<PetDefinedAndPersisted, PetDefinedAndPersistedBuilder>, PetDefinitionEvent {
  static Serializer<PetDefinedAndPersisted> get serializer => _$petDefinedAndPersistedSerializer;

  Pet get pet;

  PetDefinedAndPersisted._();
  factory PetDefinedAndPersisted([void Function(PetDefinedAndPersistedBuilder) updates]) = _$PetDefinedAndPersisted;
}
