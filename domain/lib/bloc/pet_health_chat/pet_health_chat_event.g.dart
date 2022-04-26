// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_health_chat_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PetHealthChatSubStateUpdated>
    _$petHealthChatSubStateUpdatedSerializer =
    new _$PetHealthChatSubStateUpdatedSerializer();
Serializer<PetHealthChatInitLaunched> _$petHealthChatInitLaunchedSerializer =
    new _$PetHealthChatInitLaunchedSerializer();
Serializer<PetHealthChatFeedbackPressed>
    _$petHealthChatFeedbackPressedSerializer =
    new _$PetHealthChatFeedbackPressedSerializer();
Serializer<PetHealthChatSymptomDefinitionStarted>
    _$petHealthChatSymptomDefinitionStartedSerializer =
    new _$PetHealthChatSymptomDefinitionStartedSerializer();
Serializer<PetHealthChatSymptomNameSent>
    _$petHealthChatSymptomNameSentSerializer =
    new _$PetHealthChatSymptomNameSentSerializer();
Serializer<PetHealthChatConfirmSymptomPressed>
    _$petHealthChatConfirmSymptomPressedSerializer =
    new _$PetHealthChatConfirmSymptomPressedSerializer();
Serializer<PetHealthChatSetSymptomDurationCyclePressed>
    _$petHealthChatSetSymptomDurationCyclePressedSerializer =
    new _$PetHealthChatSetSymptomDurationCyclePressedSerializer();
Serializer<PetHealthChatSetSymptomFrequencyCyclePressed>
    _$petHealthChatSetSymptomFrequencyCyclePressedSerializer =
    new _$PetHealthChatSetSymptomFrequencyCyclePressedSerializer();
Serializer<PetHealthChatSymptomPresencePressed>
    _$petHealthChatSymptomPresencePressedSerializer =
    new _$PetHealthChatSymptomPresencePressedSerializer();
Serializer<PetHealthChatSkipSymptomPressed>
    _$petHealthChatSkipSymptomPressedSerializer =
    new _$PetHealthChatSkipSymptomPressedSerializer();

class _$PetHealthChatSubStateUpdatedSerializer
    implements StructuredSerializer<PetHealthChatSubStateUpdated> {
  @override
  final Iterable<Type> types = const [
    PetHealthChatSubStateUpdated,
    _$PetHealthChatSubStateUpdated
  ];
  @override
  final String wireName = 'PetHealthChatSubStateUpdated';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PetHealthChatSubStateUpdated object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'petHealthChatState',
      serializers.serialize(object.petHealthChatState,
          specifiedType: const FullType(PetHealthChatState)),
    ];

    return result;
  }

  @override
  PetHealthChatSubStateUpdated deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetHealthChatSubStateUpdatedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'petHealthChatState':
          result.petHealthChatState = serializers.deserialize(value,
                  specifiedType: const FullType(PetHealthChatState))
              as PetHealthChatState;
          break;
      }
    }

    return result.build();
  }
}

class _$PetHealthChatInitLaunchedSerializer
    implements StructuredSerializer<PetHealthChatInitLaunched> {
  @override
  final Iterable<Type> types = const [
    PetHealthChatInitLaunched,
    _$PetHealthChatInitLaunched
  ];
  @override
  final String wireName = 'PetHealthChatInitLaunched';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PetHealthChatInitLaunched object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(User)),
      'question',
      serializers.serialize(object.question,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(PetHealthChatType)),
    ];
    if (object.pet != null) {
      result
        ..add('pet')
        ..add(serializers.serialize(object.pet,
            specifiedType: const FullType(Pet)));
    }
    return result;
  }

  @override
  PetHealthChatInitLaunched deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetHealthChatInitLaunchedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'pet':
          result.pet = serializers.deserialize(value,
              specifiedType: const FullType(Pet)) as Pet;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(User)) as User;
          break;
        case 'question':
          result.question = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(PetHealthChatType))
              as PetHealthChatType;
          break;
      }
    }

    return result.build();
  }
}

class _$PetHealthChatFeedbackPressedSerializer
    implements StructuredSerializer<PetHealthChatFeedbackPressed> {
  @override
  final Iterable<Type> types = const [
    PetHealthChatFeedbackPressed,
    _$PetHealthChatFeedbackPressed
  ];
  @override
  final String wireName = 'PetHealthChatFeedbackPressed';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PetHealthChatFeedbackPressed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isAnswerYes',
      serializers.serialize(object.isAnswerYes,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  PetHealthChatFeedbackPressed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetHealthChatFeedbackPressedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isAnswerYes':
          result.isAnswerYes = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$PetHealthChatSymptomDefinitionStartedSerializer
    implements StructuredSerializer<PetHealthChatSymptomDefinitionStarted> {
  @override
  final Iterable<Type> types = const [
    PetHealthChatSymptomDefinitionStarted,
    _$PetHealthChatSymptomDefinitionStarted
  ];
  @override
  final String wireName = 'PetHealthChatSymptomDefinitionStarted';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PetHealthChatSymptomDefinitionStarted object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'pet',
      serializers.serialize(object.pet, specifiedType: const FullType(Pet)),
    ];
    if (object.userQuestion != null) {
      result
        ..add('userQuestion')
        ..add(serializers.serialize(object.userQuestion,
            specifiedType: const FullType(String)));
    }
    if (object.nextQuestion != null) {
      result
        ..add('nextQuestion')
        ..add(serializers.serialize(object.nextQuestion,
            specifiedType: const FullType(NextQuestion)));
    }
    if (object.user != null) {
      result
        ..add('user')
        ..add(serializers.serialize(object.user,
            specifiedType: const FullType(User)));
    }
    if (object.isMainSymptom != null) {
      result
        ..add('isMainSymptom')
        ..add(serializers.serialize(object.isMainSymptom,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  PetHealthChatSymptomDefinitionStarted deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetHealthChatSymptomDefinitionStartedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'pet':
          result.pet = serializers.deserialize(value,
              specifiedType: const FullType(Pet)) as Pet;
          break;
        case 'userQuestion':
          result.userQuestion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'nextQuestion':
          result.nextQuestion = serializers.deserialize(value,
              specifiedType: const FullType(NextQuestion)) as NextQuestion;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(User)) as User;
          break;
        case 'isMainSymptom':
          result.isMainSymptom = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$PetHealthChatSymptomNameSentSerializer
    implements StructuredSerializer<PetHealthChatSymptomNameSent> {
  @override
  final Iterable<Type> types = const [
    PetHealthChatSymptomNameSent,
    _$PetHealthChatSymptomNameSent
  ];
  @override
  final String wireName = 'PetHealthChatSymptomNameSent';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PetHealthChatSymptomNameSent object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'symptom',
      serializers.serialize(object.symptom,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PetHealthChatSymptomNameSent deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetHealthChatSymptomNameSentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'symptom':
          result.symptom = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PetHealthChatConfirmSymptomPressedSerializer
    implements StructuredSerializer<PetHealthChatConfirmSymptomPressed> {
  @override
  final Iterable<Type> types = const [
    PetHealthChatConfirmSymptomPressed,
    _$PetHealthChatConfirmSymptomPressed
  ];
  @override
  final String wireName = 'PetHealthChatConfirmSymptomPressed';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PetHealthChatConfirmSymptomPressed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'symptomFoundViewModel',
      serializers.serialize(object.symptomFoundViewModel,
          specifiedType: const FullType(
              OptionViewModel, const [const FullType(SymptomFound)])),
    ];

    return result;
  }

  @override
  PetHealthChatConfirmSymptomPressed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetHealthChatConfirmSymptomPressedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'symptomFoundViewModel':
          result.symptomFoundViewModel.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      OptionViewModel, const [const FullType(SymptomFound)]))
              as OptionViewModel<SymptomFound>);
          break;
      }
    }

    return result.build();
  }
}

class _$PetHealthChatSetSymptomDurationCyclePressedSerializer
    implements
        StructuredSerializer<PetHealthChatSetSymptomDurationCyclePressed> {
  @override
  final Iterable<Type> types = const [
    PetHealthChatSetSymptomDurationCyclePressed,
    _$PetHealthChatSetSymptomDurationCyclePressed
  ];
  @override
  final String wireName = 'PetHealthChatSetSymptomDurationCyclePressed';

  @override
  Iterable<Object> serialize(Serializers serializers,
      PetHealthChatSetSymptomDurationCyclePressed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'optionDuration',
      serializers.serialize(object.optionDuration,
          specifiedType: const FullType(SymptomDurationCycle)),
    ];

    return result;
  }

  @override
  PetHealthChatSetSymptomDurationCyclePressed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetHealthChatSetSymptomDurationCyclePressedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'optionDuration':
          result.optionDuration = serializers.deserialize(value,
                  specifiedType: const FullType(SymptomDurationCycle))
              as SymptomDurationCycle;
          break;
      }
    }

    return result.build();
  }
}

class _$PetHealthChatSetSymptomFrequencyCyclePressedSerializer
    implements
        StructuredSerializer<PetHealthChatSetSymptomFrequencyCyclePressed> {
  @override
  final Iterable<Type> types = const [
    PetHealthChatSetSymptomFrequencyCyclePressed,
    _$PetHealthChatSetSymptomFrequencyCyclePressed
  ];
  @override
  final String wireName = 'PetHealthChatSetSymptomFrequencyCyclePressed';

  @override
  Iterable<Object> serialize(Serializers serializers,
      PetHealthChatSetSymptomFrequencyCyclePressed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'optionFrequency',
      serializers.serialize(object.optionFrequency,
          specifiedType: const FullType(SymptomFrequencyCycle)),
    ];

    return result;
  }

  @override
  PetHealthChatSetSymptomFrequencyCyclePressed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetHealthChatSetSymptomFrequencyCyclePressedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'optionFrequency':
          result.optionFrequency = serializers.deserialize(value,
                  specifiedType: const FullType(SymptomFrequencyCycle))
              as SymptomFrequencyCycle;
          break;
      }
    }

    return result.build();
  }
}

class _$PetHealthChatSymptomPresencePressedSerializer
    implements StructuredSerializer<PetHealthChatSymptomPresencePressed> {
  @override
  final Iterable<Type> types = const [
    PetHealthChatSymptomPresencePressed,
    _$PetHealthChatSymptomPresencePressed
  ];
  @override
  final String wireName = 'PetHealthChatSymptomPresencePressed';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PetHealthChatSymptomPresencePressed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.presence != null) {
      result
        ..add('presence')
        ..add(serializers.serialize(object.presence,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  PetHealthChatSymptomPresencePressed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetHealthChatSymptomPresencePressedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'presence':
          result.presence = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$PetHealthChatSkipSymptomPressedSerializer
    implements StructuredSerializer<PetHealthChatSkipSymptomPressed> {
  @override
  final Iterable<Type> types = const [
    PetHealthChatSkipSymptomPressed,
    _$PetHealthChatSkipSymptomPressed
  ];
  @override
  final String wireName = 'PetHealthChatSkipSymptomPressed';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PetHealthChatSkipSymptomPressed object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  PetHealthChatSkipSymptomPressed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new PetHealthChatSkipSymptomPressedBuilder().build();
  }
}

class _$PetHealthChatSubStateUpdated extends PetHealthChatSubStateUpdated {
  @override
  final PetHealthChatState petHealthChatState;

  factory _$PetHealthChatSubStateUpdated(
          [void Function(PetHealthChatSubStateUpdatedBuilder) updates]) =>
      (new PetHealthChatSubStateUpdatedBuilder()..update(updates)).build();

  _$PetHealthChatSubStateUpdated._({this.petHealthChatState}) : super._() {
    if (petHealthChatState == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatSubStateUpdated', 'petHealthChatState');
    }
  }

  @override
  PetHealthChatSubStateUpdated rebuild(
          void Function(PetHealthChatSubStateUpdatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetHealthChatSubStateUpdatedBuilder toBuilder() =>
      new PetHealthChatSubStateUpdatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetHealthChatSubStateUpdated &&
        petHealthChatState == other.petHealthChatState;
  }

  @override
  int get hashCode {
    return $jf($jc(0, petHealthChatState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetHealthChatSubStateUpdated')
          ..add('petHealthChatState', petHealthChatState))
        .toString();
  }
}

class PetHealthChatSubStateUpdatedBuilder
    implements
        Builder<PetHealthChatSubStateUpdated,
            PetHealthChatSubStateUpdatedBuilder> {
  _$PetHealthChatSubStateUpdated _$v;

  PetHealthChatState _petHealthChatState;
  PetHealthChatState get petHealthChatState => _$this._petHealthChatState;
  set petHealthChatState(PetHealthChatState petHealthChatState) =>
      _$this._petHealthChatState = petHealthChatState;

  PetHealthChatSubStateUpdatedBuilder();

  PetHealthChatSubStateUpdatedBuilder get _$this {
    if (_$v != null) {
      _petHealthChatState = _$v.petHealthChatState;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetHealthChatSubStateUpdated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetHealthChatSubStateUpdated;
  }

  @override
  void update(void Function(PetHealthChatSubStateUpdatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetHealthChatSubStateUpdated build() {
    final _$result = _$v ??
        new _$PetHealthChatSubStateUpdated._(
            petHealthChatState: petHealthChatState);
    replace(_$result);
    return _$result;
  }
}

class _$PetHealthChatViewModelAdded extends PetHealthChatViewModelAdded {
  @override
  final ChatViewModel viewModel;

  factory _$PetHealthChatViewModelAdded(
          [void Function(PetHealthChatViewModelAddedBuilder) updates]) =>
      (new PetHealthChatViewModelAddedBuilder()..update(updates)).build();

  _$PetHealthChatViewModelAdded._({this.viewModel}) : super._();

  @override
  PetHealthChatViewModelAdded rebuild(
          void Function(PetHealthChatViewModelAddedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetHealthChatViewModelAddedBuilder toBuilder() =>
      new PetHealthChatViewModelAddedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetHealthChatViewModelAdded && viewModel == other.viewModel;
  }

  @override
  int get hashCode {
    return $jf($jc(0, viewModel.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetHealthChatViewModelAdded')
          ..add('viewModel', viewModel))
        .toString();
  }
}

class PetHealthChatViewModelAddedBuilder
    implements
        Builder<PetHealthChatViewModelAdded,
            PetHealthChatViewModelAddedBuilder> {
  _$PetHealthChatViewModelAdded _$v;

  ChatViewModel _viewModel;
  ChatViewModel get viewModel => _$this._viewModel;
  set viewModel(ChatViewModel viewModel) => _$this._viewModel = viewModel;

  PetHealthChatViewModelAddedBuilder();

  PetHealthChatViewModelAddedBuilder get _$this {
    if (_$v != null) {
      _viewModel = _$v.viewModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetHealthChatViewModelAdded other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetHealthChatViewModelAdded;
  }

  @override
  void update(void Function(PetHealthChatViewModelAddedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetHealthChatViewModelAdded build() {
    final _$result =
        _$v ?? new _$PetHealthChatViewModelAdded._(viewModel: viewModel);
    replace(_$result);
    return _$result;
  }
}

class _$PetHealthChatInitLaunched extends PetHealthChatInitLaunched {
  @override
  final Pet pet;
  @override
  final User user;
  @override
  final String question;
  @override
  final PetHealthChatType type;

  factory _$PetHealthChatInitLaunched(
          [void Function(PetHealthChatInitLaunchedBuilder) updates]) =>
      (new PetHealthChatInitLaunchedBuilder()..update(updates)).build();

  _$PetHealthChatInitLaunched._({this.pet, this.user, this.question, this.type})
      : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('PetHealthChatInitLaunched', 'user');
    }
    if (question == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatInitLaunched', 'question');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('PetHealthChatInitLaunched', 'type');
    }
  }

  @override
  PetHealthChatInitLaunched rebuild(
          void Function(PetHealthChatInitLaunchedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetHealthChatInitLaunchedBuilder toBuilder() =>
      new PetHealthChatInitLaunchedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetHealthChatInitLaunched &&
        pet == other.pet &&
        user == other.user &&
        question == other.question &&
        type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, pet.hashCode), user.hashCode), question.hashCode),
        type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetHealthChatInitLaunched')
          ..add('pet', pet)
          ..add('user', user)
          ..add('question', question)
          ..add('type', type))
        .toString();
  }
}

class PetHealthChatInitLaunchedBuilder
    implements
        Builder<PetHealthChatInitLaunched, PetHealthChatInitLaunchedBuilder> {
  _$PetHealthChatInitLaunched _$v;

  Pet _pet;
  Pet get pet => _$this._pet;
  set pet(Pet pet) => _$this._pet = pet;

  User _user;
  User get user => _$this._user;
  set user(User user) => _$this._user = user;

  String _question;
  String get question => _$this._question;
  set question(String question) => _$this._question = question;

  PetHealthChatType _type;
  PetHealthChatType get type => _$this._type;
  set type(PetHealthChatType type) => _$this._type = type;

  PetHealthChatInitLaunchedBuilder() {
    PetHealthChatInitLaunched._initializeBuilder(this);
  }

  PetHealthChatInitLaunchedBuilder get _$this {
    if (_$v != null) {
      _pet = _$v.pet;
      _user = _$v.user;
      _question = _$v.question;
      _type = _$v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetHealthChatInitLaunched other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetHealthChatInitLaunched;
  }

  @override
  void update(void Function(PetHealthChatInitLaunchedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetHealthChatInitLaunched build() {
    final _$result = _$v ??
        new _$PetHealthChatInitLaunched._(
            pet: pet, user: user, question: question, type: type);
    replace(_$result);
    return _$result;
  }
}

class _$PetHealthChatFeedbackPressed extends PetHealthChatFeedbackPressed {
  @override
  final bool isAnswerYes;

  factory _$PetHealthChatFeedbackPressed(
          [void Function(PetHealthChatFeedbackPressedBuilder) updates]) =>
      (new PetHealthChatFeedbackPressedBuilder()..update(updates)).build();

  _$PetHealthChatFeedbackPressed._({this.isAnswerYes}) : super._() {
    if (isAnswerYes == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatFeedbackPressed', 'isAnswerYes');
    }
  }

  @override
  PetHealthChatFeedbackPressed rebuild(
          void Function(PetHealthChatFeedbackPressedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetHealthChatFeedbackPressedBuilder toBuilder() =>
      new PetHealthChatFeedbackPressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetHealthChatFeedbackPressed &&
        isAnswerYes == other.isAnswerYes;
  }

  @override
  int get hashCode {
    return $jf($jc(0, isAnswerYes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetHealthChatFeedbackPressed')
          ..add('isAnswerYes', isAnswerYes))
        .toString();
  }
}

class PetHealthChatFeedbackPressedBuilder
    implements
        Builder<PetHealthChatFeedbackPressed,
            PetHealthChatFeedbackPressedBuilder> {
  _$PetHealthChatFeedbackPressed _$v;

  bool _isAnswerYes;
  bool get isAnswerYes => _$this._isAnswerYes;
  set isAnswerYes(bool isAnswerYes) => _$this._isAnswerYes = isAnswerYes;

  PetHealthChatFeedbackPressedBuilder();

  PetHealthChatFeedbackPressedBuilder get _$this {
    if (_$v != null) {
      _isAnswerYes = _$v.isAnswerYes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetHealthChatFeedbackPressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetHealthChatFeedbackPressed;
  }

  @override
  void update(void Function(PetHealthChatFeedbackPressedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetHealthChatFeedbackPressed build() {
    final _$result =
        _$v ?? new _$PetHealthChatFeedbackPressed._(isAnswerYes: isAnswerYes);
    replace(_$result);
    return _$result;
  }
}

class _$PetHealthChatSymptomDefinitionStarted
    extends PetHealthChatSymptomDefinitionStarted {
  @override
  final Pet pet;
  @override
  final String userQuestion;
  @override
  final NextQuestion nextQuestion;
  @override
  final User user;
  @override
  final bool isMainSymptom;

  factory _$PetHealthChatSymptomDefinitionStarted(
          [void Function(PetHealthChatSymptomDefinitionStartedBuilder)
              updates]) =>
      (new PetHealthChatSymptomDefinitionStartedBuilder()..update(updates))
          .build();

  _$PetHealthChatSymptomDefinitionStarted._(
      {this.pet,
      this.userQuestion,
      this.nextQuestion,
      this.user,
      this.isMainSymptom})
      : super._() {
    if (pet == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatSymptomDefinitionStarted', 'pet');
    }
  }

  @override
  PetHealthChatSymptomDefinitionStarted rebuild(
          void Function(PetHealthChatSymptomDefinitionStartedBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetHealthChatSymptomDefinitionStartedBuilder toBuilder() =>
      new PetHealthChatSymptomDefinitionStartedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetHealthChatSymptomDefinitionStarted &&
        pet == other.pet &&
        userQuestion == other.userQuestion &&
        nextQuestion == other.nextQuestion &&
        user == other.user &&
        isMainSymptom == other.isMainSymptom;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, pet.hashCode), userQuestion.hashCode),
                nextQuestion.hashCode),
            user.hashCode),
        isMainSymptom.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetHealthChatSymptomDefinitionStarted')
          ..add('pet', pet)
          ..add('userQuestion', userQuestion)
          ..add('nextQuestion', nextQuestion)
          ..add('user', user)
          ..add('isMainSymptom', isMainSymptom))
        .toString();
  }
}

class PetHealthChatSymptomDefinitionStartedBuilder
    implements
        Builder<PetHealthChatSymptomDefinitionStarted,
            PetHealthChatSymptomDefinitionStartedBuilder> {
  _$PetHealthChatSymptomDefinitionStarted _$v;

  Pet _pet;
  Pet get pet => _$this._pet;
  set pet(Pet pet) => _$this._pet = pet;

  String _userQuestion;
  String get userQuestion => _$this._userQuestion;
  set userQuestion(String userQuestion) => _$this._userQuestion = userQuestion;

  NextQuestion _nextQuestion;
  NextQuestion get nextQuestion => _$this._nextQuestion;
  set nextQuestion(NextQuestion nextQuestion) =>
      _$this._nextQuestion = nextQuestion;

  User _user;
  User get user => _$this._user;
  set user(User user) => _$this._user = user;

  bool _isMainSymptom;
  bool get isMainSymptom => _$this._isMainSymptom;
  set isMainSymptom(bool isMainSymptom) =>
      _$this._isMainSymptom = isMainSymptom;

  PetHealthChatSymptomDefinitionStartedBuilder();

  PetHealthChatSymptomDefinitionStartedBuilder get _$this {
    if (_$v != null) {
      _pet = _$v.pet;
      _userQuestion = _$v.userQuestion;
      _nextQuestion = _$v.nextQuestion;
      _user = _$v.user;
      _isMainSymptom = _$v.isMainSymptom;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetHealthChatSymptomDefinitionStarted other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetHealthChatSymptomDefinitionStarted;
  }

  @override
  void update(
      void Function(PetHealthChatSymptomDefinitionStartedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetHealthChatSymptomDefinitionStarted build() {
    final _$result = _$v ??
        new _$PetHealthChatSymptomDefinitionStarted._(
            pet: pet,
            userQuestion: userQuestion,
            nextQuestion: nextQuestion,
            user: user,
            isMainSymptom: isMainSymptom);
    replace(_$result);
    return _$result;
  }
}

class _$PetHealthChatSymptomNameSent extends PetHealthChatSymptomNameSent {
  @override
  final String symptom;

  factory _$PetHealthChatSymptomNameSent(
          [void Function(PetHealthChatSymptomNameSentBuilder) updates]) =>
      (new PetHealthChatSymptomNameSentBuilder()..update(updates)).build();

  _$PetHealthChatSymptomNameSent._({this.symptom}) : super._() {
    if (symptom == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatSymptomNameSent', 'symptom');
    }
  }

  @override
  PetHealthChatSymptomNameSent rebuild(
          void Function(PetHealthChatSymptomNameSentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetHealthChatSymptomNameSentBuilder toBuilder() =>
      new PetHealthChatSymptomNameSentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetHealthChatSymptomNameSent && symptom == other.symptom;
  }

  @override
  int get hashCode {
    return $jf($jc(0, symptom.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetHealthChatSymptomNameSent')
          ..add('symptom', symptom))
        .toString();
  }
}

class PetHealthChatSymptomNameSentBuilder
    implements
        Builder<PetHealthChatSymptomNameSent,
            PetHealthChatSymptomNameSentBuilder> {
  _$PetHealthChatSymptomNameSent _$v;

  String _symptom;
  String get symptom => _$this._symptom;
  set symptom(String symptom) => _$this._symptom = symptom;

  PetHealthChatSymptomNameSentBuilder();

  PetHealthChatSymptomNameSentBuilder get _$this {
    if (_$v != null) {
      _symptom = _$v.symptom;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetHealthChatSymptomNameSent other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetHealthChatSymptomNameSent;
  }

  @override
  void update(void Function(PetHealthChatSymptomNameSentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetHealthChatSymptomNameSent build() {
    final _$result =
        _$v ?? new _$PetHealthChatSymptomNameSent._(symptom: symptom);
    replace(_$result);
    return _$result;
  }
}

class _$PetHealthChatConfirmSymptomPressed
    extends PetHealthChatConfirmSymptomPressed {
  @override
  final OptionViewModel<SymptomFound> symptomFoundViewModel;

  factory _$PetHealthChatConfirmSymptomPressed(
          [void Function(PetHealthChatConfirmSymptomPressedBuilder) updates]) =>
      (new PetHealthChatConfirmSymptomPressedBuilder()..update(updates))
          .build();

  _$PetHealthChatConfirmSymptomPressed._({this.symptomFoundViewModel})
      : super._() {
    if (symptomFoundViewModel == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatConfirmSymptomPressed', 'symptomFoundViewModel');
    }
  }

  @override
  PetHealthChatConfirmSymptomPressed rebuild(
          void Function(PetHealthChatConfirmSymptomPressedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetHealthChatConfirmSymptomPressedBuilder toBuilder() =>
      new PetHealthChatConfirmSymptomPressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetHealthChatConfirmSymptomPressed &&
        symptomFoundViewModel == other.symptomFoundViewModel;
  }

  @override
  int get hashCode {
    return $jf($jc(0, symptomFoundViewModel.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetHealthChatConfirmSymptomPressed')
          ..add('symptomFoundViewModel', symptomFoundViewModel))
        .toString();
  }
}

class PetHealthChatConfirmSymptomPressedBuilder
    implements
        Builder<PetHealthChatConfirmSymptomPressed,
            PetHealthChatConfirmSymptomPressedBuilder> {
  _$PetHealthChatConfirmSymptomPressed _$v;

  OptionViewModelBuilder<SymptomFound> _symptomFoundViewModel;
  OptionViewModelBuilder<SymptomFound> get symptomFoundViewModel =>
      _$this._symptomFoundViewModel ??=
          new OptionViewModelBuilder<SymptomFound>();
  set symptomFoundViewModel(
          OptionViewModelBuilder<SymptomFound> symptomFoundViewModel) =>
      _$this._symptomFoundViewModel = symptomFoundViewModel;

  PetHealthChatConfirmSymptomPressedBuilder();

  PetHealthChatConfirmSymptomPressedBuilder get _$this {
    if (_$v != null) {
      _symptomFoundViewModel = _$v.symptomFoundViewModel?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetHealthChatConfirmSymptomPressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetHealthChatConfirmSymptomPressed;
  }

  @override
  void update(
      void Function(PetHealthChatConfirmSymptomPressedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetHealthChatConfirmSymptomPressed build() {
    _$PetHealthChatConfirmSymptomPressed _$result;
    try {
      _$result = _$v ??
          new _$PetHealthChatConfirmSymptomPressed._(
              symptomFoundViewModel: symptomFoundViewModel.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'symptomFoundViewModel';
        symptomFoundViewModel.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PetHealthChatConfirmSymptomPressed', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PetHealthChatSetSymptomDurationCyclePressed
    extends PetHealthChatSetSymptomDurationCyclePressed {
  @override
  final SymptomDurationCycle optionDuration;

  factory _$PetHealthChatSetSymptomDurationCyclePressed(
          [void Function(PetHealthChatSetSymptomDurationCyclePressedBuilder)
              updates]) =>
      (new PetHealthChatSetSymptomDurationCyclePressedBuilder()
            ..update(updates))
          .build();

  _$PetHealthChatSetSymptomDurationCyclePressed._({this.optionDuration})
      : super._() {
    if (optionDuration == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatSetSymptomDurationCyclePressed', 'optionDuration');
    }
  }

  @override
  PetHealthChatSetSymptomDurationCyclePressed rebuild(
          void Function(PetHealthChatSetSymptomDurationCyclePressedBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetHealthChatSetSymptomDurationCyclePressedBuilder toBuilder() =>
      new PetHealthChatSetSymptomDurationCyclePressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetHealthChatSetSymptomDurationCyclePressed &&
        optionDuration == other.optionDuration;
  }

  @override
  int get hashCode {
    return $jf($jc(0, optionDuration.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'PetHealthChatSetSymptomDurationCyclePressed')
          ..add('optionDuration', optionDuration))
        .toString();
  }
}

class PetHealthChatSetSymptomDurationCyclePressedBuilder
    implements
        Builder<PetHealthChatSetSymptomDurationCyclePressed,
            PetHealthChatSetSymptomDurationCyclePressedBuilder> {
  _$PetHealthChatSetSymptomDurationCyclePressed _$v;

  SymptomDurationCycle _optionDuration;
  SymptomDurationCycle get optionDuration => _$this._optionDuration;
  set optionDuration(SymptomDurationCycle optionDuration) =>
      _$this._optionDuration = optionDuration;

  PetHealthChatSetSymptomDurationCyclePressedBuilder();

  PetHealthChatSetSymptomDurationCyclePressedBuilder get _$this {
    if (_$v != null) {
      _optionDuration = _$v.optionDuration;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetHealthChatSetSymptomDurationCyclePressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetHealthChatSetSymptomDurationCyclePressed;
  }

  @override
  void update(
      void Function(PetHealthChatSetSymptomDurationCyclePressedBuilder)
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetHealthChatSetSymptomDurationCyclePressed build() {
    final _$result = _$v ??
        new _$PetHealthChatSetSymptomDurationCyclePressed._(
            optionDuration: optionDuration);
    replace(_$result);
    return _$result;
  }
}

class _$PetHealthChatSetSymptomFrequencyCyclePressed
    extends PetHealthChatSetSymptomFrequencyCyclePressed {
  @override
  final SymptomFrequencyCycle optionFrequency;

  factory _$PetHealthChatSetSymptomFrequencyCyclePressed(
          [void Function(PetHealthChatSetSymptomFrequencyCyclePressedBuilder)
              updates]) =>
      (new PetHealthChatSetSymptomFrequencyCyclePressedBuilder()
            ..update(updates))
          .build();

  _$PetHealthChatSetSymptomFrequencyCyclePressed._({this.optionFrequency})
      : super._() {
    if (optionFrequency == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatSetSymptomFrequencyCyclePressed', 'optionFrequency');
    }
  }

  @override
  PetHealthChatSetSymptomFrequencyCyclePressed rebuild(
          void Function(PetHealthChatSetSymptomFrequencyCyclePressedBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetHealthChatSetSymptomFrequencyCyclePressedBuilder toBuilder() =>
      new PetHealthChatSetSymptomFrequencyCyclePressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetHealthChatSetSymptomFrequencyCyclePressed &&
        optionFrequency == other.optionFrequency;
  }

  @override
  int get hashCode {
    return $jf($jc(0, optionFrequency.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'PetHealthChatSetSymptomFrequencyCyclePressed')
          ..add('optionFrequency', optionFrequency))
        .toString();
  }
}

class PetHealthChatSetSymptomFrequencyCyclePressedBuilder
    implements
        Builder<PetHealthChatSetSymptomFrequencyCyclePressed,
            PetHealthChatSetSymptomFrequencyCyclePressedBuilder> {
  _$PetHealthChatSetSymptomFrequencyCyclePressed _$v;

  SymptomFrequencyCycle _optionFrequency;
  SymptomFrequencyCycle get optionFrequency => _$this._optionFrequency;
  set optionFrequency(SymptomFrequencyCycle optionFrequency) =>
      _$this._optionFrequency = optionFrequency;

  PetHealthChatSetSymptomFrequencyCyclePressedBuilder();

  PetHealthChatSetSymptomFrequencyCyclePressedBuilder get _$this {
    if (_$v != null) {
      _optionFrequency = _$v.optionFrequency;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetHealthChatSetSymptomFrequencyCyclePressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetHealthChatSetSymptomFrequencyCyclePressed;
  }

  @override
  void update(
      void Function(PetHealthChatSetSymptomFrequencyCyclePressedBuilder)
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetHealthChatSetSymptomFrequencyCyclePressed build() {
    final _$result = _$v ??
        new _$PetHealthChatSetSymptomFrequencyCyclePressed._(
            optionFrequency: optionFrequency);
    replace(_$result);
    return _$result;
  }
}

class _$PetHealthChatSymptomPresencePressed
    extends PetHealthChatSymptomPresencePressed {
  @override
  final bool presence;

  factory _$PetHealthChatSymptomPresencePressed(
          [void Function(PetHealthChatSymptomPresencePressedBuilder)
              updates]) =>
      (new PetHealthChatSymptomPresencePressedBuilder()..update(updates))
          .build();

  _$PetHealthChatSymptomPresencePressed._({this.presence}) : super._();

  @override
  PetHealthChatSymptomPresencePressed rebuild(
          void Function(PetHealthChatSymptomPresencePressedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetHealthChatSymptomPresencePressedBuilder toBuilder() =>
      new PetHealthChatSymptomPresencePressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetHealthChatSymptomPresencePressed &&
        presence == other.presence;
  }

  @override
  int get hashCode {
    return $jf($jc(0, presence.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetHealthChatSymptomPresencePressed')
          ..add('presence', presence))
        .toString();
  }
}

class PetHealthChatSymptomPresencePressedBuilder
    implements
        Builder<PetHealthChatSymptomPresencePressed,
            PetHealthChatSymptomPresencePressedBuilder> {
  _$PetHealthChatSymptomPresencePressed _$v;

  bool _presence;
  bool get presence => _$this._presence;
  set presence(bool presence) => _$this._presence = presence;

  PetHealthChatSymptomPresencePressedBuilder();

  PetHealthChatSymptomPresencePressedBuilder get _$this {
    if (_$v != null) {
      _presence = _$v.presence;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetHealthChatSymptomPresencePressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetHealthChatSymptomPresencePressed;
  }

  @override
  void update(
      void Function(PetHealthChatSymptomPresencePressedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetHealthChatSymptomPresencePressed build() {
    final _$result =
        _$v ?? new _$PetHealthChatSymptomPresencePressed._(presence: presence);
    replace(_$result);
    return _$result;
  }
}

class _$PetHealthChatSkipSymptomPressed
    extends PetHealthChatSkipSymptomPressed {
  factory _$PetHealthChatSkipSymptomPressed(
          [void Function(PetHealthChatSkipSymptomPressedBuilder) updates]) =>
      (new PetHealthChatSkipSymptomPressedBuilder()..update(updates)).build();

  _$PetHealthChatSkipSymptomPressed._() : super._();

  @override
  PetHealthChatSkipSymptomPressed rebuild(
          void Function(PetHealthChatSkipSymptomPressedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetHealthChatSkipSymptomPressedBuilder toBuilder() =>
      new PetHealthChatSkipSymptomPressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetHealthChatSkipSymptomPressed;
  }

  @override
  int get hashCode {
    return 870930242;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('PetHealthChatSkipSymptomPressed')
        .toString();
  }
}

class PetHealthChatSkipSymptomPressedBuilder
    implements
        Builder<PetHealthChatSkipSymptomPressed,
            PetHealthChatSkipSymptomPressedBuilder> {
  _$PetHealthChatSkipSymptomPressed _$v;

  PetHealthChatSkipSymptomPressedBuilder();

  @override
  void replace(PetHealthChatSkipSymptomPressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetHealthChatSkipSymptomPressed;
  }

  @override
  void update(void Function(PetHealthChatSkipSymptomPressedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetHealthChatSkipSymptomPressed build() {
    final _$result = _$v ?? new _$PetHealthChatSkipSymptomPressed._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
