// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppStarted extends AppStarted {
  @override
  final String token;
  @override
  final String otpToken;

  factory _$AppStarted([void Function(AppStartedBuilder) updates]) =>
      (new AppStartedBuilder()..update(updates)).build();

  _$AppStarted._({this.token, this.otpToken}) : super._();

  @override
  AppStarted rebuild(void Function(AppStartedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStartedBuilder toBuilder() => new AppStartedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppStarted &&
        token == other.token &&
        otpToken == other.otpToken;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, token.hashCode), otpToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppStarted')
          ..add('token', token)
          ..add('otpToken', otpToken))
        .toString();
  }
}

class AppStartedBuilder implements Builder<AppStarted, AppStartedBuilder> {
  _$AppStarted _$v;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  String _otpToken;
  String get otpToken => _$this._otpToken;
  set otpToken(String otpToken) => _$this._otpToken = otpToken;

  AppStartedBuilder();

  AppStartedBuilder get _$this {
    if (_$v != null) {
      _token = _$v.token;
      _otpToken = _$v.otpToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppStarted other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppStarted;
  }

  @override
  void update(void Function(AppStartedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppStarted build() {
    final _$result =
        _$v ?? new _$AppStarted._(token: token, otpToken: otpToken);
    replace(_$result);
    return _$result;
  }
}

class _$SignedIn extends SignedIn {
  @override
  final String token;

  factory _$SignedIn([void Function(SignedInBuilder) updates]) =>
      (new SignedInBuilder()..update(updates)).build();

  _$SignedIn._({this.token}) : super._() {
    if (token == null) {
      throw new BuiltValueNullFieldError('SignedIn', 'token');
    }
  }

  @override
  SignedIn rebuild(void Function(SignedInBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignedInBuilder toBuilder() => new SignedInBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignedIn && token == other.token;
  }

  @override
  int get hashCode {
    return $jf($jc(0, token.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignedIn')..add('token', token))
        .toString();
  }
}

class SignedInBuilder implements Builder<SignedIn, SignedInBuilder> {
  _$SignedIn _$v;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  SignedInBuilder();

  SignedInBuilder get _$this {
    if (_$v != null) {
      _token = _$v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignedIn other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignedIn;
  }

  @override
  void update(void Function(SignedInBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignedIn build() {
    final _$result = _$v ?? new _$SignedIn._(token: token);
    replace(_$result);
    return _$result;
  }
}

class _$SignedOut extends SignedOut {
  factory _$SignedOut([void Function(SignedOutBuilder) updates]) =>
      (new SignedOutBuilder()..update(updates)).build();

  _$SignedOut._() : super._();

  @override
  SignedOut rebuild(void Function(SignedOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignedOutBuilder toBuilder() => new SignedOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignedOut;
  }

  @override
  int get hashCode {
    return 867699991;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('SignedOut').toString();
  }
}

class SignedOutBuilder implements Builder<SignedOut, SignedOutBuilder> {
  _$SignedOut _$v;

  SignedOutBuilder();

  @override
  void replace(SignedOut other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignedOut;
  }

  @override
  void update(void Function(SignedOutBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignedOut build() {
    final _$result = _$v ?? new _$SignedOut._();
    replace(_$result);
    return _$result;
  }
}

class _$UserUpdated extends UserUpdated {
  @override
  final User user;

  factory _$UserUpdated([void Function(UserUpdatedBuilder) updates]) =>
      (new UserUpdatedBuilder()..update(updates)).build();

  _$UserUpdated._({this.user}) : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('UserUpdated', 'user');
    }
  }

  @override
  UserUpdated rebuild(void Function(UserUpdatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserUpdatedBuilder toBuilder() => new UserUpdatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserUpdated && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserUpdated')..add('user', user))
        .toString();
  }
}

class UserUpdatedBuilder implements Builder<UserUpdated, UserUpdatedBuilder> {
  _$UserUpdated _$v;

  User _user;
  User get user => _$this._user;
  set user(User user) => _$this._user = user;

  UserUpdatedBuilder();

  UserUpdatedBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserUpdated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserUpdated;
  }

  @override
  void update(void Function(UserUpdatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserUpdated build() {
    final _$result = _$v ?? new _$UserUpdated._(user: user);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
