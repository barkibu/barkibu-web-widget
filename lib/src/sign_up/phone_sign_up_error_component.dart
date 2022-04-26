import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/alerts/alert_component.dart';

@Component(
    selector: 'phone-sign-up-error', templateUrl: 'sign_up_error_component.html', directives: [NgIf, AlertComponent])
class PhoneSignUpErrorComponent {
  final MessagesModel messages;

  @Input()
  PhoneSignUpState state;

  PhoneSignUpErrorComponent(this.messages);

  bool isSignUpStateError() {
    return isPhoneInvalid || isCodeIncorrect || isOtherError;
  }

  bool get isPhoneInvalid {
    return state is PhoneSignUpCodeSendFailure &&
        (state as PhoneSignUpCodeSendFailure).errorType == PhoneSignUpOperationErrorType.invalidPhone;
  }

  bool get isCodeIncorrect {
    return state is PhoneSignUpVerificationFailure &&
        (state as PhoneSignUpVerificationFailure).errorType == PhoneSignUpOperationErrorType.incorrectCode;
  }

  bool get isOtherError {
    return state is PhoneSignUpVerificationFailure || state is PhoneSignUpCodeSendFailure;
  }

  // ignore: missing_return
  String get errorMessage {
    if (isPhoneInvalid) {
      return messages.authMessages.sign_up.invalid_phone_error;
    } else if (isCodeIncorrect) {
      return messages.authMessages.code.incorrectCodeError;
    } else if (state is PhoneSignUpCodeSendFailure) {
      return messages.authMessages.code.not_sent_error;
    } else if (state is PhoneSignUpVerificationFailure) {
      return messages.authMessages.sign_up.phone_not_verified_error;
    }
  }
}
