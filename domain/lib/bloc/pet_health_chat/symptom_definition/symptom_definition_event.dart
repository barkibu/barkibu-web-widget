part of '../pet_health_chat_event.dart';

abstract class SymptomDefinitionEvent extends TriageEvent {}

/// Event initializing the bloc
/// Requires to be passed:
///  - A pet instance
///  - A text on which symptom search will be triggered [optional]
///  - A nextQuestion, to start asking presence/duration/frequency
///
abstract class PetHealthChatSymptomDefinitionStarted
    implements
        Built<PetHealthChatSymptomDefinitionStarted, PetHealthChatSymptomDefinitionStartedBuilder>,
        SymptomDefinitionEvent {
  static Serializer<PetHealthChatSymptomDefinitionStarted> get serializer =>
      _$petHealthChatSymptomDefinitionStartedSerializer;

  Pet get pet;

  @nullable
  String get userQuestion;

  @nullable
  NextQuestion get nextQuestion;

  @nullable
  User get user;

  @nullable
  bool get isMainSymptom;

  PetHealthChatSymptomDefinitionStarted._();
  factory PetHealthChatSymptomDefinitionStarted([void Function(PetHealthChatSymptomDefinitionStartedBuilder) updates]) =
      _$PetHealthChatSymptomDefinitionStarted;
}

/// Event setting the symptom name the pet parent is looking help for
abstract class PetHealthChatSymptomNameSent
    implements Built<PetHealthChatSymptomNameSent, PetHealthChatSymptomNameSentBuilder>, SymptomDefinitionEvent {
  static Serializer<PetHealthChatSymptomNameSent> get serializer => _$petHealthChatSymptomNameSentSerializer;

  String get symptom;

  PetHealthChatSymptomNameSent._();
  factory PetHealthChatSymptomNameSent([void Function(PetHealthChatSymptomNameSentBuilder) updates]) =
      _$PetHealthChatSymptomNameSent;
}

/// Event to trigger when the Pet Parent selected a symptom
abstract class PetHealthChatConfirmSymptomPressed
    implements
        Built<PetHealthChatConfirmSymptomPressed, PetHealthChatConfirmSymptomPressedBuilder>,
        SymptomDefinitionEvent {
  static Serializer<PetHealthChatConfirmSymptomPressed> get serializer =>
      _$petHealthChatConfirmSymptomPressedSerializer;
  OptionViewModel<SymptomFound> get symptomFoundViewModel;

  PetHealthChatConfirmSymptomPressed._();
  factory PetHealthChatConfirmSymptomPressed([void Function(PetHealthChatConfirmSymptomPressedBuilder) updates]) =
      _$PetHealthChatConfirmSymptomPressed;
}

/// Event to trigger when the PetParent selected a duration for the symptom considered
abstract class PetHealthChatSetSymptomDurationCyclePressed
    implements
        Built<PetHealthChatSetSymptomDurationCyclePressed, PetHealthChatSetSymptomDurationCyclePressedBuilder>,
        SymptomDefinitionEvent {
  static Serializer<PetHealthChatSetSymptomDurationCyclePressed> get serializer =>
      _$petHealthChatSetSymptomDurationCyclePressedSerializer;

  SymptomDurationCycle get optionDuration;

  PetHealthChatSetSymptomDurationCyclePressed._();
  factory PetHealthChatSetSymptomDurationCyclePressed(
          [void Function(PetHealthChatSetSymptomDurationCyclePressedBuilder) updates]) =
      _$PetHealthChatSetSymptomDurationCyclePressed;
}

/// Event to trigger when the PetParent selected a frequency for the symptom considered
abstract class PetHealthChatSetSymptomFrequencyCyclePressed
    implements
        Built<PetHealthChatSetSymptomFrequencyCyclePressed, PetHealthChatSetSymptomFrequencyCyclePressedBuilder>,
        SymptomDefinitionEvent {
  static Serializer<PetHealthChatSetSymptomFrequencyCyclePressed> get serializer =>
      _$petHealthChatSetSymptomFrequencyCyclePressedSerializer;
  SymptomFrequencyCycle get optionFrequency;

  PetHealthChatSetSymptomFrequencyCyclePressed._();
  factory PetHealthChatSetSymptomFrequencyCyclePressed(
          [void Function(PetHealthChatSetSymptomFrequencyCyclePressedBuilder) updates]) =
      _$PetHealthChatSetSymptomFrequencyCyclePressed;
}

/// Event to trigger when the PetParent selects whether or not a symptom is present when asked
abstract class PetHealthChatSymptomPresencePressed
    implements
        Built<PetHealthChatSymptomPresencePressed, PetHealthChatSymptomPresencePressedBuilder>,
        SymptomDefinitionEvent {
  static Serializer<PetHealthChatSymptomPresencePressed> get serializer =>
      _$petHealthChatSymptomPresencePressedSerializer;
  @nullable
  bool get presence;

  PetHealthChatSymptomPresencePressed._();
  factory PetHealthChatSymptomPresencePressed([void Function(PetHealthChatSymptomPresencePressedBuilder) updates]) =
      _$PetHealthChatSymptomPresencePressed;
}

/// Event to skip symptom definition and connect directly to a vet
abstract class PetHealthChatSkipSymptomPressed
    implements Built<PetHealthChatSkipSymptomPressed, PetHealthChatSkipSymptomPressedBuilder>, SymptomDefinitionEvent {
  static Serializer<PetHealthChatSkipSymptomPressed> get serializer => _$petHealthChatSkipSymptomPressedSerializer;

  PetHealthChatSkipSymptomPressed._();
  factory PetHealthChatSkipSymptomPressed([void Function(PetHealthChatSkipSymptomPressedBuilder) updates]) =
      _$PetHealthChatSkipSymptomPressed;
}
