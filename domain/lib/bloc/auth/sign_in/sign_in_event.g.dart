// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SingInEmailChanged extends SingInEmailChanged {
  @override
  final String email;

  factory _$SingInEmailChanged(
          [void Function(SingInEmailChangedBuilder) updates]) =>
      (new SingInEmailChangedBuilder()..update(updates)).build();

  _$SingInEmailChanged._({this.email}) : super._() {
    if (email == null) {
      throw new BuiltValueNullFieldError('SingInEmailChanged', 'email');
    }
  }

  @override
  SingInEmailChanged rebuild(
          void Function(SingInEmailChangedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SingInEmailChangedBuilder toBuilder() =>
      new SingInEmailChangedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SingInEmailChanged && email == other.email;
  }

  @override
  int get hashCode {
    return $jf($jc(0, email.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SingInEmailChanged')
          ..add('email', email))
        .toString();
  }
}

class SingInEmailChangedBuilder
    implements Builder<SingInEmailChanged, SingInEmailChangedBuilder> {
  _$SingInEmailChanged _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  SingInEmailChangedBuilder();

  SingInEmailChangedBuilder get _$this {
    if (_$v != null) {
      _email = _$v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SingInEmailChanged other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SingInEmailChanged;
  }

  @override
  void update(void Function(SingInEmailChangedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SingInEmailChanged build() {
    final _$result = _$v ?? new _$SingInEmailChanged._(email: email);
    replace(_$result);
    return _$result;
  }
}

class _$SignInPasswordChanged extends SignInPasswordChanged {
  @override
  final String password;

  factory _$SignInPasswordChanged(
          [void Function(SignInPasswordChangedBuilder) updates]) =>
      (new SignInPasswordChangedBuilder()..update(updates)).build();

  _$SignInPasswordChanged._({this.password}) : super._() {
    if (password == null) {
      throw new BuiltValueNullFieldError('SignInPasswordChanged', 'password');
    }
  }

  @override
  SignInPasswordChanged rebuild(
          void Function(SignInPasswordChangedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignInPasswordChangedBuilder toBuilder() =>
      new SignInPasswordChangedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignInPasswordChanged && password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc(0, password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignInPasswordChanged')
          ..add('password', password))
        .toString();
  }
}

class SignInPasswordChangedBuilder
    implements Builder<SignInPasswordChanged, SignInPasswordChangedBuilder> {
  _$SignInPasswordChanged _$v;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  SignInPasswordChangedBuilder();

  SignInPasswordChangedBuilder get _$this {
    if (_$v != null) {
      _password = _$v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignInPasswordChanged other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignInPasswordChanged;
  }

  @override
  void update(void Function(SignInPasswordChangedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignInPasswordChanged build() {
    final _$result = _$v ?? new _$SignInPasswordChanged._(password: password);
    replace(_$result);
    return _$result;
  }
}

class _$SingInResetPasswordPressed extends SingInResetPasswordPressed {
  factory _$SingInResetPasswordPressed(
          [void Function(SingInResetPasswordPressedBuilder) updates]) =>
      (new SingInResetPasswordPressedBuilder()..update(updates)).build();

  _$SingInResetPasswordPressed._() : super._();

  @override
  SingInResetPasswordPressed rebuild(
          void Function(SingInResetPasswordPressedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SingInResetPasswordPressedBuilder toBuilder() =>
      new SingInResetPasswordPressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SingInResetPasswordPressed;
  }

  @override
  int get hashCode {
    return 558232204;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('SingInResetPasswordPressed').toString();
  }
}

class SingInResetPasswordPressedBuilder
    implements
        Builder<SingInResetPasswordPressed, SingInResetPasswordPressedBuilder> {
  _$SingInResetPasswordPressed _$v;

  SingInResetPasswordPressedBuilder();

  @override
  void replace(SingInResetPasswordPressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SingInResetPasswordPressed;
  }

  @override
  void update(void Function(SingInResetPasswordPressedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SingInResetPasswordPressed build() {
    final _$result = _$v ?? new _$SingInResetPasswordPressed._();
    replace(_$result);
    return _$result;
  }
}

class _$SingInSignInSubmitted extends SingInSignInSubmitted {
  @override
  final String email;
  @override
  final String password;

  factory _$SingInSignInSubmitted(
          [void Function(SingInSignInSubmittedBuilder) updates]) =>
      (new SingInSignInSubmittedBuilder()..update(updates)).build();

  _$SingInSignInSubmitted._({this.email, this.password}) : super._();

  @override
  SingInSignInSubmitted rebuild(
          void Function(SingInSignInSubmittedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SingInSignInSubmittedBuilder toBuilder() =>
      new SingInSignInSubmittedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SingInSignInSubmitted &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, email.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SingInSignInSubmitted')
          ..add('email', email)
          ..add('password', password))
        .toString();
  }
}

class SingInSignInSubmittedBuilder
    implements Builder<SingInSignInSubmitted, SingInSignInSubmittedBuilder> {
  _$SingInSignInSubmitted _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  SingInSignInSubmittedBuilder();

  SingInSignInSubmittedBuilder get _$this {
    if (_$v != null) {
      _email = _$v.email;
      _password = _$v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SingInSignInSubmitted other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SingInSignInSubmitted;
  }

  @override
  void update(void Function(SingInSignInSubmittedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SingInSignInSubmitted build() {
    final _$result =
        _$v ?? new _$SingInSignInSubmitted._(email: email, password: password);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
