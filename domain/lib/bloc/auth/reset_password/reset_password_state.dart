import 'package:built_value/built_value.dart';
import 'package:common_barkibu_dart/viewmodels/auth/auth_data.dart';

part 'reset_password_state.g.dart';

abstract class ResetPasswordState {
  AuthData get authData;

  const ResetPasswordState();
  ResetPasswordState rebuild(void Function(dynamic) updates);
}

abstract class ResetPasswordInitial
    implements Built<ResetPasswordInitial, ResetPasswordInitialBuilder>, ResetPasswordState {
  ResetPasswordInitial._();
  factory ResetPasswordInitial([void Function(ResetPasswordInitialBuilder) updates]) = _$ResetPasswordInitial;
}

abstract class ResetPasswordUpdateSuccess
    implements Built<ResetPasswordUpdateSuccess, ResetPasswordUpdateSuccessBuilder>, ResetPasswordState {
  ResetPasswordUpdateSuccess._();
  factory ResetPasswordUpdateSuccess([void Function(ResetPasswordUpdateSuccessBuilder) updates]) =
      _$ResetPasswordUpdateSuccess;
}

abstract class ResetPasswordSendCodeInProgress
    implements Built<ResetPasswordSendCodeInProgress, ResetPasswordSendCodeInProgressBuilder>, ResetPasswordState {
  ResetPasswordSendCodeInProgress._();
  factory ResetPasswordSendCodeInProgress([void Function(ResetPasswordSendCodeInProgressBuilder) updates]) =
      _$ResetPasswordSendCodeInProgress;
}

abstract class ResetPasswordSendCodeFailure
    implements Built<ResetPasswordSendCodeFailure, ResetPasswordSendCodeFailureBuilder>, ResetPasswordState {
  ResetPasswordSendCodeFailure._();
  factory ResetPasswordSendCodeFailure([void Function(ResetPasswordSendCodeFailureBuilder) updates]) =
      _$ResetPasswordSendCodeFailure;
}

abstract class ResetPasswordSendCodeSuccess
    implements Built<ResetPasswordSendCodeSuccess, ResetPasswordSendCodeSuccessBuilder>, ResetPasswordState {
  ResetPasswordSendCodeSuccess._();
  factory ResetPasswordSendCodeSuccess([void Function(ResetPasswordSendCodeSuccessBuilder) updates]) =
      _$ResetPasswordSendCodeSuccess;
}

abstract class ResetPasswordResetInProgress
    implements Built<ResetPasswordResetInProgress, ResetPasswordResetInProgressBuilder>, ResetPasswordState {
  ResetPasswordResetInProgress._();
  factory ResetPasswordResetInProgress([void Function(ResetPasswordResetInProgressBuilder) updates]) =
      _$ResetPasswordResetInProgress;
}

abstract class ResetPasswordResetSuccess
    implements Built<ResetPasswordResetSuccess, ResetPasswordResetSuccessBuilder>, ResetPasswordState {
  ResetPasswordResetSuccess._();
  factory ResetPasswordResetSuccess([void Function(ResetPasswordResetSuccessBuilder) updates]) =
      _$ResetPasswordResetSuccess;
}

abstract class ResetPasswordResetFailure
    implements Built<ResetPasswordResetFailure, ResetPasswordResetFailureBuilder>, ResetPasswordState {
  ResetPasswordResetFailure._();
  factory ResetPasswordResetFailure([void Function(ResetPasswordResetFailureBuilder) updates]) =
      _$ResetPasswordResetFailure;
}
