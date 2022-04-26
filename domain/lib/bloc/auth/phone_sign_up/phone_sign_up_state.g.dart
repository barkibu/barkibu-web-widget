// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_sign_up_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PhoneSignUpInitial extends PhoneSignUpInitial {
  factory _$PhoneSignUpInitial(
          [void Function(PhoneSignUpInitialBuilder) updates]) =>
      (new PhoneSignUpInitialBuilder()..update(updates)).build();

  _$PhoneSignUpInitial._() : super._();

  @override
  PhoneSignUpInitial rebuild(
          void Function(PhoneSignUpInitialBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignUpInitialBuilder toBuilder() =>
      new PhoneSignUpInitialBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignUpInitial;
  }

  @override
  int get hashCode {
    return 648960723;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('PhoneSignUpInitial').toString();
  }
}

class PhoneSignUpInitialBuilder
    implements Builder<PhoneSignUpInitial, PhoneSignUpInitialBuilder> {
  _$PhoneSignUpInitial _$v;

  PhoneSignUpInitialBuilder();

  @override
  void replace(PhoneSignUpInitial other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignUpInitial;
  }

  @override
  void update(void Function(PhoneSignUpInitialBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignUpInitial build() {
    final _$result = _$v ?? new _$PhoneSignUpInitial._();
    replace(_$result);
    return _$result;
  }
}

class _$PhoneSignUpCodeSendInProgress extends PhoneSignUpCodeSendInProgress {
  factory _$PhoneSignUpCodeSendInProgress(
          [void Function(PhoneSignUpCodeSendInProgressBuilder) updates]) =>
      (new PhoneSignUpCodeSendInProgressBuilder()..update(updates)).build();

  _$PhoneSignUpCodeSendInProgress._() : super._();

  @override
  PhoneSignUpCodeSendInProgress rebuild(
          void Function(PhoneSignUpCodeSendInProgressBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignUpCodeSendInProgressBuilder toBuilder() =>
      new PhoneSignUpCodeSendInProgressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignUpCodeSendInProgress;
  }

  @override
  int get hashCode {
    return 366527215;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('PhoneSignUpCodeSendInProgress')
        .toString();
  }
}

class PhoneSignUpCodeSendInProgressBuilder
    implements
        Builder<PhoneSignUpCodeSendInProgress,
            PhoneSignUpCodeSendInProgressBuilder> {
  _$PhoneSignUpCodeSendInProgress _$v;

  PhoneSignUpCodeSendInProgressBuilder();

  @override
  void replace(PhoneSignUpCodeSendInProgress other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignUpCodeSendInProgress;
  }

  @override
  void update(void Function(PhoneSignUpCodeSendInProgressBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignUpCodeSendInProgress build() {
    final _$result = _$v ?? new _$PhoneSignUpCodeSendInProgress._();
    replace(_$result);
    return _$result;
  }
}

class _$PhoneSignUpCodeSendFailure extends PhoneSignUpCodeSendFailure {
  @override
  final PhoneSignUpOperationErrorType errorType;
  @override
  final String errorMessage;

  factory _$PhoneSignUpCodeSendFailure(
          [void Function(PhoneSignUpCodeSendFailureBuilder) updates]) =>
      (new PhoneSignUpCodeSendFailureBuilder()..update(updates)).build();

  _$PhoneSignUpCodeSendFailure._({this.errorType, this.errorMessage})
      : super._() {
    if (errorType == null) {
      throw new BuiltValueNullFieldError(
          'PhoneSignUpCodeSendFailure', 'errorType');
    }
  }

  @override
  PhoneSignUpCodeSendFailure rebuild(
          void Function(PhoneSignUpCodeSendFailureBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignUpCodeSendFailureBuilder toBuilder() =>
      new PhoneSignUpCodeSendFailureBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignUpCodeSendFailure &&
        errorType == other.errorType &&
        errorMessage == other.errorMessage;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, errorType.hashCode), errorMessage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PhoneSignUpCodeSendFailure')
          ..add('errorType', errorType)
          ..add('errorMessage', errorMessage))
        .toString();
  }
}

class PhoneSignUpCodeSendFailureBuilder
    implements
        Builder<PhoneSignUpCodeSendFailure, PhoneSignUpCodeSendFailureBuilder> {
  _$PhoneSignUpCodeSendFailure _$v;

  PhoneSignUpOperationErrorType _errorType;
  PhoneSignUpOperationErrorType get errorType => _$this._errorType;
  set errorType(PhoneSignUpOperationErrorType errorType) =>
      _$this._errorType = errorType;

  String _errorMessage;
  String get errorMessage => _$this._errorMessage;
  set errorMessage(String errorMessage) => _$this._errorMessage = errorMessage;

  PhoneSignUpCodeSendFailureBuilder();

  PhoneSignUpCodeSendFailureBuilder get _$this {
    if (_$v != null) {
      _errorType = _$v.errorType;
      _errorMessage = _$v.errorMessage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhoneSignUpCodeSendFailure other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignUpCodeSendFailure;
  }

  @override
  void update(void Function(PhoneSignUpCodeSendFailureBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignUpCodeSendFailure build() {
    final _$result = _$v ??
        new _$PhoneSignUpCodeSendFailure._(
            errorType: errorType, errorMessage: errorMessage);
    replace(_$result);
    return _$result;
  }
}

class _$PhoneSignUpCodeSendSuccess extends PhoneSignUpCodeSendSuccess {
  factory _$PhoneSignUpCodeSendSuccess(
          [void Function(PhoneSignUpCodeSendSuccessBuilder) updates]) =>
      (new PhoneSignUpCodeSendSuccessBuilder()..update(updates)).build();

  _$PhoneSignUpCodeSendSuccess._() : super._();

  @override
  PhoneSignUpCodeSendSuccess rebuild(
          void Function(PhoneSignUpCodeSendSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignUpCodeSendSuccessBuilder toBuilder() =>
      new PhoneSignUpCodeSendSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignUpCodeSendSuccess;
  }

  @override
  int get hashCode {
    return 272010649;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('PhoneSignUpCodeSendSuccess').toString();
  }
}

class PhoneSignUpCodeSendSuccessBuilder
    implements
        Builder<PhoneSignUpCodeSendSuccess, PhoneSignUpCodeSendSuccessBuilder> {
  _$PhoneSignUpCodeSendSuccess _$v;

  PhoneSignUpCodeSendSuccessBuilder();

  @override
  void replace(PhoneSignUpCodeSendSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignUpCodeSendSuccess;
  }

  @override
  void update(void Function(PhoneSignUpCodeSendSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignUpCodeSendSuccess build() {
    final _$result = _$v ?? new _$PhoneSignUpCodeSendSuccess._();
    replace(_$result);
    return _$result;
  }
}

class _$PhoneSignUpVerificationInProgress
    extends PhoneSignUpVerificationInProgress {
  factory _$PhoneSignUpVerificationInProgress(
          [void Function(PhoneSignUpVerificationInProgressBuilder) updates]) =>
      (new PhoneSignUpVerificationInProgressBuilder()..update(updates)).build();

  _$PhoneSignUpVerificationInProgress._() : super._();

  @override
  PhoneSignUpVerificationInProgress rebuild(
          void Function(PhoneSignUpVerificationInProgressBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignUpVerificationInProgressBuilder toBuilder() =>
      new PhoneSignUpVerificationInProgressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignUpVerificationInProgress;
  }

  @override
  int get hashCode {
    return 204664640;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('PhoneSignUpVerificationInProgress')
        .toString();
  }
}

class PhoneSignUpVerificationInProgressBuilder
    implements
        Builder<PhoneSignUpVerificationInProgress,
            PhoneSignUpVerificationInProgressBuilder> {
  _$PhoneSignUpVerificationInProgress _$v;

  PhoneSignUpVerificationInProgressBuilder();

  @override
  void replace(PhoneSignUpVerificationInProgress other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignUpVerificationInProgress;
  }

  @override
  void update(void Function(PhoneSignUpVerificationInProgressBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignUpVerificationInProgress build() {
    final _$result = _$v ?? new _$PhoneSignUpVerificationInProgress._();
    replace(_$result);
    return _$result;
  }
}

class _$PhoneSignUpVerificationFailure extends PhoneSignUpVerificationFailure {
  @override
  final PhoneSignUpOperationErrorType errorType;
  @override
  final String errorMessage;

  factory _$PhoneSignUpVerificationFailure(
          [void Function(PhoneSignUpVerificationFailureBuilder) updates]) =>
      (new PhoneSignUpVerificationFailureBuilder()..update(updates)).build();

  _$PhoneSignUpVerificationFailure._({this.errorType, this.errorMessage})
      : super._() {
    if (errorType == null) {
      throw new BuiltValueNullFieldError(
          'PhoneSignUpVerificationFailure', 'errorType');
    }
  }

  @override
  PhoneSignUpVerificationFailure rebuild(
          void Function(PhoneSignUpVerificationFailureBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignUpVerificationFailureBuilder toBuilder() =>
      new PhoneSignUpVerificationFailureBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignUpVerificationFailure &&
        errorType == other.errorType &&
        errorMessage == other.errorMessage;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, errorType.hashCode), errorMessage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PhoneSignUpVerificationFailure')
          ..add('errorType', errorType)
          ..add('errorMessage', errorMessage))
        .toString();
  }
}

class PhoneSignUpVerificationFailureBuilder
    implements
        Builder<PhoneSignUpVerificationFailure,
            PhoneSignUpVerificationFailureBuilder> {
  _$PhoneSignUpVerificationFailure _$v;

  PhoneSignUpOperationErrorType _errorType;
  PhoneSignUpOperationErrorType get errorType => _$this._errorType;
  set errorType(PhoneSignUpOperationErrorType errorType) =>
      _$this._errorType = errorType;

  String _errorMessage;
  String get errorMessage => _$this._errorMessage;
  set errorMessage(String errorMessage) => _$this._errorMessage = errorMessage;

  PhoneSignUpVerificationFailureBuilder();

  PhoneSignUpVerificationFailureBuilder get _$this {
    if (_$v != null) {
      _errorType = _$v.errorType;
      _errorMessage = _$v.errorMessage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhoneSignUpVerificationFailure other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignUpVerificationFailure;
  }

  @override
  void update(void Function(PhoneSignUpVerificationFailureBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignUpVerificationFailure build() {
    final _$result = _$v ??
        new _$PhoneSignUpVerificationFailure._(
            errorType: errorType, errorMessage: errorMessage);
    replace(_$result);
    return _$result;
  }
}

class _$PhoneSignUpVerificationSuccess extends PhoneSignUpVerificationSuccess {
  factory _$PhoneSignUpVerificationSuccess(
          [void Function(PhoneSignUpVerificationSuccessBuilder) updates]) =>
      (new PhoneSignUpVerificationSuccessBuilder()..update(updates)).build();

  _$PhoneSignUpVerificationSuccess._() : super._();

  @override
  PhoneSignUpVerificationSuccess rebuild(
          void Function(PhoneSignUpVerificationSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignUpVerificationSuccessBuilder toBuilder() =>
      new PhoneSignUpVerificationSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignUpVerificationSuccess;
  }

  @override
  int get hashCode {
    return 776287852;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('PhoneSignUpVerificationSuccess')
        .toString();
  }
}

class PhoneSignUpVerificationSuccessBuilder
    implements
        Builder<PhoneSignUpVerificationSuccess,
            PhoneSignUpVerificationSuccessBuilder> {
  _$PhoneSignUpVerificationSuccess _$v;

  PhoneSignUpVerificationSuccessBuilder();

  @override
  void replace(PhoneSignUpVerificationSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignUpVerificationSuccess;
  }

  @override
  void update(void Function(PhoneSignUpVerificationSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignUpVerificationSuccess build() {
    final _$result = _$v ?? new _$PhoneSignUpVerificationSuccess._();
    replace(_$result);
    return _$result;
  }
}

class _$PhoneSignUpValidationFailure extends PhoneSignUpValidationFailure {
  factory _$PhoneSignUpValidationFailure(
          [void Function(PhoneSignUpValidationFailureBuilder) updates]) =>
      (new PhoneSignUpValidationFailureBuilder()..update(updates)).build();

  _$PhoneSignUpValidationFailure._() : super._();

  @override
  PhoneSignUpValidationFailure rebuild(
          void Function(PhoneSignUpValidationFailureBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneSignUpValidationFailureBuilder toBuilder() =>
      new PhoneSignUpValidationFailureBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneSignUpValidationFailure;
  }

  @override
  int get hashCode {
    return 612826976;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('PhoneSignUpValidationFailure')
        .toString();
  }
}

class PhoneSignUpValidationFailureBuilder
    implements
        Builder<PhoneSignUpValidationFailure,
            PhoneSignUpValidationFailureBuilder> {
  _$PhoneSignUpValidationFailure _$v;

  PhoneSignUpValidationFailureBuilder();

  @override
  void replace(PhoneSignUpValidationFailure other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneSignUpValidationFailure;
  }

  @override
  void update(void Function(PhoneSignUpValidationFailureBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneSignUpValidationFailure build() {
    final _$result = _$v ?? new _$PhoneSignUpValidationFailure._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
