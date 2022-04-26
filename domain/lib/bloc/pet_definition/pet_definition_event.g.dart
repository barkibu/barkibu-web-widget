// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_definition_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PetDefinitionStarted> _$petDefinitionStartedSerializer =
    new _$PetDefinitionStartedSerializer();
Serializer<PetNameConfirmed> _$petNameConfirmedSerializer =
    new _$PetNameConfirmedSerializer();
Serializer<PetSpeciesConfirmed> _$petSpeciesConfirmedSerializer =
    new _$PetSpeciesConfirmedSerializer();
Serializer<PetSexConfirmed> _$petSexConfirmedSerializer =
    new _$PetSexConfirmedSerializer();
Serializer<PetNeuteredConfirmed> _$petNeuteredConfirmedSerializer =
    new _$PetNeuteredConfirmedSerializer();
Serializer<PetBirthdayConfirmed> _$petBirthdayConfirmedSerializer =
    new _$PetBirthdayConfirmedSerializer();
Serializer<PetBreedConfirmed> _$petBreedConfirmedSerializer =
    new _$PetBreedConfirmedSerializer();
Serializer<PetConfirmed> _$petConfirmedSerializer =
    new _$PetConfirmedSerializer();
Serializer<PetDefinedAndPersisted> _$petDefinedAndPersistedSerializer =
    new _$PetDefinedAndPersistedSerializer();

class _$PetDefinitionStartedSerializer
    implements StructuredSerializer<PetDefinitionStarted> {
  @override
  final Iterable<Type> types = const [
    PetDefinitionStarted,
    _$PetDefinitionStarted
  ];
  @override
  final String wireName = 'PetDefinitionStarted';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PetDefinitionStarted object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'toHandOver',
      serializers.serialize(object.toHandOver,
          specifiedType: const FullType(bool)),
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
  PetDefinitionStarted deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetDefinitionStartedBuilder();

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
        case 'toHandOver':
          result.toHandOver = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$PetNameConfirmedSerializer
    implements StructuredSerializer<PetNameConfirmed> {
  @override
  final Iterable<Type> types = const [PetNameConfirmed, _$PetNameConfirmed];
  @override
  final String wireName = 'PetNameConfirmed';

  @override
  Iterable<Object> serialize(Serializers serializers, PetNameConfirmed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'petName',
      serializers.serialize(object.petName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PetNameConfirmed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetNameConfirmedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'petName':
          result.petName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PetSpeciesConfirmedSerializer
    implements StructuredSerializer<PetSpeciesConfirmed> {
  @override
  final Iterable<Type> types = const [
    PetSpeciesConfirmed,
    _$PetSpeciesConfirmed
  ];
  @override
  final String wireName = 'PetSpeciesConfirmed';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PetSpeciesConfirmed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'petSpecies',
      serializers.serialize(object.petSpecies,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PetSpeciesConfirmed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetSpeciesConfirmedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'petSpecies':
          result.petSpecies = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PetSexConfirmedSerializer
    implements StructuredSerializer<PetSexConfirmed> {
  @override
  final Iterable<Type> types = const [PetSexConfirmed, _$PetSexConfirmed];
  @override
  final String wireName = 'PetSexConfirmed';

  @override
  Iterable<Object> serialize(Serializers serializers, PetSexConfirmed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'petSex',
      serializers.serialize(object.petSex,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PetSexConfirmed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetSexConfirmedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'petSex':
          result.petSex = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PetNeuteredConfirmedSerializer
    implements StructuredSerializer<PetNeuteredConfirmed> {
  @override
  final Iterable<Type> types = const [
    PetNeuteredConfirmed,
    _$PetNeuteredConfirmed
  ];
  @override
  final String wireName = 'PetNeuteredConfirmed';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PetNeuteredConfirmed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'petNeutered',
      serializers.serialize(object.petNeutered,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  PetNeuteredConfirmed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetNeuteredConfirmedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'petNeutered':
          result.petNeutered = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$PetBirthdayConfirmedSerializer
    implements StructuredSerializer<PetBirthdayConfirmed> {
  @override
  final Iterable<Type> types = const [
    PetBirthdayConfirmed,
    _$PetBirthdayConfirmed
  ];
  @override
  final String wireName = 'PetBirthdayConfirmed';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PetBirthdayConfirmed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'petBirthday',
      serializers.serialize(object.petBirthday,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PetBirthdayConfirmed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetBirthdayConfirmedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'petBirthday':
          result.petBirthday = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PetBreedConfirmedSerializer
    implements StructuredSerializer<PetBreedConfirmed> {
  @override
  final Iterable<Type> types = const [PetBreedConfirmed, _$PetBreedConfirmed];
  @override
  final String wireName = 'PetBreedConfirmed';

  @override
  Iterable<Object> serialize(Serializers serializers, PetBreedConfirmed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.petBreed != null) {
      result
        ..add('petBreed')
        ..add(serializers.serialize(object.petBreed,
            specifiedType: const FullType(String)));
    }
    if (object.breedUuid != null) {
      result
        ..add('breedUuid')
        ..add(serializers.serialize(object.breedUuid,
            specifiedType: const FullType(String)));
    }
    if (object.size != null) {
      result
        ..add('size')
        ..add(serializers.serialize(object.size,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PetBreedConfirmed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetBreedConfirmedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'petBreed':
          result.petBreed = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'breedUuid':
          result.breedUuid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PetConfirmedSerializer implements StructuredSerializer<PetConfirmed> {
  @override
  final Iterable<Type> types = const [PetConfirmed, _$PetConfirmed];
  @override
  final String wireName = 'PetConfirmed';

  @override
  Iterable<Object> serialize(Serializers serializers, PetConfirmed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'pet',
      serializers.serialize(object.pet, specifiedType: const FullType(Pet)),
    ];

    return result;
  }

  @override
  PetConfirmed deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetConfirmedBuilder();

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
      }
    }

    return result.build();
  }
}

class _$PetDefinedAndPersistedSerializer
    implements StructuredSerializer<PetDefinedAndPersisted> {
  @override
  final Iterable<Type> types = const [
    PetDefinedAndPersisted,
    _$PetDefinedAndPersisted
  ];
  @override
  final String wireName = 'PetDefinedAndPersisted';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PetDefinedAndPersisted object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'pet',
      serializers.serialize(object.pet, specifiedType: const FullType(Pet)),
    ];

    return result;
  }

  @override
  PetDefinedAndPersisted deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetDefinedAndPersistedBuilder();

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
      }
    }

    return result.build();
  }
}

class _$PetDefinitionStarted extends PetDefinitionStarted {
  @override
  final Pet pet;
  @override
  final bool toHandOver;

  factory _$PetDefinitionStarted(
          [void Function(PetDefinitionStartedBuilder) updates]) =>
      (new PetDefinitionStartedBuilder()..update(updates)).build();

  _$PetDefinitionStarted._({this.pet, this.toHandOver}) : super._() {
    if (toHandOver == null) {
      throw new BuiltValueNullFieldError('PetDefinitionStarted', 'toHandOver');
    }
  }

  @override
  PetDefinitionStarted rebuild(
          void Function(PetDefinitionStartedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetDefinitionStartedBuilder toBuilder() =>
      new PetDefinitionStartedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetDefinitionStarted &&
        pet == other.pet &&
        toHandOver == other.toHandOver;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, pet.hashCode), toHandOver.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetDefinitionStarted')
          ..add('pet', pet)
          ..add('toHandOver', toHandOver))
        .toString();
  }
}

class PetDefinitionStartedBuilder
    implements Builder<PetDefinitionStarted, PetDefinitionStartedBuilder> {
  _$PetDefinitionStarted _$v;

  Pet _pet;
  Pet get pet => _$this._pet;
  set pet(Pet pet) => _$this._pet = pet;

  bool _toHandOver;
  bool get toHandOver => _$this._toHandOver;
  set toHandOver(bool toHandOver) => _$this._toHandOver = toHandOver;

  PetDefinitionStartedBuilder() {
    PetDefinitionStarted._initializeBuilder(this);
  }

  PetDefinitionStartedBuilder get _$this {
    if (_$v != null) {
      _pet = _$v.pet;
      _toHandOver = _$v.toHandOver;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetDefinitionStarted other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetDefinitionStarted;
  }

  @override
  void update(void Function(PetDefinitionStartedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetDefinitionStarted build() {
    final _$result =
        _$v ?? new _$PetDefinitionStarted._(pet: pet, toHandOver: toHandOver);
    replace(_$result);
    return _$result;
  }
}

class _$PetNameConfirmed extends PetNameConfirmed {
  @override
  final String petName;

  factory _$PetNameConfirmed(
          [void Function(PetNameConfirmedBuilder) updates]) =>
      (new PetNameConfirmedBuilder()..update(updates)).build();

  _$PetNameConfirmed._({this.petName}) : super._() {
    if (petName == null) {
      throw new BuiltValueNullFieldError('PetNameConfirmed', 'petName');
    }
  }

  @override
  PetNameConfirmed rebuild(void Function(PetNameConfirmedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetNameConfirmedBuilder toBuilder() =>
      new PetNameConfirmedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetNameConfirmed && petName == other.petName;
  }

  @override
  int get hashCode {
    return $jf($jc(0, petName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetNameConfirmed')
          ..add('petName', petName))
        .toString();
  }
}

class PetNameConfirmedBuilder
    implements Builder<PetNameConfirmed, PetNameConfirmedBuilder> {
  _$PetNameConfirmed _$v;

  String _petName;
  String get petName => _$this._petName;
  set petName(String petName) => _$this._petName = petName;

  PetNameConfirmedBuilder();

  PetNameConfirmedBuilder get _$this {
    if (_$v != null) {
      _petName = _$v.petName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetNameConfirmed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetNameConfirmed;
  }

  @override
  void update(void Function(PetNameConfirmedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetNameConfirmed build() {
    final _$result = _$v ?? new _$PetNameConfirmed._(petName: petName);
    replace(_$result);
    return _$result;
  }
}

class _$PetSpeciesConfirmed extends PetSpeciesConfirmed {
  @override
  final String petSpecies;

  factory _$PetSpeciesConfirmed(
          [void Function(PetSpeciesConfirmedBuilder) updates]) =>
      (new PetSpeciesConfirmedBuilder()..update(updates)).build();

  _$PetSpeciesConfirmed._({this.petSpecies}) : super._() {
    if (petSpecies == null) {
      throw new BuiltValueNullFieldError('PetSpeciesConfirmed', 'petSpecies');
    }
  }

  @override
  PetSpeciesConfirmed rebuild(
          void Function(PetSpeciesConfirmedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetSpeciesConfirmedBuilder toBuilder() =>
      new PetSpeciesConfirmedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetSpeciesConfirmed && petSpecies == other.petSpecies;
  }

  @override
  int get hashCode {
    return $jf($jc(0, petSpecies.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetSpeciesConfirmed')
          ..add('petSpecies', petSpecies))
        .toString();
  }
}

class PetSpeciesConfirmedBuilder
    implements Builder<PetSpeciesConfirmed, PetSpeciesConfirmedBuilder> {
  _$PetSpeciesConfirmed _$v;

  String _petSpecies;
  String get petSpecies => _$this._petSpecies;
  set petSpecies(String petSpecies) => _$this._petSpecies = petSpecies;

  PetSpeciesConfirmedBuilder();

  PetSpeciesConfirmedBuilder get _$this {
    if (_$v != null) {
      _petSpecies = _$v.petSpecies;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetSpeciesConfirmed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetSpeciesConfirmed;
  }

  @override
  void update(void Function(PetSpeciesConfirmedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetSpeciesConfirmed build() {
    final _$result = _$v ?? new _$PetSpeciesConfirmed._(petSpecies: petSpecies);
    replace(_$result);
    return _$result;
  }
}

class _$PetSexConfirmed extends PetSexConfirmed {
  @override
  final String petSex;

  factory _$PetSexConfirmed([void Function(PetSexConfirmedBuilder) updates]) =>
      (new PetSexConfirmedBuilder()..update(updates)).build();

  _$PetSexConfirmed._({this.petSex}) : super._() {
    if (petSex == null) {
      throw new BuiltValueNullFieldError('PetSexConfirmed', 'petSex');
    }
  }

  @override
  PetSexConfirmed rebuild(void Function(PetSexConfirmedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetSexConfirmedBuilder toBuilder() =>
      new PetSexConfirmedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetSexConfirmed && petSex == other.petSex;
  }

  @override
  int get hashCode {
    return $jf($jc(0, petSex.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetSexConfirmed')
          ..add('petSex', petSex))
        .toString();
  }
}

class PetSexConfirmedBuilder
    implements Builder<PetSexConfirmed, PetSexConfirmedBuilder> {
  _$PetSexConfirmed _$v;

  String _petSex;
  String get petSex => _$this._petSex;
  set petSex(String petSex) => _$this._petSex = petSex;

  PetSexConfirmedBuilder();

  PetSexConfirmedBuilder get _$this {
    if (_$v != null) {
      _petSex = _$v.petSex;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetSexConfirmed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetSexConfirmed;
  }

  @override
  void update(void Function(PetSexConfirmedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetSexConfirmed build() {
    final _$result = _$v ?? new _$PetSexConfirmed._(petSex: petSex);
    replace(_$result);
    return _$result;
  }
}

class _$PetNeuteredConfirmed extends PetNeuteredConfirmed {
  @override
  final bool petNeutered;

  factory _$PetNeuteredConfirmed(
          [void Function(PetNeuteredConfirmedBuilder) updates]) =>
      (new PetNeuteredConfirmedBuilder()..update(updates)).build();

  _$PetNeuteredConfirmed._({this.petNeutered}) : super._() {
    if (petNeutered == null) {
      throw new BuiltValueNullFieldError('PetNeuteredConfirmed', 'petNeutered');
    }
  }

  @override
  PetNeuteredConfirmed rebuild(
          void Function(PetNeuteredConfirmedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetNeuteredConfirmedBuilder toBuilder() =>
      new PetNeuteredConfirmedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetNeuteredConfirmed && petNeutered == other.petNeutered;
  }

  @override
  int get hashCode {
    return $jf($jc(0, petNeutered.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetNeuteredConfirmed')
          ..add('petNeutered', petNeutered))
        .toString();
  }
}

class PetNeuteredConfirmedBuilder
    implements Builder<PetNeuteredConfirmed, PetNeuteredConfirmedBuilder> {
  _$PetNeuteredConfirmed _$v;

  bool _petNeutered;
  bool get petNeutered => _$this._petNeutered;
  set petNeutered(bool petNeutered) => _$this._petNeutered = petNeutered;

  PetNeuteredConfirmedBuilder();

  PetNeuteredConfirmedBuilder get _$this {
    if (_$v != null) {
      _petNeutered = _$v.petNeutered;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetNeuteredConfirmed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetNeuteredConfirmed;
  }

  @override
  void update(void Function(PetNeuteredConfirmedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetNeuteredConfirmed build() {
    final _$result =
        _$v ?? new _$PetNeuteredConfirmed._(petNeutered: petNeutered);
    replace(_$result);
    return _$result;
  }
}

class _$PetBirthdayConfirmed extends PetBirthdayConfirmed {
  @override
  final String petBirthday;

  factory _$PetBirthdayConfirmed(
          [void Function(PetBirthdayConfirmedBuilder) updates]) =>
      (new PetBirthdayConfirmedBuilder()..update(updates)).build();

  _$PetBirthdayConfirmed._({this.petBirthday}) : super._() {
    if (petBirthday == null) {
      throw new BuiltValueNullFieldError('PetBirthdayConfirmed', 'petBirthday');
    }
  }

  @override
  PetBirthdayConfirmed rebuild(
          void Function(PetBirthdayConfirmedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetBirthdayConfirmedBuilder toBuilder() =>
      new PetBirthdayConfirmedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetBirthdayConfirmed && petBirthday == other.petBirthday;
  }

  @override
  int get hashCode {
    return $jf($jc(0, petBirthday.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetBirthdayConfirmed')
          ..add('petBirthday', petBirthday))
        .toString();
  }
}

class PetBirthdayConfirmedBuilder
    implements Builder<PetBirthdayConfirmed, PetBirthdayConfirmedBuilder> {
  _$PetBirthdayConfirmed _$v;

  String _petBirthday;
  String get petBirthday => _$this._petBirthday;
  set petBirthday(String petBirthday) => _$this._petBirthday = petBirthday;

  PetBirthdayConfirmedBuilder();

  PetBirthdayConfirmedBuilder get _$this {
    if (_$v != null) {
      _petBirthday = _$v.petBirthday;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetBirthdayConfirmed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetBirthdayConfirmed;
  }

  @override
  void update(void Function(PetBirthdayConfirmedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetBirthdayConfirmed build() {
    final _$result =
        _$v ?? new _$PetBirthdayConfirmed._(petBirthday: petBirthday);
    replace(_$result);
    return _$result;
  }
}

class _$PetBreedConfirmed extends PetBreedConfirmed {
  @override
  final String petBreed;
  @override
  final String breedUuid;
  @override
  final String size;

  factory _$PetBreedConfirmed(
          [void Function(PetBreedConfirmedBuilder) updates]) =>
      (new PetBreedConfirmedBuilder()..update(updates)).build();

  _$PetBreedConfirmed._({this.petBreed, this.breedUuid, this.size}) : super._();

  @override
  PetBreedConfirmed rebuild(void Function(PetBreedConfirmedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetBreedConfirmedBuilder toBuilder() =>
      new PetBreedConfirmedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetBreedConfirmed &&
        petBreed == other.petBreed &&
        breedUuid == other.breedUuid &&
        size == other.size;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, petBreed.hashCode), breedUuid.hashCode), size.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetBreedConfirmed')
          ..add('petBreed', petBreed)
          ..add('breedUuid', breedUuid)
          ..add('size', size))
        .toString();
  }
}

class PetBreedConfirmedBuilder
    implements Builder<PetBreedConfirmed, PetBreedConfirmedBuilder> {
  _$PetBreedConfirmed _$v;

  String _petBreed;
  String get petBreed => _$this._petBreed;
  set petBreed(String petBreed) => _$this._petBreed = petBreed;

  String _breedUuid;
  String get breedUuid => _$this._breedUuid;
  set breedUuid(String breedUuid) => _$this._breedUuid = breedUuid;

  String _size;
  String get size => _$this._size;
  set size(String size) => _$this._size = size;

  PetBreedConfirmedBuilder();

  PetBreedConfirmedBuilder get _$this {
    if (_$v != null) {
      _petBreed = _$v.petBreed;
      _breedUuid = _$v.breedUuid;
      _size = _$v.size;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetBreedConfirmed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetBreedConfirmed;
  }

  @override
  void update(void Function(PetBreedConfirmedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetBreedConfirmed build() {
    final _$result = _$v ??
        new _$PetBreedConfirmed._(
            petBreed: petBreed, breedUuid: breedUuid, size: size);
    replace(_$result);
    return _$result;
  }
}

class _$PetConfirmed extends PetConfirmed {
  @override
  final Pet pet;

  factory _$PetConfirmed([void Function(PetConfirmedBuilder) updates]) =>
      (new PetConfirmedBuilder()..update(updates)).build();

  _$PetConfirmed._({this.pet}) : super._() {
    if (pet == null) {
      throw new BuiltValueNullFieldError('PetConfirmed', 'pet');
    }
  }

  @override
  PetConfirmed rebuild(void Function(PetConfirmedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetConfirmedBuilder toBuilder() => new PetConfirmedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetConfirmed && pet == other.pet;
  }

  @override
  int get hashCode {
    return $jf($jc(0, pet.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetConfirmed')..add('pet', pet))
        .toString();
  }
}

class PetConfirmedBuilder
    implements Builder<PetConfirmed, PetConfirmedBuilder> {
  _$PetConfirmed _$v;

  Pet _pet;
  Pet get pet => _$this._pet;
  set pet(Pet pet) => _$this._pet = pet;

  PetConfirmedBuilder();

  PetConfirmedBuilder get _$this {
    if (_$v != null) {
      _pet = _$v.pet;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetConfirmed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetConfirmed;
  }

  @override
  void update(void Function(PetConfirmedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetConfirmed build() {
    final _$result = _$v ?? new _$PetConfirmed._(pet: pet);
    replace(_$result);
    return _$result;
  }
}

class _$PetDefinedAndPersisted extends PetDefinedAndPersisted {
  @override
  final Pet pet;

  factory _$PetDefinedAndPersisted(
          [void Function(PetDefinedAndPersistedBuilder) updates]) =>
      (new PetDefinedAndPersistedBuilder()..update(updates)).build();

  _$PetDefinedAndPersisted._({this.pet}) : super._() {
    if (pet == null) {
      throw new BuiltValueNullFieldError('PetDefinedAndPersisted', 'pet');
    }
  }

  @override
  PetDefinedAndPersisted rebuild(
          void Function(PetDefinedAndPersistedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetDefinedAndPersistedBuilder toBuilder() =>
      new PetDefinedAndPersistedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetDefinedAndPersisted && pet == other.pet;
  }

  @override
  int get hashCode {
    return $jf($jc(0, pet.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetDefinedAndPersisted')
          ..add('pet', pet))
        .toString();
  }
}

class PetDefinedAndPersistedBuilder
    implements Builder<PetDefinedAndPersisted, PetDefinedAndPersistedBuilder> {
  _$PetDefinedAndPersisted _$v;

  Pet _pet;
  Pet get pet => _$this._pet;
  set pet(Pet pet) => _$this._pet = pet;

  PetDefinedAndPersistedBuilder();

  PetDefinedAndPersistedBuilder get _$this {
    if (_$v != null) {
      _pet = _$v.pet;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetDefinedAndPersisted other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetDefinedAndPersisted;
  }

  @override
  void update(void Function(PetDefinedAndPersistedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetDefinedAndPersisted build() {
    final _$result = _$v ?? new _$PetDefinedAndPersisted._(pet: pet);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
