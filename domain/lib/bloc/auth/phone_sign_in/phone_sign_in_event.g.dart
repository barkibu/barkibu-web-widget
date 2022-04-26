// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_sign_in_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PhoneSignInStarted extends PhoneSignInStarted {
  @override
  final String phoneNumberPrefix;
  @override
  final String phoneNumber;

  factory _$PhoneSignInStarted(
          [void Function(PhoneSignInStartedBuilder) updates]) =>
      (new PhoneSignInStartedBuilder()..update(updates)).build();

  _$PhoneSignInStarted._({this.phoneNumberPrefix, this.phoneNumber})
      : super._() {
    if (phoneNumberPrefix == null) {
      throw new BuiltValueNullFieldError(
          'PhoneSignInStarted', 'phoneNumberPrefix');
    }
    if (phoneNumber == null) {
      throw new BuiltValueNullFieldError('PhoneSignInStarted', 'phoneNumber');
    }
  }

  @override
  PhoneSignInStarted rebuild(
          void Function(PhoneSignInStartedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignInStartedBuilder toBuilder() =>
      new PhoneSignInStartedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignInStarted &&
        phoneNumberPrefix == other.phoneNumberPrefix &&
        phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, phoneNumberPrefix.hashCode), phoneNumber.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PhoneSignInStarted')
          ..add('phoneNumberPrefix', phoneNumberPrefix)
          ..add('phoneNumber', phoneNumber))
        .toString();
  }
}

class PhoneSignInStartedBuilder
    implements Builder<PhoneSignInStarted, PhoneSignInStartedBuilder> {
  _$PhoneSignInStarted _$v;

  String _phoneNumberPrefix;
  String get phoneNumberPrefix => _$this._phoneNumberPrefix;
  set phoneNumberPrefix(String phoneNumberPrefix) =>
      _$this._phoneNumberPrefix = phoneNumberPrefix;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  PhoneSignInStartedBuilder();

  PhoneSignInStartedBuilder get _$this {
    if (_$v != null) {
      _phoneNumberPrefix = _$v.phoneNumberPrefix;
      _phoneNumber = _$v.phoneNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhoneSignInStarted other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignInStarted;
  }

  @override
  void update(void Function(PhoneSignInStartedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignInStarted build() {
    final _$result = _$v ??
        new _$PhoneSignInStarted._(
            phoneNumberPrefix: phoneNumberPrefix, phoneNumber: phoneNumber);
    replace(_$result);
    return _$result;
  }
}

class _$PhoneSignInCodeResendRequested extends PhoneSignInCodeResendRequested {
  factory _$PhoneSignInCodeResendRequested(
          [void Function(PhoneSignInCodeResendRequestedBuilder) updates]) =>
      (new PhoneSignInCodeResendRequestedBuilder()..update(updates)).build();

  _$PhoneSignInCodeResendRequested._() : super._();

  @override
  PhoneSignInCodeResendRequested rebuild(
          void Function(PhoneSignInCodeResendRequestedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignInCodeResendRequestedBuilder toBuilder() =>
      new PhoneSignInCodeResendRequestedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignInCodeResendRequested;
  }

  @override
  int get hashCode {
    return 493375896;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('PhoneSignInCodeResendRequested')
        .toString();
  }
}

class PhoneSignInCodeResendRequestedBuilder
    implements
        Builder<PhoneSignInCodeResendRequested,
            PhoneSignInCodeResendRequestedBuilder> {
  _$PhoneSignInCodeResendRequested _$v;

  PhoneSignInCodeResendRequestedBuilder();

  @override
  void replace(PhoneSignInCodeResendRequested other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignInCodeResendRequested;
  }

  @override
  void update(void Function(PhoneSignInCodeResendRequestedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignInCodeResendRequested build() {
    final _$result = _$v ?? new _$PhoneSignInCodeResendRequested._();
    replace(_$result);
    return _$result;
  }
}

class _$PhoneSignInCodeEntered extends PhoneSignInCodeEntered {
  @override
  final String code;

  factory _$PhoneSignInCodeEntered(
          [void Function(PhoneSignInCodeEnteredBuilder) updates]) =>
      (new PhoneSignInCodeEnteredBuilder()..update(updates)).build();

  _$PhoneSignInCodeEntered._({this.code}) : super._() {
    if (code == null) {
      throw new BuiltValueNullFieldError('PhoneSignInCodeEntered', 'code');
    }
  }

  @override
  PhoneSignInCodeEntered rebuild(
          void Function(PhoneSignInCodeEnteredBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignInCodeEnteredBuilder toBuilder() =>
      new PhoneSignInCodeEnteredBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignInCodeEntered && code == other.code;
  }

  @override
  int get hashCode {
    return $jf($jc(0, code.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PhoneSignInCodeEntered')
          ..add('code', code))
        .toString();
  }
}

class PhoneSignInCodeEnteredBuilder
    implements Builder<PhoneSignInCodeEntered, PhoneSignInCodeEnteredBuilder> {
  _$PhoneSignInCodeEntered _$v;

  String _code;
  String get code => _$this._code;
  set code(String code) => _$this._code = code;

  PhoneSignInCodeEnteredBuilder();

  PhoneSignInCodeEnteredBuilder get _$this {
    if (_$v != null) {
      _code = _$v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhoneSignInCodeEntered other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignInCodeEntered;
  }

  @override
  void update(void Function(PhoneSignInCodeEnteredBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignInCodeEntered build() {
    final _$result = _$v ?? new _$PhoneSignInCodeEntered._(code: code);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
