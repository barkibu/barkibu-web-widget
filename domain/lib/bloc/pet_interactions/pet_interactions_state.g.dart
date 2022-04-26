// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_interactions_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PetInteractionsLoadInProgress>
    _$petInteractionsLoadInProgressSerializer =
    new _$PetInteractionsLoadInProgressSerializer();
Serializer<PetInteractionsLoadSuccess> _$petInteractionsLoadSuccessSerializer =
    new _$PetInteractionsLoadSuccessSerializer();

class _$PetInteractionsLoadInProgressSerializer
    implements StructuredSerializer<PetInteractionsLoadInProgress> {
  @override
  final Iterable<Type> types = const [
    PetInteractionsLoadInProgress,
    _$PetInteractionsLoadInProgress
  ];
  @override
  final String wireName = 'PetInteractionsLoadInProgress';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PetInteractionsLoadInProgress object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'interactions',
      serializers.serialize(object.interactions,
          specifiedType:
              const FullType(List, const [const FullType(Interaction)])),
    ];
    if (object.petId != null) {
      result
        ..add('petId')
        ..add(serializers.serialize(object.petId,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  PetInteractionsLoadInProgress deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetInteractionsLoadInProgressBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'interactions':
          result.interactions = serializers.deserialize(value,
                  specifiedType:
                      const FullType(List, const [const FullType(Interaction)]))
              as List<Interaction>;
          break;
        case 'petId':
          result.petId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$PetInteractionsLoadSuccessSerializer
    implements StructuredSerializer<PetInteractionsLoadSuccess> {
  @override
  final Iterable<Type> types = const [
    PetInteractionsLoadSuccess,
    _$PetInteractionsLoadSuccess
  ];
  @override
  final String wireName = 'PetInteractionsLoadSuccess';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PetInteractionsLoadSuccess object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'interactions',
      serializers.serialize(object.interactions,
          specifiedType:
              const FullType(List, const [const FullType(Interaction)])),
    ];
    if (object.petId != null) {
      result
        ..add('petId')
        ..add(serializers.serialize(object.petId,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  PetInteractionsLoadSuccess deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetInteractionsLoadSuccessBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'interactions':
          result.interactions = serializers.deserialize(value,
                  specifiedType:
                      const FullType(List, const [const FullType(Interaction)]))
              as List<Interaction>;
          break;
        case 'petId':
          result.petId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$PetInteractionsLoadInProgress extends PetInteractionsLoadInProgress {
  @override
  final List<Interaction> interactions;
  @override
  final int petId;

  factory _$PetInteractionsLoadInProgress(
          [void Function(PetInteractionsLoadInProgressBuilder) updates]) =>
      (new PetInteractionsLoadInProgressBuilder()..update(updates)).build();

  _$PetInteractionsLoadInProgress._({this.interactions, this.petId})
      : super._() {
    if (interactions == null) {
      throw new BuiltValueNullFieldError(
          'PetInteractionsLoadInProgress', 'interactions');
    }
  }

  @override
  PetInteractionsLoadInProgress rebuild(
          void Function(PetInteractionsLoadInProgressBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetInteractionsLoadInProgressBuilder toBuilder() =>
      new PetInteractionsLoadInProgressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetInteractionsLoadInProgress &&
        interactions == other.interactions &&
        petId == other.petId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, interactions.hashCode), petId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetInteractionsLoadInProgress')
          ..add('interactions', interactions)
          ..add('petId', petId))
        .toString();
  }
}

class PetInteractionsLoadInProgressBuilder
    implements
        Builder<PetInteractionsLoadInProgress,
            PetInteractionsLoadInProgressBuilder> {
  _$PetInteractionsLoadInProgress _$v;

  List<Interaction> _interactions;
  List<Interaction> get interactions => _$this._interactions;
  set interactions(List<Interaction> interactions) =>
      _$this._interactions = interactions;

  int _petId;
  int get petId => _$this._petId;
  set petId(int petId) => _$this._petId = petId;

  PetInteractionsLoadInProgressBuilder() {
    PetInteractionsLoadInProgress._initializeBuilder(this);
  }

  PetInteractionsLoadInProgressBuilder get _$this {
    if (_$v != null) {
      _interactions = _$v.interactions;
      _petId = _$v.petId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetInteractionsLoadInProgress other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetInteractionsLoadInProgress;
  }

  @override
  void update(void Function(PetInteractionsLoadInProgressBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetInteractionsLoadInProgress build() {
    final _$result = _$v ??
        new _$PetInteractionsLoadInProgress._(
            interactions: interactions, petId: petId);
    replace(_$result);
    return _$result;
  }
}

class _$PetInteractionsLoadSuccess extends PetInteractionsLoadSuccess {
  @override
  final List<Interaction> interactions;
  @override
  final int petId;

  factory _$PetInteractionsLoadSuccess(
          [void Function(PetInteractionsLoadSuccessBuilder) updates]) =>
      (new PetInteractionsLoadSuccessBuilder()..update(updates)).build();

  _$PetInteractionsLoadSuccess._({this.interactions, this.petId}) : super._() {
    if (interactions == null) {
      throw new BuiltValueNullFieldError(
          'PetInteractionsLoadSuccess', 'interactions');
    }
  }

  @override
  PetInteractionsLoadSuccess rebuild(
          void Function(PetInteractionsLoadSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetInteractionsLoadSuccessBuilder toBuilder() =>
      new PetInteractionsLoadSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetInteractionsLoadSuccess &&
        interactions == other.interactions &&
        petId == other.petId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, interactions.hashCode), petId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetInteractionsLoadSuccess')
          ..add('interactions', interactions)
          ..add('petId', petId))
        .toString();
  }
}

class PetInteractionsLoadSuccessBuilder
    implements
        Builder<PetInteractionsLoadSuccess, PetInteractionsLoadSuccessBuilder> {
  _$PetInteractionsLoadSuccess _$v;

  List<Interaction> _interactions;
  List<Interaction> get interactions => _$this._interactions;
  set interactions(List<Interaction> interactions) =>
      _$this._interactions = interactions;

  int _petId;
  int get petId => _$this._petId;
  set petId(int petId) => _$this._petId = petId;

  PetInteractionsLoadSuccessBuilder();

  PetInteractionsLoadSuccessBuilder get _$this {
    if (_$v != null) {
      _interactions = _$v.interactions;
      _petId = _$v.petId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetInteractionsLoadSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetInteractionsLoadSuccess;
  }

  @override
  void update(void Function(PetInteractionsLoadSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetInteractionsLoadSuccess build() {
    final _$result = _$v ??
        new _$PetInteractionsLoadSuccess._(
            interactions: interactions, petId: petId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
