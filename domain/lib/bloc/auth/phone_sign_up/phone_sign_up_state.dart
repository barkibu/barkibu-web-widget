import 'package:built_value/built_value.dart';
import 'package:common_barkibu_dart/repositories/auth/phone_sign_up_repository.dart';

part 'phone_sign_up_state.g.dart';

abstract class PhoneSignUpState {}

abstract class PhoneSignUpInitial implements Built<PhoneSignUpInitial, PhoneSignUpInitialBuilder>, PhoneSignUpState {
  PhoneSignUpInitial._();
  factory PhoneSignUpInitial([void Function(PhoneSignUpInitialBuilder) updates]) = _$PhoneSignUpInitial;
}

abstract class PhoneSignUpCodeSendInProgress
    implements Built<PhoneSignUpCodeSendInProgress, PhoneSignUpCodeSendInProgressBuilder>, PhoneSignUpState {
  PhoneSignUpCodeSendInProgress._();
  factory PhoneSignUpCodeSendInProgress([void Function(PhoneSignUpCodeSendInProgressBuilder) updates]) =
      _$PhoneSignUpCodeSendInProgress;
}

abstract class PhoneSignUpCodeSendFailure
    implements Built<PhoneSignUpCodeSendFailure, PhoneSignUpCodeSendFailureBuilder>, PhoneSignUpState {
  PhoneSignUpOperationErrorType get errorType;
  @nullable
  String get errorMessage;

  PhoneSignUpCodeSendFailure._();
  factory PhoneSignUpCodeSendFailure([void Function(PhoneSignUpCodeSendFailureBuilder) updates]) =
      _$PhoneSignUpCodeSendFailure;
}

abstract class PhoneSignUpCodeSendSuccess
    implements Built<PhoneSignUpCodeSendSuccess, PhoneSignUpCodeSendSuccessBuilder>, PhoneSignUpState {
  PhoneSignUpCodeSendSuccess._();
  factory PhoneSignUpCodeSendSuccess([void Function(PhoneSignUpCodeSendSuccessBuilder) updates]) =
      _$PhoneSignUpCodeSendSuccess;
}

abstract class PhoneSignUpVerificationInProgress
    implements Built<PhoneSignUpVerificationInProgress, PhoneSignUpVerificationInProgressBuilder>, PhoneSignUpState {
  PhoneSignUpVerificationInProgress._();
  factory PhoneSignUpVerificationInProgress([void Function(PhoneSignUpVerificationInProgressBuilder) updates]) =
      _$PhoneSignUpVerificationInProgress;
}

abstract class PhoneSignUpVerificationFailure
    implements Built<PhoneSignUpVerificationFailure, PhoneSignUpVerificationFailureBuilder>, PhoneSignUpState {
  PhoneSignUpOperationErrorType get errorType;
  @nullable
  String get errorMessage;

  PhoneSignUpVerificationFailure._();
  factory PhoneSignUpVerificationFailure([void Function(PhoneSignUpVerificationFailureBuilder) updates]) =
      _$PhoneSignUpVerificationFailure;
}

abstract class PhoneSignUpVerificationSuccess
    implements Built<PhoneSignUpVerificationSuccess, PhoneSignUpVerificationSuccessBuilder>, PhoneSignUpState {
  PhoneSignUpVerificationSuccess._();
  factory PhoneSignUpVerificationSuccess([void Function(PhoneSignUpVerificationSuccessBuilder) updates]) =
      _$PhoneSignUpVerificationSuccess;
}

abstract class PhoneSignUpValidationFailure
    implements Built<PhoneSignUpValidationFailure, PhoneSignUpValidationFailureBuilder>, PhoneSignUpState {
  PhoneSignUpValidationFailure._();
  factory PhoneSignUpValidationFailure([void Function(PhoneSignUpValidationFailureBuilder) updates]) =
      _$PhoneSignUpValidationFailure;
}
