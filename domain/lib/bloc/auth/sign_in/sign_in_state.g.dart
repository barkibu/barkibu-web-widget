// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SignInInitial extends SignInInitial {
  factory _$SignInInitial([void Function(SignInInitialBuilder) updates]) =>
      (new SignInInitialBuilder()..update(updates)).build();

  _$SignInInitial._() : super._();

  @override
  SignInInitial rebuild(void Function(SignInInitialBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignInInitialBuilder toBuilder() => new SignInInitialBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignInInitial;
  }

  @override
  int get hashCode {
    return 127173137;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('SignInInitial').toString();
  }
}

class SignInInitialBuilder
    implements Builder<SignInInitial, SignInInitialBuilder> {
  _$SignInInitial _$v;

  SignInInitialBuilder();

  @override
  void replace(SignInInitial other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignInInitial;
  }

  @override
  void update(void Function(SignInInitialBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignInInitial build() {
    final _$result = _$v ?? new _$SignInInitial._();
    replace(_$result);
    return _$result;
  }
}

class _$SignInLoading extends SignInLoading {
  factory _$SignInLoading([void Function(SignInLoadingBuilder) updates]) =>
      (new SignInLoadingBuilder()..update(updates)).build();

  _$SignInLoading._() : super._();

  @override
  SignInLoading rebuild(void Function(SignInLoadingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignInLoadingBuilder toBuilder() => new SignInLoadingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignInLoading;
  }

  @override
  int get hashCode {
    return 1070067214;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('SignInLoading').toString();
  }
}

class SignInLoadingBuilder
    implements Builder<SignInLoading, SignInLoadingBuilder> {
  _$SignInLoading _$v;

  SignInLoadingBuilder();

  @override
  void replace(SignInLoading other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignInLoading;
  }

  @override
  void update(void Function(SignInLoadingBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignInLoading build() {
    final _$result = _$v ?? new _$SignInLoading._();
    replace(_$result);
    return _$result;
  }
}

class _$SignInFailure extends SignInFailure {
  @override
  final String error;

  factory _$SignInFailure([void Function(SignInFailureBuilder) updates]) =>
      (new SignInFailureBuilder()..update(updates)).build();

  _$SignInFailure._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('SignInFailure', 'error');
    }
  }

  @override
  SignInFailure rebuild(void Function(SignInFailureBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignInFailureBuilder toBuilder() => new SignInFailureBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignInFailure && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignInFailure')..add('error', error))
        .toString();
  }
}

class SignInFailureBuilder
    implements Builder<SignInFailure, SignInFailureBuilder> {
  _$SignInFailure _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  SignInFailureBuilder();

  SignInFailureBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignInFailure other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignInFailure;
  }

  @override
  void update(void Function(SignInFailureBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignInFailure build() {
    final _$result = _$v ?? new _$SignInFailure._(error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
