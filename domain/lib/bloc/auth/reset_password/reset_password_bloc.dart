import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/bloc/auth/sign_in/sign_in_bloc.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/domain/auth/reset_password_use_case.dart';
import 'package:common_barkibu_dart/services/analytics_service.dart';
import 'package:common_barkibu_dart/viewmodels/auth/auth_data.dart';

import 'reset_password_event.dart';
import 'reset_password_state.dart';

export 'reset_password_event.dart';
export 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AnalyticsService _analyticsService;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final SignInBloc _signInBloc;

  ResetPasswordBloc(this._resetPasswordUseCase, this._signInBloc, this._analyticsService);

  @override
  ResetPasswordState get initialState => ResetPasswordInitial((b) => b..authData = AuthData());

  @override
  Stream<ResetPasswordState> mapEventToState(ResetPasswordEvent event) async* {
    if (event is ResetPasswordStarted) {
      final authData = _rebuildAuthData(state.authData, email: event.email);
      yield ResetPasswordUpdateSuccess((b) => b..authData = authData);
      _analyticsService.screen.logResetPassword();
    }

    if (event is ResetPasswordCodeSent) {
      yield ResetPasswordSendCodeInProgress((builder) => builder..authData = state.authData);
      final authData = state.authData;
      if (await _resetPasswordUseCase.sendEmail(authData.email)) {
        yield ResetPasswordSendCodeSuccess((builder) => builder..authData = authData);
      } else {
        yield ResetPasswordSendCodeFailure((builder) => builder..authData = authData);
      }
    }

    if (event is ResetPasswordPasswordChanged) {
      final nextAuthData = _rebuildAuthData(state.authData, password: event.password);
      yield ResetPasswordUpdateSuccess((builder) => builder..authData = nextAuthData);
    }

    if (event is ResetPasswordPasswordRepeatChanged) {
      final nextAuthData = _rebuildAuthData(state.authData, passwordRepeat: event.passwordRepeat);
      yield ResetPasswordUpdateSuccess((builder) => builder..authData = nextAuthData);
    }

    if (event is ResetPasswordCodeChanged) {
      final nextAuthData = _rebuildAuthData(state.authData, code: event.code);
      yield ResetPasswordUpdateSuccess((builder) => builder..authData = nextAuthData);
    }

    if (event is ResetPasswordSubmitted) {
      final authData = state.authData;
      yield ResetPasswordResetInProgress((builder) => builder..authData = authData);

      if (await _resetPasswordUseCase.resetPassword(authData)) {
        _signInBloc.add(SingInSignInSubmitted(((b) => b
          ..email = authData.email
          ..password = authData.password)));
        yield ResetPasswordResetSuccess((builder) => builder..authData = authData);
      } else {
        yield ResetPasswordResetFailure((builder) => builder..authData = authData);
      }
    }
  }

  AuthData _rebuildAuthData(AuthData authData, {String email, String password, String passwordRepeat, String code}) {
    return AuthData(
        email: email ?? authData.email,
        password: password ?? authData.password,
        passwordRepeat: passwordRepeat ?? authData.passwordRepeat,
        code: code ?? authData.code);
  }
}
