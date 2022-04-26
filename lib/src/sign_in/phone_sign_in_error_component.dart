import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/alerts/alert_component.dart';

@Component(
    selector: 'phone-sign-in-error',
    templateUrl: 'phone_sign_in_error_component.html',
    directives: [NgIf, AlertComponent])
class PhoneSignInErrorComponent {
  final MessagesModel messages;

  @Input()
  PhoneSignInState state;

  PhoneSignInErrorComponent(this.messages);

  bool get isSignInStateError {
    return isPhoneInvalid || isCodeIncorrect || isOtherError;
  }

  bool get isPhoneInvalid {
    return state is PhoneSignInCodeSendFailure &&
        (state as PhoneSignInCodeSendFailure).errorType == PhoneSignInOperationErrorType.invalidPhone;
  }

  bool get isCodeIncorrect {
    return state is PhoneSignInVerificationFailure &&
        (state as PhoneSignInVerificationFailure).errorType == PhoneSignInOperationErrorType.incorrectCode;
  }

  bool get isOtherError {
    return state is PhoneSignInVerificationFailure || state is PhoneSignInCodeSendFailure;
  }

  bool get isPhoneNotFound {
    return state is PhoneSignInCodeSendFailure &&
        (state as PhoneSignInCodeSendFailure).errorType == PhoneSignInOperationErrorType.phoneNotFound;
  }

  // ignore: missing_return
  String get errorMessage {
    if (isPhoneInvalid) {
      return messages.authMessages.sign_up.invalid_phone_error;
    } else if (isPhoneNotFound) {
      return messages.authMessages.sign_up.phone_not_found;
    } else if (isCodeIncorrect) {
      return messages.authMessages.code.incorrectCodeError;
    } else if (state is PhoneSignInCodeSendFailure) {
      return messages.authMessages.code.not_sent_error;
    } else if (state is PhoneSignInVerificationFailure) {
      return messages.authMessages.sign_up.phone_not_verified_error;
    }
  }
}
