import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/domain/auth/phone_sign_in_use_case.dart';
import 'package:common_barkibu_dart/repositories/auth/phone_sign_in_repository.dart';
import 'package:common_barkibu_dart/services/analytics/events/access_event_analytics.dart';

import 'phone_sign_in_event.dart';
import 'phone_sign_in_state.dart';

export 'phone_sign_in_event.dart';
export 'phone_sign_in_state.dart';

class PhoneSignInBloc extends Bloc<PhoneSignInEvent, PhoneSignInState> {
  final AuthBloc _authBloc;
  final PhoneSignInUseCase _useCase;
  final AnalyticsService _analyticsService = ServiceLocator.container<AnalyticsService>();
  AuthData _authData = AuthData();

  PhoneSignInBloc(this._useCase, this._authBloc);

  @override
  PhoneSignInState get initialState {
    _analyticsService.event.access.logClickSignIn();
    return PhoneSignInInitial();
  }

  @override
  Stream<PhoneSignInState> mapEventToState(PhoneSignInEvent event) async* {
    if (event is PhoneSignInStarted) {
      _authData = _rebuildAuthData(
        phoneNumber: event.phoneNumber,
        phoneNumberPrefix: event.phoneNumberPrefix,
      );
      yield* _sendVerificationCode();
    }

    if (event is PhoneSignInCodeResendRequested) {
      _analyticsService.event.access.logClickResendCode(EventAccessType.Signin);
      yield* _sendVerificationCode();
    }

    if (event is PhoneSignInCodeEntered) {
      _authData = _rebuildAuthData(code: event.code);
      try {
        if (_authData.isValidForPhoneSignIn()) {
          yield PhoneSignInVerificationInProgress();
          final result = await _useCase.signIn(_authData);
          yield* _processVerificationResult(result);
        } else {
          yield PhoneSignInValidationFailure();
        }
      } catch (error) {
        _analyticsService.event.access.logSignInError();
        yield PhoneSignInVerificationFailure((b) => b
          ..errorType = PhoneSignInOperationErrorType.generalError
          ..errorMessage = error.toString());
      }
    }
  }

  Stream<PhoneSignInState> _sendVerificationCode() async* {
    _analyticsService.event.access.logClickSendCode(EventAccessType.Signin);
    try {
      if (_authData.isValidForPhoneSignInVerification()) {
        yield PhoneSignInCodeSendInProgress();
        final result = await _useCase.sendVerificationCode(_authData);
        yield* _processSendVerificationResult(result);
      } else {
        yield PhoneSignInValidationFailure();
      }
    } catch (error) {
      _analyticsService.event.access.logSignInError();
      yield PhoneSignInCodeSendFailure((b) => b
        ..errorType = PhoneSignInOperationErrorType.generalError
        ..errorMessage = error.toString());
    }
  }

  Stream<PhoneSignInState> _processVerificationResult(PhoneSignInOperationResult result) async* {
    if (result is PhoneSignInOperationSuccess) {
      yield PhoneSignInVerificationSuccess();
      _analyticsService.event.access.logSignInSuccess();
      _authBloc.add(SignedIn((b) => b..token = result.accessToken));
    } else {
      final errorType = (result as PhoneSignInOperationError).errorType;
      _analyticsService.event.access.logSignInError();
      yield PhoneSignInVerificationFailure((b) => b..errorType = errorType);
    }
  }

  Stream<PhoneSignInState> _processSendVerificationResult(PhoneSignInOperationResult result) async* {
    if (result is PhoneSignInOperationSuccess) {
      yield PhoneSignInCodeSendSuccess();
    } else {
      final errorType = (result as PhoneSignInOperationError).errorType;
      _analyticsService.event.access.logSignInError();
      yield PhoneSignInCodeSendFailure((b) => b..errorType = errorType);
    }
  }

  AuthData _rebuildAuthData(
      {String phoneNumber, String phoneNumberPrefix, String firstName, String code, bool checkboxValue}) {
    return AuthData(
        phoneNumber: phoneNumber ?? _authData.phoneNumber,
        phoneNumberPrefix: phoneNumberPrefix ?? _authData.phoneNumberPrefix,
        firstName: firstName ?? _authData.firstName,
        code: code ?? _authData.code,
        checkboxValue: checkboxValue ?? _authData.checkboxValue);
  }
}
