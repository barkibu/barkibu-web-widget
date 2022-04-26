// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SignUpInitial extends SignUpInitial {
  factory _$SignUpInitial([void Function(SignUpInitialBuilder) updates]) =>
      (new SignUpInitialBuilder()..update(updates)).build();

  _$SignUpInitial._() : super._();

  @override
  SignUpInitial rebuild(void Function(SignUpInitialBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignUpInitialBuilder toBuilder() => new SignUpInitialBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignUpInitial;
  }

  @override
  int get hashCode {
    return 488654859;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('SignUpInitial').toString();
  }
}

class SignUpInitialBuilder
    implements Builder<SignUpInitial, SignUpInitialBuilder> {
  _$SignUpInitial _$v;

  SignUpInitialBuilder();

  @override
  void replace(SignUpInitial other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignUpInitial;
  }

  @override
  void update(void Function(SignUpInitialBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignUpInitial build() {
    final _$result = _$v ?? new _$SignUpInitial._();
    replace(_$result);
    return _$result;
  }
}

class _$SignUpLoading extends SignUpLoading {
  factory _$SignUpLoading([void Function(SignUpLoadingBuilder) updates]) =>
      (new SignUpLoadingBuilder()..update(updates)).build();

  _$SignUpLoading._() : super._();

  @override
  SignUpLoading rebuild(void Function(SignUpLoadingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignUpLoadingBuilder toBuilder() => new SignUpLoadingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignUpLoading;
  }

  @override
  int get hashCode {
    return 18319919;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('SignUpLoading').toString();
  }
}

class SignUpLoadingBuilder
    implements Builder<SignUpLoading, SignUpLoadingBuilder> {
  _$SignUpLoading _$v;

  SignUpLoadingBuilder();

  @override
  void replace(SignUpLoading other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignUpLoading;
  }

  @override
  void update(void Function(SignUpLoadingBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignUpLoading build() {
    final _$result = _$v ?? new _$SignUpLoading._();
    replace(_$result);
    return _$result;
  }
}

class _$SignUpFailure extends SignUpFailure {
  @override
  final String error;

  factory _$SignUpFailure([void Function(SignUpFailureBuilder) updates]) =>
      (new SignUpFailureBuilder()..update(updates)).build();

  _$SignUpFailure._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('SignUpFailure', 'error');
    }
  }

  @override
  SignUpFailure rebuild(void Function(SignUpFailureBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignUpFailureBuilder toBuilder() => new SignUpFailureBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignUpFailure && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignUpFailure')..add('error', error))
        .toString();
  }
}

class SignUpFailureBuilder
    implements Builder<SignUpFailure, SignUpFailureBuilder> {
  _$SignUpFailure _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  SignUpFailureBuilder();

  SignUpFailureBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignUpFailure other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignUpFailure;
  }

  @override
  void update(void Function(SignUpFailureBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignUpFailure build() {
    final _$result = _$v ?? new _$SignUpFailure._(error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
