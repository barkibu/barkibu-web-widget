// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_sign_in_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PhoneSignInInitial extends PhoneSignInInitial {
  factory _$PhoneSignInInitial(
          [void Function(PhoneSignInInitialBuilder) updates]) =>
      (new PhoneSignInInitialBuilder()..update(updates)).build();

  _$PhoneSignInInitial._() : super._();

  @override
  PhoneSignInInitial rebuild(
          void Function(PhoneSignInInitialBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignInInitialBuilder toBuilder() =>
      new PhoneSignInInitialBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignInInitial;
  }

  @override
  int get hashCode {
    return 149769495;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('PhoneSignInInitial').toString();
  }
}

class PhoneSignInInitialBuilder
    implements Builder<PhoneSignInInitial, PhoneSignInInitialBuilder> {
  _$PhoneSignInInitial _$v;

  PhoneSignInInitialBuilder();

  @override
  void replace(PhoneSignInInitial other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignInInitial;
  }

  @override
  void update(void Function(PhoneSignInInitialBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignInInitial build() {
    final _$result = _$v ?? new _$PhoneSignInInitial._();
    replace(_$result);
    return _$result;
  }
}

class _$PhoneSignInCodeSendInProgress extends PhoneSignInCodeSendInProgress {
  factory _$PhoneSignInCodeSendInProgress(
          [void Function(PhoneSignInCodeSendInProgressBuilder) updates]) =>
      (new PhoneSignInCodeSendInProgressBuilder()..update(updates)).build();

  _$PhoneSignInCodeSendInProgress._() : super._();

  @override
  PhoneSignInCodeSendInProgress rebuild(
          void Function(PhoneSignInCodeSendInProgressBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignInCodeSendInProgressBuilder toBuilder() =>
      new PhoneSignInCodeSendInProgressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignInCodeSendInProgress;
  }

  @override
  int get hashCode {
    return 772985429;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('PhoneSignInCodeSendInProgress')
        .toString();
  }
}

class PhoneSignInCodeSendInProgressBuilder
    implements
        Builder<PhoneSignInCodeSendInProgress,
            PhoneSignInCodeSendInProgressBuilder> {
  _$PhoneSignInCodeSendInProgress _$v;

  PhoneSignInCodeSendInProgressBuilder();

  @override
  void replace(PhoneSignInCodeSendInProgress other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignInCodeSendInProgress;
  }

  @override
  void update(void Function(PhoneSignInCodeSendInProgressBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignInCodeSendInProgress build() {
    final _$result = _$v ?? new _$PhoneSignInCodeSendInProgress._();
    replace(_$result);
    return _$result;
  }
}

class _$PhoneSignInCodeSendFailure extends PhoneSignInCodeSendFailure {
  @override
  final PhoneSignInOperationErrorType errorType;
  @override
  final String errorMessage;

  factory _$PhoneSignInCodeSendFailure(
          [void Function(PhoneSignInCodeSendFailureBuilder) updates]) =>
      (new PhoneSignInCodeSendFailureBuilder()..update(updates)).build();

  _$PhoneSignInCodeSendFailure._({this.errorType, this.errorMessage})
      : super._() {
    if (errorType == null) {
      throw new BuiltValueNullFieldError(
          'PhoneSignInCodeSendFailure', 'errorType');
    }
  }

  @override
  PhoneSignInCodeSendFailure rebuild(
          void Function(PhoneSignInCodeSendFailureBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignInCodeSendFailureBuilder toBuilder() =>
      new PhoneSignInCodeSendFailureBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignInCodeSendFailure &&
        errorType == other.errorType &&
        errorMessage == other.errorMessage;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, errorType.hashCode), errorMessage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PhoneSignInCodeSendFailure')
          ..add('errorType', errorType)
          ..add('errorMessage', errorMessage))
        .toString();
  }
}

class PhoneSignInCodeSendFailureBuilder
    implements
        Builder<PhoneSignInCodeSendFailure, PhoneSignInCodeSendFailureBuilder> {
  _$PhoneSignInCodeSendFailure _$v;

  PhoneSignInOperationErrorType _errorType;
  PhoneSignInOperationErrorType get errorType => _$this._errorType;
  set errorType(PhoneSignInOperationErrorType errorType) =>
      _$this._errorType = errorType;

  String _errorMessage;
  String get errorMessage => _$this._errorMessage;
  set errorMessage(String errorMessage) => _$this._errorMessage = errorMessage;

  PhoneSignInCodeSendFailureBuilder();

  PhoneSignInCodeSendFailureBuilder get _$this {
    if (_$v != null) {
      _errorType = _$v.errorType;
      _errorMessage = _$v.errorMessage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhoneSignInCodeSendFailure other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignInCodeSendFailure;
  }

  @override
  void update(void Function(PhoneSignInCodeSendFailureBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignInCodeSendFailure build() {
    final _$result = _$v ??
        new _$PhoneSignInCodeSendFailure._(
            errorType: errorType, errorMessage: errorMessage);
    replace(_$result);
    return _$result;
  }
}

class _$PhoneSignInCodeSendSuccess extends PhoneSignInCodeSendSuccess {
  factory _$PhoneSignInCodeSendSuccess(
          [void Function(PhoneSignInCodeSendSuccessBuilder) updates]) =>
      (new PhoneSignInCodeSendSuccessBuilder()..update(updates)).build();

  _$PhoneSignInCodeSendSuccess._() : super._();

  @override
  PhoneSignInCodeSendSuccess rebuild(
          void Function(PhoneSignInCodeSendSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignInCodeSendSuccessBuilder toBuilder() =>
      new PhoneSignInCodeSendSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignInCodeSendSuccess;
  }

  @override
  int get hashCode {
    return 859599796;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('PhoneSignInCodeSendSuccess').toString();
  }
}

class PhoneSignInCodeSendSuccessBuilder
    implements
        Builder<PhoneSignInCodeSendSuccess, PhoneSignInCodeSendSuccessBuilder> {
  _$PhoneSignInCodeSendSuccess _$v;

  PhoneSignInCodeSendSuccessBuilder();

  @override
  void replace(PhoneSignInCodeSendSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignInCodeSendSuccess;
  }

  @override
  void update(void Function(PhoneSignInCodeSendSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignInCodeSendSuccess build() {
    final _$result = _$v ?? new _$PhoneSignInCodeSendSuccess._();
    replace(_$result);
    return _$result;
  }
}

class _$PhoneSignInVerificationInProgress
    extends PhoneSignInVerificationInProgress {
  factory _$PhoneSignInVerificationInProgress(
          [void Function(PhoneSignInVerificationInProgressBuilder) updates]) =>
      (new PhoneSignInVerificationInProgressBuilder()..update(updates)).build();

  _$PhoneSignInVerificationInProgress._() : super._();

  @override
  PhoneSignInVerificationInProgress rebuild(
          void Function(PhoneSignInVerificationInProgressBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignInVerificationInProgressBuilder toBuilder() =>
      new PhoneSignInVerificationInProgressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignInVerificationInProgress;
  }

  @override
  int get hashCode {
    return 557881774;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('PhoneSignInVerificationInProgress')
        .toString();
  }
}

class PhoneSignInVerificationInProgressBuilder
    implements
        Builder<PhoneSignInVerificationInProgress,
            PhoneSignInVerificationInProgressBuilder> {
  _$PhoneSignInVerificationInProgress _$v;

  PhoneSignInVerificationInProgressBuilder();

  @override
  void replace(PhoneSignInVerificationInProgress other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignInVerificationInProgress;
  }

  @override
  void update(void Function(PhoneSignInVerificationInProgressBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignInVerificationInProgress build() {
    final _$result = _$v ?? new _$PhoneSignInVerificationInProgress._();
    replace(_$result);
    return _$result;
  }
}

class _$PhoneSignInVerificationFailure extends PhoneSignInVerificationFailure {
  @override
  final PhoneSignInOperationErrorType errorType;
  @override
  final String errorMessage;

  factory _$PhoneSignInVerificationFailure(
          [void Function(PhoneSignInVerificationFailureBuilder) updates]) =>
      (new PhoneSignInVerificationFailureBuilder()..update(updates)).build();

  _$PhoneSignInVerificationFailure._({this.errorType, this.errorMessage})
      : super._() {
    if (errorType == null) {
      throw new BuiltValueNullFieldError(
          'PhoneSignInVerificationFailure', 'errorType');
    }
  }

  @override
  PhoneSignInVerificationFailure rebuild(
          void Function(PhoneSignInVerificationFailureBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignInVerificationFailureBuilder toBuilder() =>
      new PhoneSignInVerificationFailureBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignInVerificationFailure &&
        errorType == other.errorType &&
        errorMessage == other.errorMessage;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, errorType.hashCode), errorMessage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PhoneSignInVerificationFailure')
          ..add('errorType', errorType)
          ..add('errorMessage', errorMessage))
        .toString();
  }
}

class PhoneSignInVerificationFailureBuilder
    implements
        Builder<PhoneSignInVerificationFailure,
            PhoneSignInVerificationFailureBuilder> {
  _$PhoneSignInVerificationFailure _$v;

  PhoneSignInOperationErrorType _errorType;
  PhoneSignInOperationErrorType get errorType => _$this._errorType;
  set errorType(PhoneSignInOperationErrorType errorType) =>
      _$this._errorType = errorType;

  String _errorMessage;
  String get errorMessage => _$this._errorMessage;
  set errorMessage(String errorMessage) => _$this._errorMessage = errorMessage;

  PhoneSignInVerificationFailureBuilder();

  PhoneSignInVerificationFailureBuilder get _$this {
    if (_$v != null) {
      _errorType = _$v.errorType;
      _errorMessage = _$v.errorMessage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhoneSignInVerificationFailure other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignInVerificationFailure;
  }

  @override
  void update(void Function(PhoneSignInVerificationFailureBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignInVerificationFailure build() {
    final _$result = _$v ??
        new _$PhoneSignInVerificationFailure._(
            errorType: errorType, errorMessage: errorMessage);
    replace(_$result);
    return _$result;
  }
}

class _$PhoneSignInVerificationSuccess extends PhoneSignInVerificationSuccess {
  factory _$PhoneSignInVerificationSuccess(
          [void Function(PhoneSignInVerificationSuccessBuilder) updates]) =>
      (new PhoneSignInVerificationSuccessBuilder()..update(updates)).build();

  _$PhoneSignInVerificationSuccess._() : super._();

  @override
  PhoneSignInVerificationSuccess rebuild(
          void Function(PhoneSignInVerificationSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignInVerificationSuccessBuilder toBuilder() =>
      new PhoneSignInVerificationSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignInVerificationSuccess;
  }

  @override
  int get hashCode {
    return 460418933;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('PhoneSignInVerificationSuccess')
        .toString();
  }
}

class PhoneSignInVerificationSuccessBuilder
    implements
        Builder<PhoneSignInVerificationSuccess,
            PhoneSignInVerificationSuccessBuilder> {
  _$PhoneSignInVerificationSuccess _$v;

  PhoneSignInVerificationSuccessBuilder();

  @override
  void replace(PhoneSignInVerificationSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignInVerificationSuccess;
  }

  @override
  void update(void Function(PhoneSignInVerificationSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignInVerificationSuccess build() {
    final _$result = _$v ?? new _$PhoneSignInVerificationSuccess._();
    replace(_$result);
    return _$result;
  }
}

class _$PhoneSignInValidationFailure extends PhoneSignInValidationFailure {
  factory _$PhoneSignInValidationFailure(
          [void Function(PhoneSignInValidationFailureBuilder) updates]) =>
      (new PhoneSignInValidationFailureBuilder()..update(updates)).build();

  _$PhoneSignInValidationFailure._() : super._();

  @override
  PhoneSignInValidationFailure rebuild(
          void Function(PhoneSignInValidationFailureBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignInValidationFailureBuilder toBuilder() =>
      new PhoneSignInValidationFailureBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignInValidationFailure;
  }

  @override
  int get hashCode {
    return 412199535;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('PhoneSignInValidationFailure')
        .toString();
  }
}

class PhoneSignInValidationFailureBuilder
    implements
        Builder<PhoneSignInValidationFailure,
            PhoneSignInValidationFailureBuilder> {
  _$PhoneSignInValidationFailure _$v;

  PhoneSignInValidationFailureBuilder();

  @override
  void replace(PhoneSignInValidationFailure other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignInValidationFailure;
  }

  @override
  void update(void Function(PhoneSignInValidationFailureBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignInValidationFailure build() {
    final _$result = _$v ?? new _$PhoneSignInValidationFailure._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
