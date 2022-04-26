import 'package:built_value/built_value.dart';
import 'package:common_barkibu_dart/repositories/auth/phone_sign_in_repository.dart';

part 'phone_sign_in_state.g.dart';

abstract class PhoneSignInState {}

abstract class PhoneSignInInitial implements Built<PhoneSignInInitial, PhoneSignInInitialBuilder>, PhoneSignInState {
  PhoneSignInInitial._();
  factory PhoneSignInInitial([void Function(PhoneSignInInitialBuilder) updates]) = _$PhoneSignInInitial;
}

abstract class PhoneSignInCodeSendInProgress
    implements Built<PhoneSignInCodeSendInProgress, PhoneSignInCodeSendInProgressBuilder>, PhoneSignInState {
  PhoneSignInCodeSendInProgress._();
  factory PhoneSignInCodeSendInProgress([void Function(PhoneSignInCodeSendInProgressBuilder) updates]) =
      _$PhoneSignInCodeSendInProgress;
}

abstract class PhoneSignInCodeSendFailure
    implements Built<PhoneSignInCodeSendFailure, PhoneSignInCodeSendFailureBuilder>, PhoneSignInState {
  PhoneSignInOperationErrorType get errorType;
  @nullable
  String get errorMessage;

  PhoneSignInCodeSendFailure._();
  factory PhoneSignInCodeSendFailure([void Function(PhoneSignInCodeSendFailureBuilder) updates]) =
      _$PhoneSignInCodeSendFailure;
}

abstract class PhoneSignInCodeSendSuccess
    implements Built<PhoneSignInCodeSendSuccess, PhoneSignInCodeSendSuccessBuilder>, PhoneSignInState {
  PhoneSignInCodeSendSuccess._();
  factory PhoneSignInCodeSendSuccess([void Function(PhoneSignInCodeSendSuccessBuilder) updates]) =
      _$PhoneSignInCodeSendSuccess;
}

abstract class PhoneSignInVerificationInProgress
    implements Built<PhoneSignInVerificationInProgress, PhoneSignInVerificationInProgressBuilder>, PhoneSignInState {
  PhoneSignInVerificationInProgress._();
  factory PhoneSignInVerificationInProgress([void Function(PhoneSignInVerificationInProgressBuilder) updates]) =
      _$PhoneSignInVerificationInProgress;
}

abstract class PhoneSignInVerificationFailure
    implements Built<PhoneSignInVerificationFailure, PhoneSignInVerificationFailureBuilder>, PhoneSignInState {
  PhoneSignInOperationErrorType get errorType;
  @nullable
  String get errorMessage;

  PhoneSignInVerificationFailure._();
  factory PhoneSignInVerificationFailure([void Function(PhoneSignInVerificationFailureBuilder) updates]) =
      _$PhoneSignInVerificationFailure;
}

abstract class PhoneSignInVerificationSuccess
    implements Built<PhoneSignInVerificationSuccess, PhoneSignInVerificationSuccessBuilder>, PhoneSignInState {
  PhoneSignInVerificationSuccess._();
  factory PhoneSignInVerificationSuccess([void Function(PhoneSignInVerificationSuccessBuilder) updates]) =
      _$PhoneSignInVerificationSuccess;
}

abstract class PhoneSignInValidationFailure
    implements Built<PhoneSignInValidationFailure, PhoneSignInValidationFailureBuilder>, PhoneSignInState {
  PhoneSignInValidationFailure._();
  factory PhoneSignInValidationFailure([void Function(PhoneSignInValidationFailureBuilder) updates]) =
      _$PhoneSignInValidationFailure;
}
