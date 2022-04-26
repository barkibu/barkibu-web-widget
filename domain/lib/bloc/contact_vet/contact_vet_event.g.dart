// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_vet_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ContactVetStarted> _$contactVetStartedSerializer =
    new _$ContactVetStartedSerializer();
Serializer<ContactVetCheckPhoneNumberPressed>
    _$contactVetCheckPhoneNumberPressedSerializer =
    new _$ContactVetCheckPhoneNumberPressedSerializer();
Serializer<ContactVetAddPhoneNumberPressed>
    _$contactVetAddPhoneNumberPressedSerializer =
    new _$ContactVetAddPhoneNumberPressedSerializer();
Serializer<ContactVetEmailOptionPressed>
    _$contactVetEmailOptionPressedSerializer =
    new _$ContactVetEmailOptionPressedSerializer();
Serializer<ContactVetEmailRedirectionPressed>
    _$contactVetEmailRedirectionPressedSerializer =
    new _$ContactVetEmailRedirectionPressedSerializer();
Serializer<ContactVetScheduleAppointmentPressed>
    _$contactVetScheduleAppointmentPressedSerializer =
    new _$ContactVetScheduleAppointmentPressedSerializer();
Serializer<ContactVetChatOptionPressed>
    _$contactVetChatOptionPressedSerializer =
    new _$ContactVetChatOptionPressedSerializer();

class _$ContactVetStartedSerializer
    implements StructuredSerializer<ContactVetStarted> {
  @override
  final Iterable<Type> types = const [ContactVetStarted, _$ContactVetStarted];
  @override
  final String wireName = 'ContactVetStarted';

  @override
  Iterable<Object> serialize(Serializers serializers, ContactVetStarted object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'withQuestion',
      serializers.serialize(object.withQuestion,
          specifiedType: const FullType(bool)),
      'symptoms',
      serializers.serialize(object.symptoms,
          specifiedType: const FullType(List, const [const FullType(Symptom)])),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(Flow)),
    ];
    if (object.user != null) {
      result
        ..add('user')
        ..add(serializers.serialize(object.user,
            specifiedType: const FullType(User)));
    }
    if (object.pet != null) {
      result
        ..add('pet')
        ..add(serializers.serialize(object.pet,
            specifiedType: const FullType(Pet)));
    }
    return result;
  }

  @override
  ContactVetStarted deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContactVetStartedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'withQuestion':
          result.withQuestion = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(User)) as User;
          break;
        case 'pet':
          result.pet = serializers.deserialize(value,
              specifiedType: const FullType(Pet)) as Pet;
          break;
        case 'symptoms':
          result.symptoms = serializers.deserialize(value,
                  specifiedType:
                      const FullType(List, const [const FullType(Symptom)]))
              as List<Symptom>;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(Flow)) as Flow;
          break;
      }
    }

    return result.build();
  }
}

class _$ContactVetCheckPhoneNumberPressedSerializer
    implements StructuredSerializer<ContactVetCheckPhoneNumberPressed> {
  @override
  final Iterable<Type> types = const [
    ContactVetCheckPhoneNumberPressed,
    _$ContactVetCheckPhoneNumberPressed
  ];
  @override
  final String wireName = 'ContactVetCheckPhoneNumberPressed';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ContactVetCheckPhoneNumberPressed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isPhoneNumberCorrect',
      serializers.serialize(object.isPhoneNumberCorrect,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  ContactVetCheckPhoneNumberPressed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContactVetCheckPhoneNumberPressedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isPhoneNumberCorrect':
          result.isPhoneNumberCorrect = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$ContactVetAddPhoneNumberPressedSerializer
    implements StructuredSerializer<ContactVetAddPhoneNumberPressed> {
  @override
  final Iterable<Type> types = const [
    ContactVetAddPhoneNumberPressed,
    _$ContactVetAddPhoneNumberPressed
  ];
  @override
  final String wireName = 'ContactVetAddPhoneNumberPressed';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ContactVetAddPhoneNumberPressed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'phoneNumber',
      serializers.serialize(object.phoneNumber,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ContactVetAddPhoneNumberPressed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContactVetAddPhoneNumberPressedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'phoneNumber':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ContactVetEmailOptionPressedSerializer
    implements StructuredSerializer<ContactVetEmailOptionPressed> {
  @override
  final Iterable<Type> types = const [
    ContactVetEmailOptionPressed,
    _$ContactVetEmailOptionPressed
  ];
  @override
  final String wireName = 'ContactVetEmailOptionPressed';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ContactVetEmailOptionPressed object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  ContactVetEmailOptionPressed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new ContactVetEmailOptionPressedBuilder().build();
  }
}

class _$ContactVetEmailRedirectionPressedSerializer
    implements StructuredSerializer<ContactVetEmailRedirectionPressed> {
  @override
  final Iterable<Type> types = const [
    ContactVetEmailRedirectionPressed,
    _$ContactVetEmailRedirectionPressed
  ];
  @override
  final String wireName = 'ContactVetEmailRedirectionPressed';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ContactVetEmailRedirectionPressed object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  ContactVetEmailRedirectionPressed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new ContactVetEmailRedirectionPressedBuilder().build();
  }
}

class _$ContactVetScheduleAppointmentPressedSerializer
    implements StructuredSerializer<ContactVetScheduleAppointmentPressed> {
  @override
  final Iterable<Type> types = const [
    ContactVetScheduleAppointmentPressed,
    _$ContactVetScheduleAppointmentPressed
  ];
  @override
  final String wireName = 'ContactVetScheduleAppointmentPressed';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ContactVetScheduleAppointmentPressed object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  ContactVetScheduleAppointmentPressed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new ContactVetScheduleAppointmentPressedBuilder().build();
  }
}

class _$ContactVetChatOptionPressedSerializer
    implements StructuredSerializer<ContactVetChatOptionPressed> {
  @override
  final Iterable<Type> types = const [
    ContactVetChatOptionPressed,
    _$ContactVetChatOptionPressed
  ];
  @override
  final String wireName = 'ContactVetChatOptionPressed';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ContactVetChatOptionPressed object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  ContactVetChatOptionPressed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new ContactVetChatOptionPressedBuilder().build();
  }
}

class _$ContactVetStarted extends ContactVetStarted {
  @override
  final bool withQuestion;
  @override
  final User user;
  @override
  final Pet pet;
  @override
  final List<Symptom> symptoms;
  @override
  final Flow type;

  factory _$ContactVetStarted(
          [void Function(ContactVetStartedBuilder) updates]) =>
      (new ContactVetStartedBuilder()..update(updates)).build();

  _$ContactVetStarted._(
      {this.withQuestion, this.user, this.pet, this.symptoms, this.type})
      : super._() {
    if (withQuestion == null) {
      throw new BuiltValueNullFieldError('ContactVetStarted', 'withQuestion');
    }
    if (symptoms == null) {
      throw new BuiltValueNullFieldError('ContactVetStarted', 'symptoms');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('ContactVetStarted', 'type');
    }
  }

  @override
  ContactVetStarted rebuild(void Function(ContactVetStartedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactVetStartedBuilder toBuilder() =>
      new ContactVetStartedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactVetStarted &&
        withQuestion == other.withQuestion &&
        user == other.user &&
        pet == other.pet &&
        symptoms == other.symptoms &&
        type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, withQuestion.hashCode), user.hashCode),
                pet.hashCode),
            symptoms.hashCode),
        type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ContactVetStarted')
          ..add('withQuestion', withQuestion)
          ..add('user', user)
          ..add('pet', pet)
          ..add('symptoms', symptoms)
          ..add('type', type))
        .toString();
  }
}

class ContactVetStartedBuilder
    implements Builder<ContactVetStarted, ContactVetStartedBuilder> {
  _$ContactVetStarted _$v;

  bool _withQuestion;
  bool get withQuestion => _$this._withQuestion;
  set withQuestion(bool withQuestion) => _$this._withQuestion = withQuestion;

  User _user;
  User get user => _$this._user;
  set user(User user) => _$this._user = user;

  Pet _pet;
  Pet get pet => _$this._pet;
  set pet(Pet pet) => _$this._pet = pet;

  List<Symptom> _symptoms;
  List<Symptom> get symptoms => _$this._symptoms;
  set symptoms(List<Symptom> symptoms) => _$this._symptoms = symptoms;

  Flow _type;
  Flow get type => _$this._type;
  set type(Flow type) => _$this._type = type;

  ContactVetStartedBuilder() {
    ContactVetStarted._initializeBuilder(this);
  }

  ContactVetStartedBuilder get _$this {
    if (_$v != null) {
      _withQuestion = _$v.withQuestion;
      _user = _$v.user;
      _pet = _$v.pet;
      _symptoms = _$v.symptoms;
      _type = _$v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContactVetStarted other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ContactVetStarted;
  }

  @override
  void update(void Function(ContactVetStartedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ContactVetStarted build() {
    final _$result = _$v ??
        new _$ContactVetStarted._(
            withQuestion: withQuestion,
            user: user,
            pet: pet,
            symptoms: symptoms,
            type: type);
    replace(_$result);
    return _$result;
  }
}

class _$ContactVetCheckPhoneNumberPressed
    extends ContactVetCheckPhoneNumberPressed {
  @override
  final bool isPhoneNumberCorrect;

  factory _$ContactVetCheckPhoneNumberPressed(
          [void Function(ContactVetCheckPhoneNumberPressedBuilder) updates]) =>
      (new ContactVetCheckPhoneNumberPressedBuilder()..update(updates)).build();

  _$ContactVetCheckPhoneNumberPressed._({this.isPhoneNumberCorrect})
      : super._() {
    if (isPhoneNumberCorrect == null) {
      throw new BuiltValueNullFieldError(
          'ContactVetCheckPhoneNumberPressed', 'isPhoneNumberCorrect');
    }
  }

  @override
  ContactVetCheckPhoneNumberPressed rebuild(
          void Function(ContactVetCheckPhoneNumberPressedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactVetCheckPhoneNumberPressedBuilder toBuilder() =>
      new ContactVetCheckPhoneNumberPressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactVetCheckPhoneNumberPressed &&
        isPhoneNumberCorrect == other.isPhoneNumberCorrect;
  }

  @override
  int get hashCode {
    return $jf($jc(0, isPhoneNumberCorrect.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ContactVetCheckPhoneNumberPressed')
          ..add('isPhoneNumberCorrect', isPhoneNumberCorrect))
        .toString();
  }
}

class ContactVetCheckPhoneNumberPressedBuilder
    implements
        Builder<ContactVetCheckPhoneNumberPressed,
            ContactVetCheckPhoneNumberPressedBuilder> {
  _$ContactVetCheckPhoneNumberPressed _$v;

  bool _isPhoneNumberCorrect;
  bool get isPhoneNumberCorrect => _$this._isPhoneNumberCorrect;
  set isPhoneNumberCorrect(bool isPhoneNumberCorrect) =>
      _$this._isPhoneNumberCorrect = isPhoneNumberCorrect;

  ContactVetCheckPhoneNumberPressedBuilder();

  ContactVetCheckPhoneNumberPressedBuilder get _$this {
    if (_$v != null) {
      _isPhoneNumberCorrect = _$v.isPhoneNumberCorrect;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContactVetCheckPhoneNumberPressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ContactVetCheckPhoneNumberPressed;
  }

  @override
  void update(void Function(ContactVetCheckPhoneNumberPressedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ContactVetCheckPhoneNumberPressed build() {
    final _$result = _$v ??
        new _$ContactVetCheckPhoneNumberPressed._(
            isPhoneNumberCorrect: isPhoneNumberCorrect);
    replace(_$result);
    return _$result;
  }
}

class _$ContactVetAddPhoneNumberPressed
    extends ContactVetAddPhoneNumberPressed {
  @override
  final String phoneNumber;

  factory _$ContactVetAddPhoneNumberPressed(
          [void Function(ContactVetAddPhoneNumberPressedBuilder) updates]) =>
      (new ContactVetAddPhoneNumberPressedBuilder()..update(updates)).build();

  _$ContactVetAddPhoneNumberPressed._({this.phoneNumber}) : super._() {
    if (phoneNumber == null) {
      throw new BuiltValueNullFieldError(
          'ContactVetAddPhoneNumberPressed', 'phoneNumber');
    }
  }

  @override
  ContactVetAddPhoneNumberPressed rebuild(
          void Function(ContactVetAddPhoneNumberPressedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactVetAddPhoneNumberPressedBuilder toBuilder() =>
      new ContactVetAddPhoneNumberPressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactVetAddPhoneNumberPressed &&
        phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode {
    return $jf($jc(0, phoneNumber.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ContactVetAddPhoneNumberPressed')
          ..add('phoneNumber', phoneNumber))
        .toString();
  }
}

class ContactVetAddPhoneNumberPressedBuilder
    implements
        Builder<ContactVetAddPhoneNumberPressed,
            ContactVetAddPhoneNumberPressedBuilder> {
  _$ContactVetAddPhoneNumberPressed _$v;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  ContactVetAddPhoneNumberPressedBuilder();

  ContactVetAddPhoneNumberPressedBuilder get _$this {
    if (_$v != null) {
      _phoneNumber = _$v.phoneNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContactVetAddPhoneNumberPressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ContactVetAddPhoneNumberPressed;
  }

  @override
  void update(void Function(ContactVetAddPhoneNumberPressedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ContactVetAddPhoneNumberPressed build() {
    final _$result = _$v ??
        new _$ContactVetAddPhoneNumberPressed._(phoneNumber: phoneNumber);
    replace(_$result);
    return _$result;
  }
}

class _$ContactVetPhoneAppointmentScheduled
    extends ContactVetPhoneAppointmentScheduled {
  factory _$ContactVetPhoneAppointmentScheduled(
          [void Function(ContactVetPhoneAppointmentScheduledBuilder)
              updates]) =>
      (new ContactVetPhoneAppointmentScheduledBuilder()..update(updates))
          .build();

  _$ContactVetPhoneAppointmentScheduled._() : super._();

  @override
  ContactVetPhoneAppointmentScheduled rebuild(
          void Function(ContactVetPhoneAppointmentScheduledBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactVetPhoneAppointmentScheduledBuilder toBuilder() =>
      new ContactVetPhoneAppointmentScheduledBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactVetPhoneAppointmentScheduled;
  }

  @override
  int get hashCode {
    return 495989732;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ContactVetPhoneAppointmentScheduled')
        .toString();
  }
}

class ContactVetPhoneAppointmentScheduledBuilder
    implements
        Builder<ContactVetPhoneAppointmentScheduled,
            ContactVetPhoneAppointmentScheduledBuilder> {
  _$ContactVetPhoneAppointmentScheduled _$v;

  ContactVetPhoneAppointmentScheduledBuilder();

  @override
  void replace(ContactVetPhoneAppointmentScheduled other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ContactVetPhoneAppointmentScheduled;
  }

  @override
  void update(
      void Function(ContactVetPhoneAppointmentScheduledBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ContactVetPhoneAppointmentScheduled build() {
    final _$result = _$v ?? new _$ContactVetPhoneAppointmentScheduled._();
    replace(_$result);
    return _$result;
  }
}

class _$ContactVetEmailOptionPressed extends ContactVetEmailOptionPressed {
  factory _$ContactVetEmailOptionPressed(
          [void Function(ContactVetEmailOptionPressedBuilder) updates]) =>
      (new ContactVetEmailOptionPressedBuilder()..update(updates)).build();

  _$ContactVetEmailOptionPressed._() : super._();

  @override
  ContactVetEmailOptionPressed rebuild(
          void Function(ContactVetEmailOptionPressedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactVetEmailOptionPressedBuilder toBuilder() =>
      new ContactVetEmailOptionPressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactVetEmailOptionPressed;
  }

  @override
  int get hashCode {
    return 47738191;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ContactVetEmailOptionPressed')
        .toString();
  }
}

class ContactVetEmailOptionPressedBuilder
    implements
        Builder<ContactVetEmailOptionPressed,
            ContactVetEmailOptionPressedBuilder> {
  _$ContactVetEmailOptionPressed _$v;

  ContactVetEmailOptionPressedBuilder();

  @override
  void replace(ContactVetEmailOptionPressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ContactVetEmailOptionPressed;
  }

  @override
  void update(void Function(ContactVetEmailOptionPressedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ContactVetEmailOptionPressed build() {
    final _$result = _$v ?? new _$ContactVetEmailOptionPressed._();
    replace(_$result);
    return _$result;
  }
}

class _$ContactVetEmailRedirectionPressed
    extends ContactVetEmailRedirectionPressed {
  factory _$ContactVetEmailRedirectionPressed(
          [void Function(ContactVetEmailRedirectionPressedBuilder) updates]) =>
      (new ContactVetEmailRedirectionPressedBuilder()..update(updates)).build();

  _$ContactVetEmailRedirectionPressed._() : super._();

  @override
  ContactVetEmailRedirectionPressed rebuild(
          void Function(ContactVetEmailRedirectionPressedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactVetEmailRedirectionPressedBuilder toBuilder() =>
      new ContactVetEmailRedirectionPressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactVetEmailRedirectionPressed;
  }

  @override
  int get hashCode {
    return 39936108;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ContactVetEmailRedirectionPressed')
        .toString();
  }
}

class ContactVetEmailRedirectionPressedBuilder
    implements
        Builder<ContactVetEmailRedirectionPressed,
            ContactVetEmailRedirectionPressedBuilder> {
  _$ContactVetEmailRedirectionPressed _$v;

  ContactVetEmailRedirectionPressedBuilder();

  @override
  void replace(ContactVetEmailRedirectionPressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ContactVetEmailRedirectionPressed;
  }

  @override
  void update(void Function(ContactVetEmailRedirectionPressedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ContactVetEmailRedirectionPressed build() {
    final _$result = _$v ?? new _$ContactVetEmailRedirectionPressed._();
    replace(_$result);
    return _$result;
  }
}

class _$ContactVetScheduleAppointmentPressed
    extends ContactVetScheduleAppointmentPressed {
  factory _$ContactVetScheduleAppointmentPressed(
          [void Function(ContactVetScheduleAppointmentPressedBuilder)
              updates]) =>
      (new ContactVetScheduleAppointmentPressedBuilder()..update(updates))
          .build();

  _$ContactVetScheduleAppointmentPressed._() : super._();

  @override
  ContactVetScheduleAppointmentPressed rebuild(
          void Function(ContactVetScheduleAppointmentPressedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactVetScheduleAppointmentPressedBuilder toBuilder() =>
      new ContactVetScheduleAppointmentPressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactVetScheduleAppointmentPressed;
  }

  @override
  int get hashCode {
    return 350124006;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ContactVetScheduleAppointmentPressed')
        .toString();
  }
}

class ContactVetScheduleAppointmentPressedBuilder
    implements
        Builder<ContactVetScheduleAppointmentPressed,
            ContactVetScheduleAppointmentPressedBuilder> {
  _$ContactVetScheduleAppointmentPressed _$v;

  ContactVetScheduleAppointmentPressedBuilder();

  @override
  void replace(ContactVetScheduleAppointmentPressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ContactVetScheduleAppointmentPressed;
  }

  @override
  void update(
      void Function(ContactVetScheduleAppointmentPressedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ContactVetScheduleAppointmentPressed build() {
    final _$result = _$v ?? new _$ContactVetScheduleAppointmentPressed._();
    replace(_$result);
    return _$result;
  }
}

class _$ContactVetChatOptionPressed extends ContactVetChatOptionPressed {
  factory _$ContactVetChatOptionPressed(
          [void Function(ContactVetChatOptionPressedBuilder) updates]) =>
      (new ContactVetChatOptionPressedBuilder()..update(updates)).build();

  _$ContactVetChatOptionPressed._() : super._();

  @override
  ContactVetChatOptionPressed rebuild(
          void Function(ContactVetChatOptionPressedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactVetChatOptionPressedBuilder toBuilder() =>
      new ContactVetChatOptionPressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactVetChatOptionPressed;
  }

  @override
  int get hashCode {
    return 559834397;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ContactVetChatOptionPressed')
        .toString();
  }
}

class ContactVetChatOptionPressedBuilder
    implements
        Builder<ContactVetChatOptionPressed,
            ContactVetChatOptionPressedBuilder> {
  _$ContactVetChatOptionPressed _$v;

  ContactVetChatOptionPressedBuilder();

  @override
  void replace(ContactVetChatOptionPressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ContactVetChatOptionPressed;
  }

  @override
  void update(void Function(ContactVetChatOptionPressedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ContactVetChatOptionPressed build() {
    final _$result = _$v ?? new _$ContactVetChatOptionPressed._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
