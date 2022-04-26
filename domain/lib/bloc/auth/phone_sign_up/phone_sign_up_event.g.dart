// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_sign_up_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PhoneSignUpStarted extends PhoneSignUpStarted {
  @override
  final String phoneNumberPrefix;
  @override
  final String phoneNumber;
  @override
  final String name;
  @override
  final String lastName;
  @override
  final bool checkboxValue;

  factory _$PhoneSignUpStarted(
          [void Function(PhoneSignUpStartedBuilder) updates]) =>
      (new PhoneSignUpStartedBuilder()..update(updates)).build();

  _$PhoneSignUpStarted._(
      {this.phoneNumberPrefix,
      this.phoneNumber,
      this.name,
      this.lastName,
      this.checkboxValue})
      : super._() {
    if (phoneNumberPrefix == null) {
      throw new BuiltValueNullFieldError(
          'PhoneSignUpStarted', 'phoneNumberPrefix');
    }
    if (phoneNumber == null) {
      throw new BuiltValueNullFieldError('PhoneSignUpStarted', 'phoneNumber');
    }
    if (checkboxValue == null) {
      throw new BuiltValueNullFieldError('PhoneSignUpStarted', 'checkboxValue');
    }
  }

  @override
  PhoneSignUpStarted rebuild(
          void Function(PhoneSignUpStartedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignUpStartedBuilder toBuilder() =>
      new PhoneSignUpStartedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignUpStarted &&
        phoneNumberPrefix == other.phoneNumberPrefix &&
        phoneNumber == other.phoneNumber &&
        name == other.name &&
        lastName == other.lastName &&
        checkboxValue == other.checkboxValue;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, phoneNumberPrefix.hashCode), phoneNumber.hashCode),
                name.hashCode),
            lastName.hashCode),
        checkboxValue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PhoneSignUpStarted')
          ..add('phoneNumberPrefix', phoneNumberPrefix)
          ..add('phoneNumber', phoneNumber)
          ..add('name', name)
          ..add('lastName', lastName)
          ..add('checkboxValue', checkboxValue))
        .toString();
  }
}

class PhoneSignUpStartedBuilder
    implements Builder<PhoneSignUpStarted, PhoneSignUpStartedBuilder> {
  _$PhoneSignUpStarted _$v;

  String _phoneNumberPrefix;
  String get phoneNumberPrefix => _$this._phoneNumberPrefix;
  set phoneNumberPrefix(String phoneNumberPrefix) =>
      _$this._phoneNumberPrefix = phoneNumberPrefix;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  bool _checkboxValue;
  bool get checkboxValue => _$this._checkboxValue;
  set checkboxValue(bool checkboxValue) =>
      _$this._checkboxValue = checkboxValue;

  PhoneSignUpStartedBuilder();

  PhoneSignUpStartedBuilder get _$this {
    if (_$v != null) {
      _phoneNumberPrefix = _$v.phoneNumberPrefix;
      _phoneNumber = _$v.phoneNumber;
      _name = _$v.name;
      _lastName = _$v.lastName;
      _checkboxValue = _$v.checkboxValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhoneSignUpStarted other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignUpStarted;
  }

  @override
  void update(void Function(PhoneSignUpStartedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignUpStarted build() {
    final _$result = _$v ??
        new _$PhoneSignUpStarted._(
            phoneNumberPrefix: phoneNumberPrefix,
            phoneNumber: phoneNumber,
            name: name,
            lastName: lastName,
            checkboxValue: checkboxValue);
    replace(_$result);
    return _$result;
  }
}

class _$PhoneSignUpCodeResendRequested extends PhoneSignUpCodeResendRequested {
  factory _$PhoneSignUpCodeResendRequested(
          [void Function(PhoneSignUpCodeResendRequestedBuilder) updates]) =>
      (new PhoneSignUpCodeResendRequestedBuilder()..update(updates)).build();

  _$PhoneSignUpCodeResendRequested._() : super._();

  @override
  PhoneSignUpCodeResendRequested rebuild(
          void Function(PhoneSignUpCodeResendRequestedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignUpCodeResendRequestedBuilder toBuilder() =>
      new PhoneSignUpCodeResendRequestedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignUpCodeResendRequested;
  }

  @override
  int get hashCode {
    return 801571396;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('PhoneSignUpCodeResendRequested')
        .toString();
  }
}

class PhoneSignUpCodeResendRequestedBuilder
    implements
        Builder<PhoneSignUpCodeResendRequested,
            PhoneSignUpCodeResendRequestedBuilder> {
  _$PhoneSignUpCodeResendRequested _$v;

  PhoneSignUpCodeResendRequestedBuilder();

  @override
  void replace(PhoneSignUpCodeResendRequested other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignUpCodeResendRequested;
  }

  @override
  void update(void Function(PhoneSignUpCodeResendRequestedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignUpCodeResendRequested build() {
    final _$result = _$v ?? new _$PhoneSignUpCodeResendRequested._();
    replace(_$result);
    return _$result;
  }
}

class _$PhoneSignUpCodeEntered extends PhoneSignUpCodeEntered {
  @override
  final String code;

  factory _$PhoneSignUpCodeEntered(
          [void Function(PhoneSignUpCodeEnteredBuilder) updates]) =>
      (new PhoneSignUpCodeEnteredBuilder()..update(updates)).build();

  _$PhoneSignUpCodeEntered._({this.code}) : super._() {
    if (code == null) {
      throw new BuiltValueNullFieldError('PhoneSignUpCodeEntered', 'code');
    }
  }

  @override
  PhoneSignUpCodeEntered rebuild(
          void Function(PhoneSignUpCodeEnteredBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignUpCodeEnteredBuilder toBuilder() =>
      new PhoneSignUpCodeEnteredBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignUpCodeEntered && code == other.code;
  }

  @override
  int get hashCode {
    return $jf($jc(0, code.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PhoneSignUpCodeEntered')
          ..add('code', code))
        .toString();
  }
}

class PhoneSignUpCodeEnteredBuilder
    implements Builder<PhoneSignUpCodeEntered, PhoneSignUpCodeEnteredBuilder> {
  _$PhoneSignUpCodeEntered _$v;

  String _code;
  String get code => _$this._code;
  set code(String code) => _$this._code = code;

  PhoneSignUpCodeEnteredBuilder();

  PhoneSignUpCodeEnteredBuilder get _$this {
    if (_$v != null) {
      _code = _$v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhoneSignUpCodeEntered other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignUpCodeEntered;
  }

  @override
  void update(void Function(PhoneSignUpCodeEnteredBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignUpCodeEntered build() {
    final _$result = _$v ?? new _$PhoneSignUpCodeEntered._(code: code);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
