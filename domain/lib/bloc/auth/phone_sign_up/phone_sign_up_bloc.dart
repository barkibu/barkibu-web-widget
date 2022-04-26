import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/services/analytics/events/access_event_analytics.dart';

import 'phone_sign_up_event.dart';
import 'phone_sign_up_state.dart';

export 'phone_sign_up_event.dart';
export 'phone_sign_up_state.dart';

class PhoneSignUpBloc extends Bloc<PhoneSignUpEvent, PhoneSignUpState> {
  final AuthBloc _authBloc;
  final PhoneSignUpUseCase _useCase;
  final AnalyticsService _analyticsService = ServiceLocator.container<AnalyticsService>();

  AuthData _authData = AuthData();

  PhoneSignUpBloc(this._useCase, this._authBloc);

  @override
  PhoneSignUpState get initialState {
    _analyticsService.event.access.logSignUpCreate();
    return PhoneSignUpInitial();
  }

  @override
  Stream<PhoneSignUpState> mapEventToState(PhoneSignUpEvent event) async* {
    if (event is PhoneSignUpStarted) {
      _authData = _rebuildAuthData(
          phoneNumber: event.phoneNumber,
          phoneNumberPrefix: event.phoneNumberPrefix,
          firstName: event.name,
          lastName: event.lastName,
          checkboxValue: event.checkboxValue);
      yield* _sendVerificationCode();
    }

    if (event is PhoneSignUpCodeResendRequested) {
      _analyticsService.event.access.logClickResendCode(EventAccessType.Signup);
      yield* _sendVerificationCode();
    }

    if (event is PhoneSignUpCodeEntered) {
      _authData = _rebuildAuthData(code: event.code);
      try {
        if (_authData.isValidForPhoneSignUp()) {
          yield PhoneSignUpVerificationInProgress();
          final result = await _useCase.signUp(_authData);
          yield* _processVerificationResult(result);
        } else {
          yield PhoneSignUpValidationFailure();
        }
      } catch (error) {
        yield PhoneSignUpVerificationFailure((b) => b
          ..errorType = PhoneSignUpOperationErrorType.generalError
          ..errorMessage = error.toString());
      }
    }
  }

  Stream<PhoneSignUpState> _sendVerificationCode() async* {
    _analyticsService.event.access.logClickSendCode(EventAccessType.Signup);
    try {
      if (_authData.isValidForPhoneSignUpVerification()) {
        yield PhoneSignUpCodeSendInProgress();
        final result = await _useCase.sendVerificationCode(_authData);
        yield* _processSendVerificationResult(result);
      } else {
        yield PhoneSignUpValidationFailure();
      }
    } catch (error) {
      yield PhoneSignUpCodeSendFailure((b) => b
        ..errorType = PhoneSignUpOperationErrorType.generalError
        ..errorMessage = error.toString());
    }
  }

  Stream<PhoneSignUpState> _processVerificationResult(PhoneSignUpOperationResult result) async* {
    if (result is PhoneSignUpOperationSuccess) {
      _analyticsService.event.access.logSignUpCompleted();
      yield PhoneSignUpVerificationSuccess();
      _authBloc.add(SignedIn((b) => b..token = result.accessToken));
    } else {
      final errorType = (result as PhoneSignUpOperationError).errorType;
      yield PhoneSignUpVerificationFailure((b) => b..errorType = errorType);
    }
  }

  Stream<PhoneSignUpState> _processSendVerificationResult(PhoneSignUpOperationResult result) async* {
    if (result is PhoneSignUpOperationSuccess) {
      yield PhoneSignUpCodeSendSuccess();
    } else {
      final errorType = (result as PhoneSignUpOperationError).errorType;
      yield PhoneSignUpCodeSendFailure((b) => b..errorType = errorType);
    }
  }

  AuthData _rebuildAuthData(
      {String phoneNumber,
      String phoneNumberPrefix,
      String firstName,
      String lastName,
      String code,
      bool checkboxValue}) {
    return AuthData(
        phoneNumber: phoneNumber ?? _authData.phoneNumber,
        phoneNumberPrefix: phoneNumberPrefix ?? _authData.phoneNumberPrefix,
        firstName: firstName ?? _authData.firstName,
        lastName: lastName ?? _authData.lastName,
        code: code ?? _authData.code,
        checkboxValue: checkboxValue ?? _authData.checkboxValue);
  }
}
