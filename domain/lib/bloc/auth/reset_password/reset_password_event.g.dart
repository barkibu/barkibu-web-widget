// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ResetPasswordStarted extends ResetPasswordStarted {
  @override
  final String email;

  factory _$ResetPasswordStarted(
          [void Function(ResetPasswordStartedBuilder) updates]) =>
      (new ResetPasswordStartedBuilder()..update(updates)).build();

  _$ResetPasswordStarted._({this.email}) : super._() {
    if (email == null) {
      throw new BuiltValueNullFieldError('ResetPasswordStarted', 'email');
    }
  }

  @override
  ResetPasswordStarted rebuild(
          void Function(ResetPasswordStartedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResetPasswordStartedBuilder toBuilder() =>
      new ResetPasswordStartedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResetPasswordStarted && email == other.email;
  }

  @override
  int get hashCode {
    return $jf($jc(0, email.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ResetPasswordStarted')
          ..add('email', email))
        .toString();
  }
}

class ResetPasswordStartedBuilder
    implements Builder<ResetPasswordStarted, ResetPasswordStartedBuilder> {
  _$ResetPasswordStarted _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  ResetPasswordStartedBuilder();

  ResetPasswordStartedBuilder get _$this {
    if (_$v != null) {
      _email = _$v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResetPasswordStarted other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ResetPasswordStarted;
  }

  @override
  void update(void Function(ResetPasswordStartedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ResetPasswordStarted build() {
    final _$result = _$v ?? new _$ResetPasswordStarted._(email: email);
    replace(_$result);
    return _$result;
  }
}

class _$ResetPasswordCodeSent extends ResetPasswordCodeSent {
  factory _$ResetPasswordCodeSent(
          [void Function(ResetPasswordCodeSentBuilder) updates]) =>
      (new ResetPasswordCodeSentBuilder()..update(updates)).build();

  _$ResetPasswordCodeSent._() : super._();

  @override
  ResetPasswordCodeSent rebuild(
          void Function(ResetPasswordCodeSentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResetPasswordCodeSentBuilder toBuilder() =>
      new ResetPasswordCodeSentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResetPasswordCodeSent;
  }

  @override
  int get hashCode {
    return 952792639;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ResetPasswordCodeSent').toString();
  }
}

class ResetPasswordCodeSentBuilder
    implements Builder<ResetPasswordCodeSent, ResetPasswordCodeSentBuilder> {
  _$ResetPasswordCodeSent _$v;

  ResetPasswordCodeSentBuilder();

  @override
  void replace(ResetPasswordCodeSent other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ResetPasswordCodeSent;
  }

  @override
  void update(void Function(ResetPasswordCodeSentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ResetPasswordCodeSent build() {
    final _$result = _$v ?? new _$ResetPasswordCodeSent._();
    replace(_$result);
    return _$result;
  }
}

class _$ResetPasswordSubmitted extends ResetPasswordSubmitted {
  factory _$ResetPasswordSubmitted(
          [void Function(ResetPasswordSubmittedBuilder) updates]) =>
      (new ResetPasswordSubmittedBuilder()..update(updates)).build();

  _$ResetPasswordSubmitted._() : super._();

  @override
  ResetPasswordSubmitted rebuild(
          void Function(ResetPasswordSubmittedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResetPasswordSubmittedBuilder toBuilder() =>
      new ResetPasswordSubmittedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResetPasswordSubmitted;
  }

  @override
  int get hashCode {
    return 195341192;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ResetPasswordSubmitted').toString();
  }
}

class ResetPasswordSubmittedBuilder
    implements Builder<ResetPasswordSubmitted, ResetPasswordSubmittedBuilder> {
  _$ResetPasswordSubmitted _$v;

  ResetPasswordSubmittedBuilder();

  @override
  void replace(ResetPasswordSubmitted other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ResetPasswordSubmitted;
  }

  @override
  void update(void Function(ResetPasswordSubmittedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ResetPasswordSubmitted build() {
    final _$result = _$v ?? new _$ResetPasswordSubmitted._();
    replace(_$result);
    return _$result;
  }
}

class _$ResetPasswordPasswordChanged extends ResetPasswordPasswordChanged {
  @override
  final String password;

  factory _$ResetPasswordPasswordChanged(
          [void Function(ResetPasswordPasswordChangedBuilder) updates]) =>
      (new ResetPasswordPasswordChangedBuilder()..update(updates)).build();

  _$ResetPasswordPasswordChanged._({this.password}) : super._() {
    if (password == null) {
      throw new BuiltValueNullFieldError(
          'ResetPasswordPasswordChanged', 'password');
    }
  }

  @override
  ResetPasswordPasswordChanged rebuild(
          void Function(ResetPasswordPasswordChangedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResetPasswordPasswordChangedBuilder toBuilder() =>
      new ResetPasswordPasswordChangedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResetPasswordPasswordChanged && password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc(0, password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ResetPasswordPasswordChanged')
          ..add('password', password))
        .toString();
  }
}

class ResetPasswordPasswordChangedBuilder
    implements
        Builder<ResetPasswordPasswordChanged,
            ResetPasswordPasswordChangedBuilder> {
  _$ResetPasswordPasswordChanged _$v;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  ResetPasswordPasswordChangedBuilder();

  ResetPasswordPasswordChangedBuilder get _$this {
    if (_$v != null) {
      _password = _$v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResetPasswordPasswordChanged other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ResetPasswordPasswordChanged;
  }

  @override
  void update(void Function(ResetPasswordPasswordChangedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ResetPasswordPasswordChanged build() {
    final _$result =
        _$v ?? new _$ResetPasswordPasswordChanged._(password: password);
    replace(_$result);
    return _$result;
  }
}

class _$ResetPasswordPasswordRepeatChanged
    extends ResetPasswordPasswordRepeatChanged {
  @override
  final String passwordRepeat;

  factory _$ResetPasswordPasswordRepeatChanged(
          [void Function(ResetPasswordPasswordRepeatChangedBuilder) updates]) =>
      (new ResetPasswordPasswordRepeatChangedBuilder()..update(updates))
          .build();

  _$ResetPasswordPasswordRepeatChanged._({this.passwordRepeat}) : super._() {
    if (passwordRepeat == null) {
      throw new BuiltValueNullFieldError(
          'ResetPasswordPasswordRepeatChanged', 'passwordRepeat');
    }
  }

  @override
  ResetPasswordPasswordRepeatChanged rebuild(
          void Function(ResetPasswordPasswordRepeatChangedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResetPasswordPasswordRepeatChangedBuilder toBuilder() =>
      new ResetPasswordPasswordRepeatChangedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResetPasswordPasswordRepeatChanged &&
        passwordRepeat == other.passwordRepeat;
  }

  @override
  int get hashCode {
    return $jf($jc(0, passwordRepeat.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ResetPasswordPasswordRepeatChanged')
          ..add('passwordRepeat', passwordRepeat))
        .toString();
  }
}

class ResetPasswordPasswordRepeatChangedBuilder
    implements
        Builder<ResetPasswordPasswordRepeatChanged,
            ResetPasswordPasswordRepeatChangedBuilder> {
  _$ResetPasswordPasswordRepeatChanged _$v;

  String _passwordRepeat;
  String get passwordRepeat => _$this._passwordRepeat;
  set passwordRepeat(String passwordRepeat) =>
      _$this._passwordRepeat = passwordRepeat;

  ResetPasswordPasswordRepeatChangedBuilder();

  ResetPasswordPasswordRepeatChangedBuilder get _$this {
    if (_$v != null) {
      _passwordRepeat = _$v.passwordRepeat;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResetPasswordPasswordRepeatChanged other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ResetPasswordPasswordRepeatChanged;
  }

  @override
  void update(
      void Function(ResetPasswordPasswordRepeatChangedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ResetPasswordPasswordRepeatChanged build() {
    final _$result = _$v ??
        new _$ResetPasswordPasswordRepeatChanged._(
            passwordRepeat: passwordRepeat);
    replace(_$result);
    return _$result;
  }
}

class _$ResetPasswordCodeChanged extends ResetPasswordCodeChanged {
  @override
  final String code;

  factory _$ResetPasswordCodeChanged(
          [void Function(ResetPasswordCodeChangedBuilder) updates]) =>
      (new ResetPasswordCodeChangedBuilder()..update(updates)).build();

  _$ResetPasswordCodeChanged._({this.code}) : super._() {
    if (code == null) {
      throw new BuiltValueNullFieldError('ResetPasswordCodeChanged', 'code');
    }
  }

  @override
  ResetPasswordCodeChanged rebuild(
          void Function(ResetPasswordCodeChangedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResetPasswordCodeChangedBuilder toBuilder() =>
      new ResetPasswordCodeChangedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResetPasswordCodeChanged && code == other.code;
  }

  @override
  int get hashCode {
    return $jf($jc(0, code.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ResetPasswordCodeChanged')
          ..add('code', code))
        .toString();
  }
}

class ResetPasswordCodeChangedBuilder
    implements
        Builder<ResetPasswordCodeChanged, ResetPasswordCodeChangedBuilder> {
  _$ResetPasswordCodeChanged _$v;

  String _code;
  String get code => _$this._code;
  set code(String code) => _$this._code = code;

  ResetPasswordCodeChangedBuilder();

  ResetPasswordCodeChangedBuilder get _$this {
    if (_$v != null) {
      _code = _$v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResetPasswordCodeChanged other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ResetPasswordCodeChanged;
  }

  @override
  void update(void Function(ResetPasswordCodeChangedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ResetPasswordCodeChanged build() {
    final _$result = _$v ?? new _$ResetPasswordCodeChanged._(code: code);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
