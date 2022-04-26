// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_details_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PetDetailsLoadInProgress> _$petDetailsLoadInProgressSerializer =
    new _$PetDetailsLoadInProgressSerializer();
Serializer<PetDetailsLoadSuccess> _$petDetailsLoadSuccessSerializer =
    new _$PetDetailsLoadSuccessSerializer();

class _$PetDetailsLoadInProgressSerializer
    implements StructuredSerializer<PetDetailsLoadInProgress> {
  @override
  final Iterable<Type> types = const [
    PetDetailsLoadInProgress,
    _$PetDetailsLoadInProgress
  ];
  @override
  final String wireName = 'PetDetailsLoadInProgress';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PetDetailsLoadInProgress object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'petId',
      serializers.serialize(object.petId, specifiedType: const FullType(int)),
      'counters',
      serializers.serialize(object.counters,
          specifiedType:
              const FullType(List, const [const FullType(PetCounter)])),
    ];

    return result;
  }

  @override
  PetDetailsLoadInProgress deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetDetailsLoadInProgressBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'petId':
          result.petId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'counters':
          result.counters = serializers.deserialize(value,
                  specifiedType:
                      const FullType(List, const [const FullType(PetCounter)]))
              as List<PetCounter>;
          break;
      }
    }

    return result.build();
  }
}

class _$PetDetailsLoadSuccessSerializer
    implements StructuredSerializer<PetDetailsLoadSuccess> {
  @override
  final Iterable<Type> types = const [
    PetDetailsLoadSuccess,
    _$PetDetailsLoadSuccess
  ];
  @override
  final String wireName = 'PetDetailsLoadSuccess';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PetDetailsLoadSuccess object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'petId',
      serializers.serialize(object.petId, specifiedType: const FullType(int)),
      'counters',
      serializers.serialize(object.counters,
          specifiedType:
              const FullType(List, const [const FullType(PetCounter)])),
    ];

    return result;
  }

  @override
  PetDetailsLoadSuccess deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetDetailsLoadSuccessBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'petId':
          result.petId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'counters':
          result.counters = serializers.deserialize(value,
                  specifiedType:
                      const FullType(List, const [const FullType(PetCounter)]))
              as List<PetCounter>;
          break;
      }
    }

    return result.build();
  }
}

class _$PetDetailsLoadInProgress extends PetDetailsLoadInProgress {
  @override
  final int petId;
  @override
  final List<PetCounter> counters;

  factory _$PetDetailsLoadInProgress(
          [void Function(PetDetailsLoadInProgressBuilder) updates]) =>
      (new PetDetailsLoadInProgressBuilder()..update(updates)).build();

  _$PetDetailsLoadInProgress._({this.petId, this.counters}) : super._() {
    if (petId == null) {
      throw new BuiltValueNullFieldError('PetDetailsLoadInProgress', 'petId');
    }
    if (counters == null) {
      throw new BuiltValueNullFieldError(
          'PetDetailsLoadInProgress', 'counters');
    }
  }

  @override
  PetDetailsLoadInProgress rebuild(
          void Function(PetDetailsLoadInProgressBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetDetailsLoadInProgressBuilder toBuilder() =>
      new PetDetailsLoadInProgressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetDetailsLoadInProgress &&
        petId == other.petId &&
        counters == other.counters;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, petId.hashCode), counters.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetDetailsLoadInProgress')
          ..add('petId', petId)
          ..add('counters', counters))
        .toString();
  }
}

class PetDetailsLoadInProgressBuilder
    implements
        Builder<PetDetailsLoadInProgress, PetDetailsLoadInProgressBuilder> {
  _$PetDetailsLoadInProgress _$v;

  int _petId;
  int get petId => _$this._petId;
  set petId(int petId) => _$this._petId = petId;

  List<PetCounter> _counters;
  List<PetCounter> get counters => _$this._counters;
  set counters(List<PetCounter> counters) => _$this._counters = counters;

  PetDetailsLoadInProgressBuilder() {
    PetDetailsLoadInProgress._initializeBuilder(this);
  }

  PetDetailsLoadInProgressBuilder get _$this {
    if (_$v != null) {
      _petId = _$v.petId;
      _counters = _$v.counters;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetDetailsLoadInProgress other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetDetailsLoadInProgress;
  }

  @override
  void update(void Function(PetDetailsLoadInProgressBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetDetailsLoadInProgress build() {
    final _$result = _$v ??
        new _$PetDetailsLoadInProgress._(petId: petId, counters: counters);
    replace(_$result);
    return _$result;
  }
}

class _$PetDetailsLoadSuccess extends PetDetailsLoadSuccess {
  @override
  final int petId;
  @override
  final List<PetCounter> counters;

  factory _$PetDetailsLoadSuccess(
          [void Function(PetDetailsLoadSuccessBuilder) updates]) =>
      (new PetDetailsLoadSuccessBuilder()..update(updates)).build();

  _$PetDetailsLoadSuccess._({this.petId, this.counters}) : super._() {
    if (petId == null) {
      throw new BuiltValueNullFieldError('PetDetailsLoadSuccess', 'petId');
    }
    if (counters == null) {
      throw new BuiltValueNullFieldError('PetDetailsLoadSuccess', 'counters');
    }
  }

  @override
  PetDetailsLoadSuccess rebuild(
          void Function(PetDetailsLoadSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetDetailsLoadSuccessBuilder toBuilder() =>
      new PetDetailsLoadSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetDetailsLoadSuccess &&
        petId == other.petId &&
        counters == other.counters;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, petId.hashCode), counters.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetDetailsLoadSuccess')
          ..add('petId', petId)
          ..add('counters', counters))
        .toString();
  }
}

class PetDetailsLoadSuccessBuilder
    implements Builder<PetDetailsLoadSuccess, PetDetailsLoadSuccessBuilder> {
  _$PetDetailsLoadSuccess _$v;

  int _petId;
  int get petId => _$this._petId;
  set petId(int petId) => _$this._petId = petId;

  List<PetCounter> _counters;
  List<PetCounter> get counters => _$this._counters;
  set counters(List<PetCounter> counters) => _$this._counters = counters;

  PetDetailsLoadSuccessBuilder();

  PetDetailsLoadSuccessBuilder get _$this {
    if (_$v != null) {
      _petId = _$v.petId;
      _counters = _$v.counters;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetDetailsLoadSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetDetailsLoadSuccess;
  }

  @override
  void update(void Function(PetDetailsLoadSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetDetailsLoadSuccess build() {
    final _$result =
        _$v ?? new _$PetDetailsLoadSuccess._(petId: petId, counters: counters);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
