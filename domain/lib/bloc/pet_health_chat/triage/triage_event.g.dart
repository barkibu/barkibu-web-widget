// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'triage_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TriageInitLaunched> _$triageInitLaunchedSerializer =
    new _$TriageInitLaunchedSerializer();
Serializer<TriageSubStateUpdated> _$triageSubStateUpdatedSerializer =
    new _$TriageSubStateUpdatedSerializer();
Serializer<TriagePetDefinitionEnded> _$triagePetDefinitionEndedSerializer =
    new _$TriagePetDefinitionEndedSerializer();
Serializer<TriageSymptomDefinitionEnded>
    _$triageSymptomDefinitionEndedSerializer =
    new _$TriageSymptomDefinitionEndedSerializer();
Serializer<PetHealthChatAddMoreSymptomsPressed>
    _$petHealthChatAddMoreSymptomsPressedSerializer =
    new _$PetHealthChatAddMoreSymptomsPressedSerializer();

class _$TriageInitLaunchedSerializer
    implements StructuredSerializer<TriageInitLaunched> {
  @override
  final Iterable<Type> types = const [TriageInitLaunched, _$TriageInitLaunched];
  @override
  final String wireName = 'TriageInitLaunched';

  @override
  Iterable<Object> serialize(Serializers serializers, TriageInitLaunched object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'toHandOver',
      serializers.serialize(object.toHandOver,
          specifiedType: const FullType(bool)),
    ];
    if (object.question != null) {
      result
        ..add('question')
        ..add(serializers.serialize(object.question,
            specifiedType: const FullType(String)));
    }
    if (object.pet != null) {
      result
        ..add('pet')
        ..add(serializers.serialize(object.pet,
            specifiedType: const FullType(Pet)));
    }
    if (object.flow != null) {
      result
        ..add('flow')
        ..add(serializers.serialize(object.flow,
            specifiedType: const FullType(TriageFlow)));
    }
    return result;
  }

  @override
  TriageInitLaunched deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TriageInitLaunchedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'question':
          result.question = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pet':
          result.pet = serializers.deserialize(value,
              specifiedType: const FullType(Pet)) as Pet;
          break;
        case 'flow':
          result.flow = serializers.deserialize(value,
              specifiedType: const FullType(TriageFlow)) as TriageFlow;
          break;
        case 'toHandOver':
          result.toHandOver = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$TriageSubStateUpdatedSerializer
    implements StructuredSerializer<TriageSubStateUpdated> {
  @override
  final Iterable<Type> types = const [
    TriageSubStateUpdated,
    _$TriageSubStateUpdated
  ];
  @override
  final String wireName = 'TriageSubStateUpdated';

  @override
  Iterable<Object> serialize(
      Serializers serializers, TriageSubStateUpdated object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'triageState',
      serializers.serialize(object.triageState,
          specifiedType: const FullType(TriageState)),
    ];

    return result;
  }

  @override
  TriageSubStateUpdated deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TriageSubStateUpdatedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'triageState':
          result.triageState = serializers.deserialize(value,
              specifiedType: const FullType(TriageState)) as TriageState;
          break;
      }
    }

    return result.build();
  }
}

class _$TriagePetDefinitionEndedSerializer
    implements StructuredSerializer<TriagePetDefinitionEnded> {
  @override
  final Iterable<Type> types = const [
    TriagePetDefinitionEnded,
    _$TriagePetDefinitionEnded
  ];
  @override
  final String wireName = 'TriagePetDefinitionEnded';

  @override
  Iterable<Object> serialize(
      Serializers serializers, TriagePetDefinitionEnded object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  TriagePetDefinitionEnded deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new TriagePetDefinitionEndedBuilder().build();
  }
}

class _$TriageSymptomDefinitionEndedSerializer
    implements StructuredSerializer<TriageSymptomDefinitionEnded> {
  @override
  final Iterable<Type> types = const [
    TriageSymptomDefinitionEnded,
    _$TriageSymptomDefinitionEnded
  ];
  @override
  final String wireName = 'TriageSymptomDefinitionEnded';

  @override
  Iterable<Object> serialize(
      Serializers serializers, TriageSymptomDefinitionEnded object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'symptom',
      serializers.serialize(object.symptom,
          specifiedType: const FullType(Symptom)),
      'unknownSymptoms',
      serializers.serialize(object.unknownSymptoms,
          specifiedType: const FullType(List, const [const FullType(String)])),
      'skipped',
      serializers.serialize(object.skipped,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  TriageSymptomDefinitionEnded deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TriageSymptomDefinitionEndedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'symptom':
          result.symptom = serializers.deserialize(value,
              specifiedType: const FullType(Symptom)) as Symptom;
          break;
        case 'unknownSymptoms':
          result.unknownSymptoms = serializers.deserialize(value,
                  specifiedType:
                      const FullType(List, const [const FullType(String)]))
              as List<String>;
          break;
        case 'skipped':
          result.skipped = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$PetHealthChatAddMoreSymptomsPressedSerializer
    implements StructuredSerializer<PetHealthChatAddMoreSymptomsPressed> {
  @override
  final Iterable<Type> types = const [
    PetHealthChatAddMoreSymptomsPressed,
    _$PetHealthChatAddMoreSymptomsPressed
  ];
  @override
  final String wireName = 'PetHealthChatAddMoreSymptomsPressed';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PetHealthChatAddMoreSymptomsPressed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'userWantsToAddMoreSymptoms',
      serializers.serialize(object.userWantsToAddMoreSymptoms,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  PetHealthChatAddMoreSymptomsPressed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetHealthChatAddMoreSymptomsPressedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'userWantsToAddMoreSymptoms':
          result.userWantsToAddMoreSymptoms = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$TriageInitLaunched extends TriageInitLaunched {
  @override
  final String question;
  @override
  final Pet pet;
  @override
  final TriageFlow flow;
  @override
  final bool toHandOver;

  factory _$TriageInitLaunched(
          [void Function(TriageInitLaunchedBuilder) updates]) =>
      (new TriageInitLaunchedBuilder()..update(updates)).build();

  _$TriageInitLaunched._({this.question, this.pet, this.flow, this.toHandOver})
      : super._() {
    if (toHandOver == null) {
      throw new BuiltValueNullFieldError('TriageInitLaunched', 'toHandOver');
    }
  }

  @override
  TriageInitLaunched rebuild(
          void Function(TriageInitLaunchedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TriageInitLaunchedBuilder toBuilder() =>
      new TriageInitLaunchedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TriageInitLaunched &&
        question == other.question &&
        pet == other.pet &&
        flow == other.flow &&
        toHandOver == other.toHandOver;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, question.hashCode), pet.hashCode), flow.hashCode),
        toHandOver.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TriageInitLaunched')
          ..add('question', question)
          ..add('pet', pet)
          ..add('flow', flow)
          ..add('toHandOver', toHandOver))
        .toString();
  }
}

class TriageInitLaunchedBuilder
    implements Builder<TriageInitLaunched, TriageInitLaunchedBuilder> {
  _$TriageInitLaunched _$v;

  String _question;
  String get question => _$this._question;
  set question(String question) => _$this._question = question;

  Pet _pet;
  Pet get pet => _$this._pet;
  set pet(Pet pet) => _$this._pet = pet;

  TriageFlow _flow;
  TriageFlow get flow => _$this._flow;
  set flow(TriageFlow flow) => _$this._flow = flow;

  bool _toHandOver;
  bool get toHandOver => _$this._toHandOver;
  set toHandOver(bool toHandOver) => _$this._toHandOver = toHandOver;

  TriageInitLaunchedBuilder() {
    TriageInitLaunched._initializeBuilder(this);
  }

  TriageInitLaunchedBuilder get _$this {
    if (_$v != null) {
      _question = _$v.question;
      _pet = _$v.pet;
      _flow = _$v.flow;
      _toHandOver = _$v.toHandOver;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TriageInitLaunched other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TriageInitLaunched;
  }

  @override
  void update(void Function(TriageInitLaunchedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TriageInitLaunched build() {
    final _$result = _$v ??
        new _$TriageInitLaunched._(
            question: question, pet: pet, flow: flow, toHandOver: toHandOver);
    replace(_$result);
    return _$result;
  }
}

class _$TriageSubStateUpdated extends TriageSubStateUpdated {
  @override
  final TriageState triageState;

  factory _$TriageSubStateUpdated(
          [void Function(TriageSubStateUpdatedBuilder) updates]) =>
      (new TriageSubStateUpdatedBuilder()..update(updates)).build();

  _$TriageSubStateUpdated._({this.triageState}) : super._() {
    if (triageState == null) {
      throw new BuiltValueNullFieldError(
          'TriageSubStateUpdated', 'triageState');
    }
  }

  @override
  TriageSubStateUpdated rebuild(
          void Function(TriageSubStateUpdatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TriageSubStateUpdatedBuilder toBuilder() =>
      new TriageSubStateUpdatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TriageSubStateUpdated && triageState == other.triageState;
  }

  @override
  int get hashCode {
    return $jf($jc(0, triageState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TriageSubStateUpdated')
          ..add('triageState', triageState))
        .toString();
  }
}

class TriageSubStateUpdatedBuilder
    implements Builder<TriageSubStateUpdated, TriageSubStateUpdatedBuilder> {
  _$TriageSubStateUpdated _$v;

  TriageState _triageState;
  TriageState get triageState => _$this._triageState;
  set triageState(TriageState triageState) => _$this._triageState = triageState;

  TriageSubStateUpdatedBuilder();

  TriageSubStateUpdatedBuilder get _$this {
    if (_$v != null) {
      _triageState = _$v.triageState;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TriageSubStateUpdated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TriageSubStateUpdated;
  }

  @override
  void update(void Function(TriageSubStateUpdatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TriageSubStateUpdated build() {
    final _$result =
        _$v ?? new _$TriageSubStateUpdated._(triageState: triageState);
    replace(_$result);
    return _$result;
  }
}

class _$TriagePetDefinitionEnded extends TriagePetDefinitionEnded {
  factory _$TriagePetDefinitionEnded(
          [void Function(TriagePetDefinitionEndedBuilder) updates]) =>
      (new TriagePetDefinitionEndedBuilder()..update(updates)).build();

  _$TriagePetDefinitionEnded._() : super._();

  @override
  TriagePetDefinitionEnded rebuild(
          void Function(TriagePetDefinitionEndedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TriagePetDefinitionEndedBuilder toBuilder() =>
      new TriagePetDefinitionEndedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TriagePetDefinitionEnded;
  }

  @override
  int get hashCode {
    return 462436323;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('TriagePetDefinitionEnded').toString();
  }
}

class TriagePetDefinitionEndedBuilder
    implements
        Builder<TriagePetDefinitionEnded, TriagePetDefinitionEndedBuilder> {
  _$TriagePetDefinitionEnded _$v;

  TriagePetDefinitionEndedBuilder();

  @override
  void replace(TriagePetDefinitionEnded other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TriagePetDefinitionEnded;
  }

  @override
  void update(void Function(TriagePetDefinitionEndedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TriagePetDefinitionEnded build() {
    final _$result = _$v ?? new _$TriagePetDefinitionEnded._();
    replace(_$result);
    return _$result;
  }
}

class _$TriageSymptomDefinitionEnded extends TriageSymptomDefinitionEnded {
  @override
  final Symptom symptom;
  @override
  final List<String> unknownSymptoms;
  @override
  final bool skipped;

  factory _$TriageSymptomDefinitionEnded(
          [void Function(TriageSymptomDefinitionEndedBuilder) updates]) =>
      (new TriageSymptomDefinitionEndedBuilder()..update(updates)).build();

  _$TriageSymptomDefinitionEnded._(
      {this.symptom, this.unknownSymptoms, this.skipped})
      : super._() {
    if (symptom == null) {
      throw new BuiltValueNullFieldError(
          'TriageSymptomDefinitionEnded', 'symptom');
    }
    if (unknownSymptoms == null) {
      throw new BuiltValueNullFieldError(
          'TriageSymptomDefinitionEnded', 'unknownSymptoms');
    }
    if (skipped == null) {
      throw new BuiltValueNullFieldError(
          'TriageSymptomDefinitionEnded', 'skipped');
    }
  }

  @override
  TriageSymptomDefinitionEnded rebuild(
          void Function(TriageSymptomDefinitionEndedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TriageSymptomDefinitionEndedBuilder toBuilder() =>
      new TriageSymptomDefinitionEndedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TriageSymptomDefinitionEnded &&
        symptom == other.symptom &&
        unknownSymptoms == other.unknownSymptoms &&
        skipped == other.skipped;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, symptom.hashCode), unknownSymptoms.hashCode),
        skipped.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TriageSymptomDefinitionEnded')
          ..add('symptom', symptom)
          ..add('unknownSymptoms', unknownSymptoms)
          ..add('skipped', skipped))
        .toString();
  }
}

class TriageSymptomDefinitionEndedBuilder
    implements
        Builder<TriageSymptomDefinitionEnded,
            TriageSymptomDefinitionEndedBuilder> {
  _$TriageSymptomDefinitionEnded _$v;

  Symptom _symptom;
  Symptom get symptom => _$this._symptom;
  set symptom(Symptom symptom) => _$this._symptom = symptom;

  List<String> _unknownSymptoms;
  List<String> get unknownSymptoms => _$this._unknownSymptoms;
  set unknownSymptoms(List<String> unknownSymptoms) =>
      _$this._unknownSymptoms = unknownSymptoms;

  bool _skipped;
  bool get skipped => _$this._skipped;
  set skipped(bool skipped) => _$this._skipped = skipped;

  TriageSymptomDefinitionEndedBuilder() {
    TriageSymptomDefinitionEnded._initializeBuilder(this);
  }

  TriageSymptomDefinitionEndedBuilder get _$this {
    if (_$v != null) {
      _symptom = _$v.symptom;
      _unknownSymptoms = _$v.unknownSymptoms;
      _skipped = _$v.skipped;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TriageSymptomDefinitionEnded other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TriageSymptomDefinitionEnded;
  }

  @override
  void update(void Function(TriageSymptomDefinitionEndedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TriageSymptomDefinitionEnded build() {
    final _$result = _$v ??
        new _$TriageSymptomDefinitionEnded._(
            symptom: symptom,
            unknownSymptoms: unknownSymptoms,
            skipped: skipped);
    replace(_$result);
    return _$result;
  }
}

class _$PetHealthChatAddMoreSymptomsPressed
    extends PetHealthChatAddMoreSymptomsPressed {
  @override
  final bool userWantsToAddMoreSymptoms;

  factory _$PetHealthChatAddMoreSymptomsPressed(
          [void Function(PetHealthChatAddMoreSymptomsPressedBuilder)
              updates]) =>
      (new PetHealthChatAddMoreSymptomsPressedBuilder()..update(updates))
          .build();

  _$PetHealthChatAddMoreSymptomsPressed._({this.userWantsToAddMoreSymptoms})
      : super._() {
    if (userWantsToAddMoreSymptoms == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatAddMoreSymptomsPressed', 'userWantsToAddMoreSymptoms');
    }
  }

  @override
  PetHealthChatAddMoreSymptomsPressed rebuild(
          void Function(PetHealthChatAddMoreSymptomsPressedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetHealthChatAddMoreSymptomsPressedBuilder toBuilder() =>
      new PetHealthChatAddMoreSymptomsPressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetHealthChatAddMoreSymptomsPressed &&
        userWantsToAddMoreSymptoms == other.userWantsToAddMoreSymptoms;
  }

  @override
  int get hashCode {
    return $jf($jc(0, userWantsToAddMoreSymptoms.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetHealthChatAddMoreSymptomsPressed')
          ..add('userWantsToAddMoreSymptoms', userWantsToAddMoreSymptoms))
        .toString();
  }
}

class PetHealthChatAddMoreSymptomsPressedBuilder
    implements
        Builder<PetHealthChatAddMoreSymptomsPressed,
            PetHealthChatAddMoreSymptomsPressedBuilder> {
  _$PetHealthChatAddMoreSymptomsPressed _$v;

  bool _userWantsToAddMoreSymptoms;
  bool get userWantsToAddMoreSymptoms => _$this._userWantsToAddMoreSymptoms;
  set userWantsToAddMoreSymptoms(bool userWantsToAddMoreSymptoms) =>
      _$this._userWantsToAddMoreSymptoms = userWantsToAddMoreSymptoms;

  PetHealthChatAddMoreSymptomsPressedBuilder();

  PetHealthChatAddMoreSymptomsPressedBuilder get _$this {
    if (_$v != null) {
      _userWantsToAddMoreSymptoms = _$v.userWantsToAddMoreSymptoms;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetHealthChatAddMoreSymptomsPressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetHealthChatAddMoreSymptomsPressed;
  }

  @override
  void update(
      void Function(PetHealthChatAddMoreSymptomsPressedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetHealthChatAddMoreSymptomsPressed build() {
    final _$result = _$v ??
        new _$PetHealthChatAddMoreSymptomsPressed._(
            userWantsToAddMoreSymptoms: userWantsToAddMoreSymptoms);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
