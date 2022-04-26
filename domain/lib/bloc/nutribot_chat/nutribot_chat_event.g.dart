// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutribot_chat_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NutribotChatSubStateUpdated>
    _$nutribotChatSubStateUpdatedSerializer =
    new _$NutribotChatSubStateUpdatedSerializer();
Serializer<NutribotChatStarted> _$nutribotChatStartedSerializer =
    new _$NutribotChatStartedSerializer();
Serializer<NutribotChatWeightManagementPressed>
    _$nutribotChatWeightManagementPressedSerializer =
    new _$NutribotChatWeightManagementPressedSerializer();
Serializer<NutribotChatIsOutdoorCatPressed>
    _$nutribotChatIsOutdoorCatPressedSerializer =
    new _$NutribotChatIsOutdoorCatPressedSerializer();
Serializer<NutribotChatHipJointsPressed>
    _$nutribotChatHipJointsPressedSerializer =
    new _$NutribotChatHipJointsPressedSerializer();
Serializer<NutribotChatFoodSensitivitiesPressed>
    _$nutribotChatFoodSensitivitiesPressedSerializer =
    new _$NutribotChatFoodSensitivitiesPressedSerializer();
Serializer<NutribotChatPreferedFoodTypePressed>
    _$nutribotChatPreferedFoodTypePressedSerializer =
    new _$NutribotChatPreferedFoodTypePressedSerializer();
Serializer<NutribotChatFeedbackPressed>
    _$nutribotChatFeedbackPressedSerializer =
    new _$NutribotChatFeedbackPressedSerializer();

class _$NutribotChatSubStateUpdatedSerializer
    implements StructuredSerializer<NutribotChatSubStateUpdated> {
  @override
  final Iterable<Type> types = const [
    NutribotChatSubStateUpdated,
    _$NutribotChatSubStateUpdated
  ];
  @override
  final String wireName = 'NutribotChatSubStateUpdated';

  @override
  Iterable<Object> serialize(
      Serializers serializers, NutribotChatSubStateUpdated object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'nutribotChatState',
      serializers.serialize(object.nutribotChatState,
          specifiedType: const FullType(NutribotChatState)),
    ];

    return result;
  }

  @override
  NutribotChatSubStateUpdated deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NutribotChatSubStateUpdatedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'nutribotChatState':
          result.nutribotChatState = serializers.deserialize(value,
                  specifiedType: const FullType(NutribotChatState))
              as NutribotChatState;
          break;
      }
    }

    return result.build();
  }
}

class _$NutribotChatStartedSerializer
    implements StructuredSerializer<NutribotChatStarted> {
  @override
  final Iterable<Type> types = const [
    NutribotChatStarted,
    _$NutribotChatStarted
  ];
  @override
  final String wireName = 'NutribotChatStarted';

  @override
  Iterable<Object> serialize(
      Serializers serializers, NutribotChatStarted object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(User)),
      'shouldAskFeedback',
      serializers.serialize(object.shouldAskFeedback,
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
  NutribotChatStarted deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NutribotChatStartedBuilder();

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
        case 'shouldAskFeedback':
          result.shouldAskFeedback = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$NutribotChatWeightManagementPressedSerializer
    implements StructuredSerializer<NutribotChatWeightManagementPressed> {
  @override
  final Iterable<Type> types = const [
    NutribotChatWeightManagementPressed,
    _$NutribotChatWeightManagementPressed
  ];
  @override
  final String wireName = 'NutribotChatWeightManagementPressed';

  @override
  Iterable<Object> serialize(
      Serializers serializers, NutribotChatWeightManagementPressed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'needsWeightManagementFood',
      serializers.serialize(object.needsWeightManagementFood,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  NutribotChatWeightManagementPressed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NutribotChatWeightManagementPressedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'needsWeightManagementFood':
          result.needsWeightManagementFood = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$NutribotChatIsOutdoorCatPressedSerializer
    implements StructuredSerializer<NutribotChatIsOutdoorCatPressed> {
  @override
  final Iterable<Type> types = const [
    NutribotChatIsOutdoorCatPressed,
    _$NutribotChatIsOutdoorCatPressed
  ];
  @override
  final String wireName = 'NutribotChatIsOutdoorCatPressed';

  @override
  Iterable<Object> serialize(
      Serializers serializers, NutribotChatIsOutdoorCatPressed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isOutdoor',
      serializers.serialize(object.isOutdoor,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  NutribotChatIsOutdoorCatPressed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NutribotChatIsOutdoorCatPressedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isOutdoor':
          result.isOutdoor = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$NutribotChatHipJointsPressedSerializer
    implements StructuredSerializer<NutribotChatHipJointsPressed> {
  @override
  final Iterable<Type> types = const [
    NutribotChatHipJointsPressed,
    _$NutribotChatHipJointsPressed
  ];
  @override
  final String wireName = 'NutribotChatHipJointsPressed';

  @override
  Iterable<Object> serialize(
      Serializers serializers, NutribotChatHipJointsPressed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'hasHipJointIssues',
      serializers.serialize(object.hasHipJointIssues,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  NutribotChatHipJointsPressed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NutribotChatHipJointsPressedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'hasHipJointIssues':
          result.hasHipJointIssues = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$NutribotChatFoodSensitivitiesPressedSerializer
    implements StructuredSerializer<NutribotChatFoodSensitivitiesPressed> {
  @override
  final Iterable<Type> types = const [
    NutribotChatFoodSensitivitiesPressed,
    _$NutribotChatFoodSensitivitiesPressed
  ];
  @override
  final String wireName = 'NutribotChatFoodSensitivitiesPressed';

  @override
  Iterable<Object> serialize(
      Serializers serializers, NutribotChatFoodSensitivitiesPressed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'foodSensitivityOptions',
      serializers.serialize(object.foodSensitivityOptions,
          specifiedType:
              const FullType(List, const [const FullType(OptionViewModel)])),
    ];

    return result;
  }

  @override
  NutribotChatFoodSensitivitiesPressed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NutribotChatFoodSensitivitiesPressedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'foodSensitivityOptions':
          result.foodSensitivityOptions = serializers.deserialize(value,
                  specifiedType: const FullType(
                      List, const [const FullType(OptionViewModel)]))
              as List<OptionViewModel>;
          break;
      }
    }

    return result.build();
  }
}

class _$NutribotChatPreferedFoodTypePressedSerializer
    implements StructuredSerializer<NutribotChatPreferedFoodTypePressed> {
  @override
  final Iterable<Type> types = const [
    NutribotChatPreferedFoodTypePressed,
    _$NutribotChatPreferedFoodTypePressed
  ];
  @override
  final String wireName = 'NutribotChatPreferedFoodTypePressed';

  @override
  Iterable<Object> serialize(
      Serializers serializers, NutribotChatPreferedFoodTypePressed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'preferedFoodTypeOption',
      serializers.serialize(object.preferedFoodTypeOption,
          specifiedType: const FullType(
              OptionViewModel, const [const FullType(FoodType)])),
    ];

    return result;
  }

  @override
  NutribotChatPreferedFoodTypePressed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NutribotChatPreferedFoodTypePressedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'preferedFoodTypeOption':
          result.preferedFoodTypeOption.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      OptionViewModel, const [const FullType(FoodType)]))
              as OptionViewModel<FoodType>);
          break;
      }
    }

    return result.build();
  }
}

class _$NutribotChatFeedbackPressedSerializer
    implements StructuredSerializer<NutribotChatFeedbackPressed> {
  @override
  final Iterable<Type> types = const [
    NutribotChatFeedbackPressed,
    _$NutribotChatFeedbackPressed
  ];
  @override
  final String wireName = 'NutribotChatFeedbackPressed';

  @override
  Iterable<Object> serialize(
      Serializers serializers, NutribotChatFeedbackPressed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'feedback',
      serializers.serialize(object.feedback,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  NutribotChatFeedbackPressed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NutribotChatFeedbackPressedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'feedback':
          result.feedback = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$NutribotChatSubStateUpdated extends NutribotChatSubStateUpdated {
  @override
  final NutribotChatState nutribotChatState;

  factory _$NutribotChatSubStateUpdated(
          [void Function(NutribotChatSubStateUpdatedBuilder) updates]) =>
      (new NutribotChatSubStateUpdatedBuilder()..update(updates)).build();

  _$NutribotChatSubStateUpdated._({this.nutribotChatState}) : super._() {
    if (nutribotChatState == null) {
      throw new BuiltValueNullFieldError(
          'NutribotChatSubStateUpdated', 'nutribotChatState');
    }
  }

  @override
  NutribotChatSubStateUpdated rebuild(
          void Function(NutribotChatSubStateUpdatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NutribotChatSubStateUpdatedBuilder toBuilder() =>
      new NutribotChatSubStateUpdatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NutribotChatSubStateUpdated &&
        nutribotChatState == other.nutribotChatState;
  }

  @override
  int get hashCode {
    return $jf($jc(0, nutribotChatState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NutribotChatSubStateUpdated')
          ..add('nutribotChatState', nutribotChatState))
        .toString();
  }
}

class NutribotChatSubStateUpdatedBuilder
    implements
        Builder<NutribotChatSubStateUpdated,
            NutribotChatSubStateUpdatedBuilder> {
  _$NutribotChatSubStateUpdated _$v;

  NutribotChatState _nutribotChatState;
  NutribotChatState get nutribotChatState => _$this._nutribotChatState;
  set nutribotChatState(NutribotChatState nutribotChatState) =>
      _$this._nutribotChatState = nutribotChatState;

  NutribotChatSubStateUpdatedBuilder();

  NutribotChatSubStateUpdatedBuilder get _$this {
    if (_$v != null) {
      _nutribotChatState = _$v.nutribotChatState;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NutribotChatSubStateUpdated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NutribotChatSubStateUpdated;
  }

  @override
  void update(void Function(NutribotChatSubStateUpdatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NutribotChatSubStateUpdated build() {
    final _$result = _$v ??
        new _$NutribotChatSubStateUpdated._(
            nutribotChatState: nutribotChatState);
    replace(_$result);
    return _$result;
  }
}

class _$NutribotChatStarted extends NutribotChatStarted {
  @override
  final Pet pet;
  @override
  final User user;
  @override
  final bool shouldAskFeedback;

  factory _$NutribotChatStarted(
          [void Function(NutribotChatStartedBuilder) updates]) =>
      (new NutribotChatStartedBuilder()..update(updates)).build();

  _$NutribotChatStarted._({this.pet, this.user, this.shouldAskFeedback})
      : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('NutribotChatStarted', 'user');
    }
    if (shouldAskFeedback == null) {
      throw new BuiltValueNullFieldError(
          'NutribotChatStarted', 'shouldAskFeedback');
    }
  }

  @override
  NutribotChatStarted rebuild(
          void Function(NutribotChatStartedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NutribotChatStartedBuilder toBuilder() =>
      new NutribotChatStartedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NutribotChatStarted &&
        pet == other.pet &&
        user == other.user &&
        shouldAskFeedback == other.shouldAskFeedback;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, pet.hashCode), user.hashCode), shouldAskFeedback.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NutribotChatStarted')
          ..add('pet', pet)
          ..add('user', user)
          ..add('shouldAskFeedback', shouldAskFeedback))
        .toString();
  }
}

class NutribotChatStartedBuilder
    implements Builder<NutribotChatStarted, NutribotChatStartedBuilder> {
  _$NutribotChatStarted _$v;

  Pet _pet;
  Pet get pet => _$this._pet;
  set pet(Pet pet) => _$this._pet = pet;

  User _user;
  User get user => _$this._user;
  set user(User user) => _$this._user = user;

  bool _shouldAskFeedback;
  bool get shouldAskFeedback => _$this._shouldAskFeedback;
  set shouldAskFeedback(bool shouldAskFeedback) =>
      _$this._shouldAskFeedback = shouldAskFeedback;

  NutribotChatStartedBuilder() {
    NutribotChatStarted._initializeBuilder(this);
  }

  NutribotChatStartedBuilder get _$this {
    if (_$v != null) {
      _pet = _$v.pet;
      _user = _$v.user;
      _shouldAskFeedback = _$v.shouldAskFeedback;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NutribotChatStarted other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NutribotChatStarted;
  }

  @override
  void update(void Function(NutribotChatStartedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NutribotChatStarted build() {
    final _$result = _$v ??
        new _$NutribotChatStarted._(
            pet: pet, user: user, shouldAskFeedback: shouldAskFeedback);
    replace(_$result);
    return _$result;
  }
}

class _$NutribotChatWeightManagementPressed
    extends NutribotChatWeightManagementPressed {
  @override
  final bool needsWeightManagementFood;

  factory _$NutribotChatWeightManagementPressed(
          [void Function(NutribotChatWeightManagementPressedBuilder)
              updates]) =>
      (new NutribotChatWeightManagementPressedBuilder()..update(updates))
          .build();

  _$NutribotChatWeightManagementPressed._({this.needsWeightManagementFood})
      : super._() {
    if (needsWeightManagementFood == null) {
      throw new BuiltValueNullFieldError(
          'NutribotChatWeightManagementPressed', 'needsWeightManagementFood');
    }
  }

  @override
  NutribotChatWeightManagementPressed rebuild(
          void Function(NutribotChatWeightManagementPressedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NutribotChatWeightManagementPressedBuilder toBuilder() =>
      new NutribotChatWeightManagementPressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NutribotChatWeightManagementPressed &&
        needsWeightManagementFood == other.needsWeightManagementFood;
  }

  @override
  int get hashCode {
    return $jf($jc(0, needsWeightManagementFood.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NutribotChatWeightManagementPressed')
          ..add('needsWeightManagementFood', needsWeightManagementFood))
        .toString();
  }
}

class NutribotChatWeightManagementPressedBuilder
    implements
        Builder<NutribotChatWeightManagementPressed,
            NutribotChatWeightManagementPressedBuilder> {
  _$NutribotChatWeightManagementPressed _$v;

  bool _needsWeightManagementFood;
  bool get needsWeightManagementFood => _$this._needsWeightManagementFood;
  set needsWeightManagementFood(bool needsWeightManagementFood) =>
      _$this._needsWeightManagementFood = needsWeightManagementFood;

  NutribotChatWeightManagementPressedBuilder();

  NutribotChatWeightManagementPressedBuilder get _$this {
    if (_$v != null) {
      _needsWeightManagementFood = _$v.needsWeightManagementFood;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NutribotChatWeightManagementPressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NutribotChatWeightManagementPressed;
  }

  @override
  void update(
      void Function(NutribotChatWeightManagementPressedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NutribotChatWeightManagementPressed build() {
    final _$result = _$v ??
        new _$NutribotChatWeightManagementPressed._(
            needsWeightManagementFood: needsWeightManagementFood);
    replace(_$result);
    return _$result;
  }
}

class _$NutribotChatIsOutdoorCatPressed
    extends NutribotChatIsOutdoorCatPressed {
  @override
  final bool isOutdoor;

  factory _$NutribotChatIsOutdoorCatPressed(
          [void Function(NutribotChatIsOutdoorCatPressedBuilder) updates]) =>
      (new NutribotChatIsOutdoorCatPressedBuilder()..update(updates)).build();

  _$NutribotChatIsOutdoorCatPressed._({this.isOutdoor}) : super._() {
    if (isOutdoor == null) {
      throw new BuiltValueNullFieldError(
          'NutribotChatIsOutdoorCatPressed', 'isOutdoor');
    }
  }

  @override
  NutribotChatIsOutdoorCatPressed rebuild(
          void Function(NutribotChatIsOutdoorCatPressedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NutribotChatIsOutdoorCatPressedBuilder toBuilder() =>
      new NutribotChatIsOutdoorCatPressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NutribotChatIsOutdoorCatPressed &&
        isOutdoor == other.isOutdoor;
  }

  @override
  int get hashCode {
    return $jf($jc(0, isOutdoor.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NutribotChatIsOutdoorCatPressed')
          ..add('isOutdoor', isOutdoor))
        .toString();
  }
}

class NutribotChatIsOutdoorCatPressedBuilder
    implements
        Builder<NutribotChatIsOutdoorCatPressed,
            NutribotChatIsOutdoorCatPressedBuilder> {
  _$NutribotChatIsOutdoorCatPressed _$v;

  bool _isOutdoor;
  bool get isOutdoor => _$this._isOutdoor;
  set isOutdoor(bool isOutdoor) => _$this._isOutdoor = isOutdoor;

  NutribotChatIsOutdoorCatPressedBuilder();

  NutribotChatIsOutdoorCatPressedBuilder get _$this {
    if (_$v != null) {
      _isOutdoor = _$v.isOutdoor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NutribotChatIsOutdoorCatPressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NutribotChatIsOutdoorCatPressed;
  }

  @override
  void update(void Function(NutribotChatIsOutdoorCatPressedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NutribotChatIsOutdoorCatPressed build() {
    final _$result =
        _$v ?? new _$NutribotChatIsOutdoorCatPressed._(isOutdoor: isOutdoor);
    replace(_$result);
    return _$result;
  }
}

class _$NutribotDullCoatOrDrySkinPressed
    extends NutribotDullCoatOrDrySkinPressed {
  @override
  final bool hasDullCoatOrDrySkin;

  factory _$NutribotDullCoatOrDrySkinPressed(
          [void Function(NutribotDullCoatOrDrySkinPressedBuilder) updates]) =>
      (new NutribotDullCoatOrDrySkinPressedBuilder()..update(updates)).build();

  _$NutribotDullCoatOrDrySkinPressed._({this.hasDullCoatOrDrySkin})
      : super._() {
    if (hasDullCoatOrDrySkin == null) {
      throw new BuiltValueNullFieldError(
          'NutribotDullCoatOrDrySkinPressed', 'hasDullCoatOrDrySkin');
    }
  }

  @override
  NutribotDullCoatOrDrySkinPressed rebuild(
          void Function(NutribotDullCoatOrDrySkinPressedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NutribotDullCoatOrDrySkinPressedBuilder toBuilder() =>
      new NutribotDullCoatOrDrySkinPressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NutribotDullCoatOrDrySkinPressed &&
        hasDullCoatOrDrySkin == other.hasDullCoatOrDrySkin;
  }

  @override
  int get hashCode {
    return $jf($jc(0, hasDullCoatOrDrySkin.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NutribotDullCoatOrDrySkinPressed')
          ..add('hasDullCoatOrDrySkin', hasDullCoatOrDrySkin))
        .toString();
  }
}

class NutribotDullCoatOrDrySkinPressedBuilder
    implements
        Builder<NutribotDullCoatOrDrySkinPressed,
            NutribotDullCoatOrDrySkinPressedBuilder> {
  _$NutribotDullCoatOrDrySkinPressed _$v;

  bool _hasDullCoatOrDrySkin;
  bool get hasDullCoatOrDrySkin => _$this._hasDullCoatOrDrySkin;
  set hasDullCoatOrDrySkin(bool hasDullCoatOrDrySkin) =>
      _$this._hasDullCoatOrDrySkin = hasDullCoatOrDrySkin;

  NutribotDullCoatOrDrySkinPressedBuilder();

  NutribotDullCoatOrDrySkinPressedBuilder get _$this {
    if (_$v != null) {
      _hasDullCoatOrDrySkin = _$v.hasDullCoatOrDrySkin;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NutribotDullCoatOrDrySkinPressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NutribotDullCoatOrDrySkinPressed;
  }

  @override
  void update(void Function(NutribotDullCoatOrDrySkinPressedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NutribotDullCoatOrDrySkinPressed build() {
    final _$result = _$v ??
        new _$NutribotDullCoatOrDrySkinPressed._(
            hasDullCoatOrDrySkin: hasDullCoatOrDrySkin);
    replace(_$result);
    return _$result;
  }
}

class _$NutribotChatHipJointsPressed extends NutribotChatHipJointsPressed {
  @override
  final bool hasHipJointIssues;

  factory _$NutribotChatHipJointsPressed(
          [void Function(NutribotChatHipJointsPressedBuilder) updates]) =>
      (new NutribotChatHipJointsPressedBuilder()..update(updates)).build();

  _$NutribotChatHipJointsPressed._({this.hasHipJointIssues}) : super._() {
    if (hasHipJointIssues == null) {
      throw new BuiltValueNullFieldError(
          'NutribotChatHipJointsPressed', 'hasHipJointIssues');
    }
  }

  @override
  NutribotChatHipJointsPressed rebuild(
          void Function(NutribotChatHipJointsPressedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NutribotChatHipJointsPressedBuilder toBuilder() =>
      new NutribotChatHipJointsPressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NutribotChatHipJointsPressed &&
        hasHipJointIssues == other.hasHipJointIssues;
  }

  @override
  int get hashCode {
    return $jf($jc(0, hasHipJointIssues.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NutribotChatHipJointsPressed')
          ..add('hasHipJointIssues', hasHipJointIssues))
        .toString();
  }
}

class NutribotChatHipJointsPressedBuilder
    implements
        Builder<NutribotChatHipJointsPressed,
            NutribotChatHipJointsPressedBuilder> {
  _$NutribotChatHipJointsPressed _$v;

  bool _hasHipJointIssues;
  bool get hasHipJointIssues => _$this._hasHipJointIssues;
  set hasHipJointIssues(bool hasHipJointIssues) =>
      _$this._hasHipJointIssues = hasHipJointIssues;

  NutribotChatHipJointsPressedBuilder();

  NutribotChatHipJointsPressedBuilder get _$this {
    if (_$v != null) {
      _hasHipJointIssues = _$v.hasHipJointIssues;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NutribotChatHipJointsPressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NutribotChatHipJointsPressed;
  }

  @override
  void update(void Function(NutribotChatHipJointsPressedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NutribotChatHipJointsPressed build() {
    final _$result = _$v ??
        new _$NutribotChatHipJointsPressed._(
            hasHipJointIssues: hasHipJointIssues);
    replace(_$result);
    return _$result;
  }
}

class _$NutribotChatFoodSensitivitiesPressed
    extends NutribotChatFoodSensitivitiesPressed {
  @override
  final List<OptionViewModel> foodSensitivityOptions;

  factory _$NutribotChatFoodSensitivitiesPressed(
          [void Function(NutribotChatFoodSensitivitiesPressedBuilder)
              updates]) =>
      (new NutribotChatFoodSensitivitiesPressedBuilder()..update(updates))
          .build();

  _$NutribotChatFoodSensitivitiesPressed._({this.foodSensitivityOptions})
      : super._() {
    if (foodSensitivityOptions == null) {
      throw new BuiltValueNullFieldError(
          'NutribotChatFoodSensitivitiesPressed', 'foodSensitivityOptions');
    }
  }

  @override
  NutribotChatFoodSensitivitiesPressed rebuild(
          void Function(NutribotChatFoodSensitivitiesPressedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NutribotChatFoodSensitivitiesPressedBuilder toBuilder() =>
      new NutribotChatFoodSensitivitiesPressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NutribotChatFoodSensitivitiesPressed &&
        foodSensitivityOptions == other.foodSensitivityOptions;
  }

  @override
  int get hashCode {
    return $jf($jc(0, foodSensitivityOptions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NutribotChatFoodSensitivitiesPressed')
          ..add('foodSensitivityOptions', foodSensitivityOptions))
        .toString();
  }
}

class NutribotChatFoodSensitivitiesPressedBuilder
    implements
        Builder<NutribotChatFoodSensitivitiesPressed,
            NutribotChatFoodSensitivitiesPressedBuilder> {
  _$NutribotChatFoodSensitivitiesPressed _$v;

  List<OptionViewModel> _foodSensitivityOptions;
  List<OptionViewModel> get foodSensitivityOptions =>
      _$this._foodSensitivityOptions;
  set foodSensitivityOptions(List<OptionViewModel> foodSensitivityOptions) =>
      _$this._foodSensitivityOptions = foodSensitivityOptions;

  NutribotChatFoodSensitivitiesPressedBuilder();

  NutribotChatFoodSensitivitiesPressedBuilder get _$this {
    if (_$v != null) {
      _foodSensitivityOptions = _$v.foodSensitivityOptions;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NutribotChatFoodSensitivitiesPressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NutribotChatFoodSensitivitiesPressed;
  }

  @override
  void update(
      void Function(NutribotChatFoodSensitivitiesPressedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NutribotChatFoodSensitivitiesPressed build() {
    final _$result = _$v ??
        new _$NutribotChatFoodSensitivitiesPressed._(
            foodSensitivityOptions: foodSensitivityOptions);
    replace(_$result);
    return _$result;
  }
}

class _$NutribotChatPreferedFoodTypePressed
    extends NutribotChatPreferedFoodTypePressed {
  @override
  final OptionViewModel<FoodType> preferedFoodTypeOption;

  factory _$NutribotChatPreferedFoodTypePressed(
          [void Function(NutribotChatPreferedFoodTypePressedBuilder)
              updates]) =>
      (new NutribotChatPreferedFoodTypePressedBuilder()..update(updates))
          .build();

  _$NutribotChatPreferedFoodTypePressed._({this.preferedFoodTypeOption})
      : super._() {
    if (preferedFoodTypeOption == null) {
      throw new BuiltValueNullFieldError(
          'NutribotChatPreferedFoodTypePressed', 'preferedFoodTypeOption');
    }
  }

  @override
  NutribotChatPreferedFoodTypePressed rebuild(
          void Function(NutribotChatPreferedFoodTypePressedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NutribotChatPreferedFoodTypePressedBuilder toBuilder() =>
      new NutribotChatPreferedFoodTypePressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NutribotChatPreferedFoodTypePressed &&
        preferedFoodTypeOption == other.preferedFoodTypeOption;
  }

  @override
  int get hashCode {
    return $jf($jc(0, preferedFoodTypeOption.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NutribotChatPreferedFoodTypePressed')
          ..add('preferedFoodTypeOption', preferedFoodTypeOption))
        .toString();
  }
}

class NutribotChatPreferedFoodTypePressedBuilder
    implements
        Builder<NutribotChatPreferedFoodTypePressed,
            NutribotChatPreferedFoodTypePressedBuilder> {
  _$NutribotChatPreferedFoodTypePressed _$v;

  OptionViewModelBuilder<FoodType> _preferedFoodTypeOption;
  OptionViewModelBuilder<FoodType> get preferedFoodTypeOption =>
      _$this._preferedFoodTypeOption ??= new OptionViewModelBuilder<FoodType>();
  set preferedFoodTypeOption(
          OptionViewModelBuilder<FoodType> preferedFoodTypeOption) =>
      _$this._preferedFoodTypeOption = preferedFoodTypeOption;

  NutribotChatPreferedFoodTypePressedBuilder();

  NutribotChatPreferedFoodTypePressedBuilder get _$this {
    if (_$v != null) {
      _preferedFoodTypeOption = _$v.preferedFoodTypeOption?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NutribotChatPreferedFoodTypePressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NutribotChatPreferedFoodTypePressed;
  }

  @override
  void update(
      void Function(NutribotChatPreferedFoodTypePressedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NutribotChatPreferedFoodTypePressed build() {
    _$NutribotChatPreferedFoodTypePressed _$result;
    try {
      _$result = _$v ??
          new _$NutribotChatPreferedFoodTypePressed._(
              preferedFoodTypeOption: preferedFoodTypeOption.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'preferedFoodTypeOption';
        preferedFoodTypeOption.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NutribotChatPreferedFoodTypePressed', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NutribotFoodRecommendationsRequested
    extends NutribotFoodRecommendationsRequested {
  factory _$NutribotFoodRecommendationsRequested(
          [void Function(NutribotFoodRecommendationsRequestedBuilder)
              updates]) =>
      (new NutribotFoodRecommendationsRequestedBuilder()..update(updates))
          .build();

  _$NutribotFoodRecommendationsRequested._() : super._();

  @override
  NutribotFoodRecommendationsRequested rebuild(
          void Function(NutribotFoodRecommendationsRequestedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NutribotFoodRecommendationsRequestedBuilder toBuilder() =>
      new NutribotFoodRecommendationsRequestedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NutribotFoodRecommendationsRequested;
  }

  @override
  int get hashCode {
    return 402345528;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('NutribotFoodRecommendationsRequested')
        .toString();
  }
}

class NutribotFoodRecommendationsRequestedBuilder
    implements
        Builder<NutribotFoodRecommendationsRequested,
            NutribotFoodRecommendationsRequestedBuilder> {
  _$NutribotFoodRecommendationsRequested _$v;

  NutribotFoodRecommendationsRequestedBuilder();

  @override
  void replace(NutribotFoodRecommendationsRequested other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NutribotFoodRecommendationsRequested;
  }

  @override
  void update(
      void Function(NutribotFoodRecommendationsRequestedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NutribotFoodRecommendationsRequested build() {
    final _$result = _$v ?? new _$NutribotFoodRecommendationsRequested._();
    replace(_$result);
    return _$result;
  }
}

class _$NutribotFoodRecommendationsDisplayed
    extends NutribotFoodRecommendationsDisplayed {
  factory _$NutribotFoodRecommendationsDisplayed(
          [void Function(NutribotFoodRecommendationsDisplayedBuilder)
              updates]) =>
      (new NutribotFoodRecommendationsDisplayedBuilder()..update(updates))
          .build();

  _$NutribotFoodRecommendationsDisplayed._() : super._();

  @override
  NutribotFoodRecommendationsDisplayed rebuild(
          void Function(NutribotFoodRecommendationsDisplayedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NutribotFoodRecommendationsDisplayedBuilder toBuilder() =>
      new NutribotFoodRecommendationsDisplayedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NutribotFoodRecommendationsDisplayed;
  }

  @override
  int get hashCode {
    return 1010469282;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('NutribotFoodRecommendationsDisplayed')
        .toString();
  }
}

class NutribotFoodRecommendationsDisplayedBuilder
    implements
        Builder<NutribotFoodRecommendationsDisplayed,
            NutribotFoodRecommendationsDisplayedBuilder> {
  _$NutribotFoodRecommendationsDisplayed _$v;

  NutribotFoodRecommendationsDisplayedBuilder();

  @override
  void replace(NutribotFoodRecommendationsDisplayed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NutribotFoodRecommendationsDisplayed;
  }

  @override
  void update(
      void Function(NutribotFoodRecommendationsDisplayedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NutribotFoodRecommendationsDisplayed build() {
    final _$result = _$v ?? new _$NutribotFoodRecommendationsDisplayed._();
    replace(_$result);
    return _$result;
  }
}

class _$NutribotChatFeedbackPressed extends NutribotChatFeedbackPressed {
  @override
  final bool feedback;

  factory _$NutribotChatFeedbackPressed(
          [void Function(NutribotChatFeedbackPressedBuilder) updates]) =>
      (new NutribotChatFeedbackPressedBuilder()..update(updates)).build();

  _$NutribotChatFeedbackPressed._({this.feedback}) : super._() {
    if (feedback == null) {
      throw new BuiltValueNullFieldError(
          'NutribotChatFeedbackPressed', 'feedback');
    }
  }

  @override
  NutribotChatFeedbackPressed rebuild(
          void Function(NutribotChatFeedbackPressedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NutribotChatFeedbackPressedBuilder toBuilder() =>
      new NutribotChatFeedbackPressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NutribotChatFeedbackPressed && feedback == other.feedback;
  }

  @override
  int get hashCode {
    return $jf($jc(0, feedback.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NutribotChatFeedbackPressed')
          ..add('feedback', feedback))
        .toString();
  }
}

class NutribotChatFeedbackPressedBuilder
    implements
        Builder<NutribotChatFeedbackPressed,
            NutribotChatFeedbackPressedBuilder> {
  _$NutribotChatFeedbackPressed _$v;

  bool _feedback;
  bool get feedback => _$this._feedback;
  set feedback(bool feedback) => _$this._feedback = feedback;

  NutribotChatFeedbackPressedBuilder();

  NutribotChatFeedbackPressedBuilder get _$this {
    if (_$v != null) {
      _feedback = _$v.feedback;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NutribotChatFeedbackPressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NutribotChatFeedbackPressed;
  }

  @override
  void update(void Function(NutribotChatFeedbackPressedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NutribotChatFeedbackPressed build() {
    final _$result =
        _$v ?? new _$NutribotChatFeedbackPressed._(feedback: feedback);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
