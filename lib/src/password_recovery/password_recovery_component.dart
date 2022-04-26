import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:common_barkibu_dart/bloc/bloc.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/viewmodels/auth/auth_data.dart';

import 'package:web_widget/src/routes.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/navigation/auth_redirect_component.dart';
import 'package:web_widget/src/alerts/alert_component.dart';

ResetPasswordBloc resetPasswordBlocFactory(AuthBloc authBloc) =>
    ServiceLocator.container<ResetPasswordBloc>(param1: authBloc);

@Component(selector: 'password-recovery', templateUrl: 'password_recovery_component.html', styleUrls: [
  'password_recovery_component.css'
], directives: [
  coreDirectives,
  routerDirectives,
  formDirectives,
  WidgetButtonComponent,
  layoutDirectives,
  GoBackComponent,
  AuthRedirectComponent,
  AlertComponent
], providers: [
  FactoryProvider(ResetPasswordBloc, resetPasswordBlocFactory)
], exports: [
  RoutePaths
])
class PasswordRecoveryComponent implements OnInit, OnDestroy {
  final ResetPasswordBloc resetPasswordBloc;
  bool codeSent = false;
  AuthData authData = AuthData();
  ResetPasswordState blocState;
  MessagesModel messages;
  StreamSubscription passwordResetBlocSubscription;

  PasswordRecoveryComponent(this.resetPasswordBloc, this.messages);

  @override
  void ngOnInit() {
    passwordResetBlocSubscription = resetPasswordBloc.listen(resetPasswordBlocHandler);
  }

  @override
  void ngOnDestroy() {
    passwordResetBlocSubscription.cancel();
    resetPasswordBloc.close();
  }

  void resetPasswordBlocHandler(ResetPasswordState state) {
    blocState = state;
    if (state is ResetPasswordSendCodeSuccess) {
      codeSent = true;
    }
  }

  void resetCodeSent(_) {
    codeSent = false;
    authData = AuthData();
  }

  void sendResetCode() {
    resetPasswordBloc.add(ResetPasswordStarted((b) => b.email = authData.email));
    resetPasswordBloc.add(ResetPasswordCodeSent());
  }

  void resetPassword() {
    resetPasswordBloc.add(ResetPasswordPasswordChanged((b) => b..password = authData.password));
    resetPasswordBloc.add(ResetPasswordPasswordRepeatChanged((b) => b..passwordRepeat = authData.passwordRepeat));
    resetPasswordBloc.add(ResetPasswordCodeChanged((b) => b..code = authData.code));
    resetPasswordBloc.add(ResetPasswordSubmitted());
  }

  bool isEmailValid() {
    return !authData.emailIsInvalid();
  }

  bool isResetPasswordValid() {
    return authData.isCodeValid() && !authData.passwordIsInvalid() && !authData.passwordRepeatIsInvalid();
  }

  bool codeSendInProgress() {
    return blocState is ResetPasswordSendCodeInProgress;
  }

  bool codeSendFailed() {
    return blocState is ResetPasswordSendCodeFailure;
  }

  bool codeSendSuccess() {
    return blocState is ResetPasswordSendCodeSuccess;
  }

  bool resetPasswordFailed() {
    return blocState is ResetPasswordResetFailure;
  }

  bool resetPasswordInProgress() {
    return blocState is ResetPasswordResetInProgress;
  }
}
