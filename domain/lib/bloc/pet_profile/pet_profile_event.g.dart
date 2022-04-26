// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_profile_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PetProfileStarted extends PetProfileStarted {
  @override
  final int petId;

  factory _$PetProfileStarted(
          [void Function(PetProfileStartedBuilder) updates]) =>
      (new PetProfileStartedBuilder()..update(updates)).build();

  _$PetProfileStarted._({this.petId}) : super._();

  @override
  PetProfileStarted rebuild(void Function(PetProfileStartedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetProfileStartedBuilder toBuilder() =>
      new PetProfileStartedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetProfileStarted && petId == other.petId;
  }

  @override
  int get hashCode {
    return $jf($jc(0, petId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetProfileStarted')
          ..add('petId', petId))
        .toString();
  }
}

class PetProfileStartedBuilder
    implements Builder<PetProfileStarted, PetProfileStartedBuilder> {
  _$PetProfileStarted _$v;

  int _petId;
  int get petId => _$this._petId;
  set petId(int petId) => _$this._petId = petId;

  PetProfileStartedBuilder();

  PetProfileStartedBuilder get _$this {
    if (_$v != null) {
      _petId = _$v.petId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetProfileStarted other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetProfileStarted;
  }

  @override
  void update(void Function(PetProfileStartedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetProfileStarted build() {
    final _$result = _$v ?? new _$PetProfileStarted._(petId: petId);
    replace(_$result);
    return _$result;
  }
}

class _$PetProfilePetUpdated extends PetProfilePetUpdated {
  @override
  final Pet pet;

  factory _$PetProfilePetUpdated(
          [void Function(PetProfilePetUpdatedBuilder) updates]) =>
      (new PetProfilePetUpdatedBuilder()..update(updates)).build();

  _$PetProfilePetUpdated._({this.pet}) : super._() {
    if (pet == null) {
      throw new BuiltValueNullFieldError('PetProfilePetUpdated', 'pet');
    }
  }

  @override
  PetProfilePetUpdated rebuild(
          void Function(PetProfilePetUpdatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetProfilePetUpdatedBuilder toBuilder() =>
      new PetProfilePetUpdatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetProfilePetUpdated && pet == other.pet;
  }

  @override
  int get hashCode {
    return $jf($jc(0, pet.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetProfilePetUpdated')
          ..add('pet', pet))
        .toString();
  }
}

class PetProfilePetUpdatedBuilder
    implements Builder<PetProfilePetUpdated, PetProfilePetUpdatedBuilder> {
  _$PetProfilePetUpdated _$v;

  Pet _pet;
  Pet get pet => _$this._pet;
  set pet(Pet pet) => _$this._pet = pet;

  PetProfilePetUpdatedBuilder();

  PetProfilePetUpdatedBuilder get _$this {
    if (_$v != null) {
      _pet = _$v.pet;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetProfilePetUpdated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetProfilePetUpdated;
  }

  @override
  void update(void Function(PetProfilePetUpdatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetProfilePetUpdated build() {
    final _$result = _$v ?? new _$PetProfilePetUpdated._(pet: pet);
    replace(_$result);
    return _$result;
  }
}

class _$PetProfilePetCreated extends PetProfilePetCreated {
  @override
  final Pet pet;

  factory _$PetProfilePetCreated(
          [void Function(PetProfilePetCreatedBuilder) updates]) =>
      (new PetProfilePetCreatedBuilder()..update(updates)).build();

  _$PetProfilePetCreated._({this.pet}) : super._() {
    if (pet == null) {
      throw new BuiltValueNullFieldError('PetProfilePetCreated', 'pet');
    }
  }

  @override
  PetProfilePetCreated rebuild(
          void Function(PetProfilePetCreatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetProfilePetCreatedBuilder toBuilder() =>
      new PetProfilePetCreatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetProfilePetCreated && pet == other.pet;
  }

  @override
  int get hashCode {
    return $jf($jc(0, pet.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetProfilePetCreated')
          ..add('pet', pet))
        .toString();
  }
}

class PetProfilePetCreatedBuilder
    implements Builder<PetProfilePetCreated, PetProfilePetCreatedBuilder> {
  _$PetProfilePetCreated _$v;

  Pet _pet;
  Pet get pet => _$this._pet;
  set pet(Pet pet) => _$this._pet = pet;

  PetProfilePetCreatedBuilder();

  PetProfilePetCreatedBuilder get _$this {
    if (_$v != null) {
      _pet = _$v.pet;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetProfilePetCreated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetProfilePetCreated;
  }

  @override
  void update(void Function(PetProfilePetCreatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetProfilePetCreated build() {
    final _$result = _$v ?? new _$PetProfilePetCreated._(pet: pet);
    replace(_$result);
    return _$result;
  }
}

class _$PetProfilePetDeleted extends PetProfilePetDeleted {
  @override
  final Pet pet;

  factory _$PetProfilePetDeleted(
          [void Function(PetProfilePetDeletedBuilder) updates]) =>
      (new PetProfilePetDeletedBuilder()..update(updates)).build();

  _$PetProfilePetDeleted._({this.pet}) : super._() {
    if (pet == null) {
      throw new BuiltValueNullFieldError('PetProfilePetDeleted', 'pet');
    }
  }

  @override
  PetProfilePetDeleted rebuild(
          void Function(PetProfilePetDeletedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetProfilePetDeletedBuilder toBuilder() =>
      new PetProfilePetDeletedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetProfilePetDeleted && pet == other.pet;
  }

  @override
  int get hashCode {
    return $jf($jc(0, pet.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetProfilePetDeleted')
          ..add('pet', pet))
        .toString();
  }
}

class PetProfilePetDeletedBuilder
    implements Builder<PetProfilePetDeleted, PetProfilePetDeletedBuilder> {
  _$PetProfilePetDeleted _$v;

  Pet _pet;
  Pet get pet => _$this._pet;
  set pet(Pet pet) => _$this._pet = pet;

  PetProfilePetDeletedBuilder();

  PetProfilePetDeletedBuilder get _$this {
    if (_$v != null) {
      _pet = _$v.pet;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetProfilePetDeleted other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetProfilePetDeleted;
  }

  @override
  void update(void Function(PetProfilePetDeletedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetProfilePetDeleted build() {
    final _$result = _$v ?? new _$PetProfilePetDeleted._(pet: pet);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
