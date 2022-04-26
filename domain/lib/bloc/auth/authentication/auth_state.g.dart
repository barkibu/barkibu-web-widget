// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthUninitialized extends AuthUninitialized {
  factory _$AuthUninitialized(
          [void Function(AuthUninitializedBuilder) updates]) =>
      (new AuthUninitializedBuilder()..update(updates)).build();

  _$AuthUninitialized._() : super._();

  @override
  AuthUninitialized rebuild(void Function(AuthUninitializedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthUninitializedBuilder toBuilder() =>
      new AuthUninitializedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthUninitialized;
  }

  @override
  int get hashCode {
    return 764423904;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('AuthUninitialized').toString();
  }
}

class AuthUninitializedBuilder
    implements Builder<AuthUninitialized, AuthUninitializedBuilder> {
  _$AuthUninitialized _$v;

  AuthUninitializedBuilder();

  @override
  void replace(AuthUninitialized other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthUninitialized;
  }

  @override
  void update(void Function(AuthUninitializedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthUninitialized build() {
    final _$result = _$v ?? new _$AuthUninitialized._();
    replace(_$result);
    return _$result;
  }
}

class _$Authenticated extends Authenticated {
  @override
  final User user;

  factory _$Authenticated([void Function(AuthenticatedBuilder) updates]) =>
      (new AuthenticatedBuilder()..update(updates)).build();

  _$Authenticated._({this.user}) : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('Authenticated', 'user');
    }
  }

  @override
  Authenticated rebuild(void Function(AuthenticatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthenticatedBuilder toBuilder() => new AuthenticatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Authenticated && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Authenticated')..add('user', user))
        .toString();
  }
}

class AuthenticatedBuilder
    implements Builder<Authenticated, AuthenticatedBuilder> {
  _$Authenticated _$v;

  User _user;
  User get user => _$this._user;
  set user(User user) => _$this._user = user;

  AuthenticatedBuilder();

  AuthenticatedBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Authenticated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Authenticated;
  }

  @override
  void update(void Function(AuthenticatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Authenticated build() {
    final _$result = _$v ?? new _$Authenticated._(user: user);
    replace(_$result);
    return _$result;
  }
}

class _$Unauthenticated extends Unauthenticated {
  factory _$Unauthenticated([void Function(UnauthenticatedBuilder) updates]) =>
      (new UnauthenticatedBuilder()..update(updates)).build();

  _$Unauthenticated._() : super._();

  @override
  Unauthenticated rebuild(void Function(UnauthenticatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnauthenticatedBuilder toBuilder() =>
      new UnauthenticatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Unauthenticated;
  }

  @override
  int get hashCode {
    return 685811249;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('Unauthenticated').toString();
  }
}

class UnauthenticatedBuilder
    implements Builder<Unauthenticated, UnauthenticatedBuilder> {
  _$Unauthenticated _$v;

  UnauthenticatedBuilder();

  @override
  void replace(Unauthenticated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Unauthenticated;
  }

  @override
  void update(void Function(UnauthenticatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Unauthenticated build() {
    final _$result = _$v ?? new _$Unauthenticated._();
    replace(_$result);
    return _$result;
  }
}

class _$AuthLoading extends AuthLoading {
  factory _$AuthLoading([void Function(AuthLoadingBuilder) updates]) =>
      (new AuthLoadingBuilder()..update(updates)).build();

  _$AuthLoading._() : super._();

  @override
  AuthLoading rebuild(void Function(AuthLoadingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthLoadingBuilder toBuilder() => new AuthLoadingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthLoading;
  }

  @override
  int get hashCode {
    return 1054918839;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('AuthLoading').toString();
  }
}

class AuthLoadingBuilder implements Builder<AuthLoading, AuthLoadingBuilder> {
  _$AuthLoading _$v;

  AuthLoadingBuilder();

  @override
  void replace(AuthLoading other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthLoading;
  }

  @override
  void update(void Function(AuthLoadingBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthLoading build() {
    final _$result = _$v ?? new _$AuthLoading._();
    replace(_$result);
    return _$result;
  }
}

class _$AuthLoadingFailure extends AuthLoadingFailure {
  factory _$AuthLoadingFailure(
          [void Function(AuthLoadingFailureBuilder) updates]) =>
      (new AuthLoadingFailureBuilder()..update(updates)).build();

  _$AuthLoadingFailure._() : super._();

  @override
  AuthLoadingFailure rebuild(
          void Function(AuthLoadingFailureBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthLoadingFailureBuilder toBuilder() =>
      new AuthLoadingFailureBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthLoadingFailure;
  }

  @override
  int get hashCode {
    return 382407618;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('AuthLoadingFailure').toString();
  }
}

class AuthLoadingFailureBuilder
    implements Builder<AuthLoadingFailure, AuthLoadingFailureBuilder> {
  _$AuthLoadingFailure _$v;

  AuthLoadingFailureBuilder();

  @override
  void replace(AuthLoadingFailure other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthLoadingFailure;
  }

  @override
  void update(void Function(AuthLoadingFailureBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthLoadingFailure build() {
    final _$result = _$v ?? new _$AuthLoadingFailure._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
