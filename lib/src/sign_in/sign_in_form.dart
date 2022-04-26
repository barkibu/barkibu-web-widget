import 'package:common_barkibu_dart/viewmodels/auth/auth_data.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:common_barkibu_dart/messages/authMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/validationMessages.i18n.dart';

class SignInForm {
  final MessagesModel messagesModel;
  AuthMessages authMessages;
  ValidationMessages validationMessages;

  SignInForm(this.messagesModel) {
    authMessages = messagesModel.authMessages;
    validationMessages = messagesModel.validationMessages;
  }

  Map<String, String> emailValidator(AbstractControl c) {
    if (AuthData(email: c.value).emailIsInvalid()) {
      return {'invalid': authMessages.sign_in.mail_error};
    } else {
      return null;
    }
  }

  Map<String, String> passwordValidator(AbstractControl c) {
    if (AuthData(password: c.value).passwordIsInvalid()) {
      var message = validationMessages.validate.required(authMessages.sign_in.password);
      return {'invalid': message};
    } else {
      return null;
    }
  }

  Map<String, String> requiredPhoneValidator(AbstractControl c) {
    if (c.value.isEmpty) {
      final message = validationMessages.validate.required(authMessages.sign_up.phone_number);
      return {'invalid': message};
    } else if (AuthData(phoneNumber: c.value).phoneIsInvalid()) {
      return {'invalid': authMessages.sign_up.phone_number_error};
    } else {
      return null;
    }
  }

  Map<String, String> requiredPhonePrefixValidator(AbstractControl c) {
    if (c.value.isEmpty) {
      final message = validationMessages.validate.required(authMessages.sign_up.phone_number_prefix);
      return {'invalid': message};
    } else if (AuthData(phoneNumberPrefix: c.value).phonePrefixIsInvalid()) {
      return {'invalid': authMessages.sign_up.phone_number_prefix_error};
    } else {
      return null;
    }
  }

  Map<String, String> codeValidator(AbstractControl c) {
    if (AuthData(code: c.value).codeIsInvalid()) {
      return {'invalid': authMessages.code.error};
    } else {
      return null;
    }
  }

  ControlGroup buildEmailSignInFormControl() {
    return ControlGroup({'email': Control('', emailValidator), 'password': Control('', passwordValidator)});
  }

  ControlGroup buildPhoneSignInFormControl() {
    return ControlGroup({
      'phoneNumber': Control('', requiredPhoneValidator),
      'phoneNumberPrefix': Control('', requiredPhonePrefixValidator),
      'code': Control('', codeValidator)
    });
  }
}
