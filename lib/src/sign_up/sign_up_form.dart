import 'package:common_barkibu_dart/viewmodels/auth/auth_data.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:common_barkibu_dart/messages/authMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/validationMessages.i18n.dart';

class SignUpForm {
  final MessagesModel messagesModel;
  AuthMessages authMessages;
  ValidationMessages validationMessages;

  SignUpForm(this.messagesModel) {
    authMessages = messagesModel.authMessages;
    validationMessages = messagesModel.validationMessages;
  }

  Map<String, String> firstNameValidator(AbstractControl c) {
    if (AuthData(firstName: c.value).firstNameIsInvalid()) {
      return {'invalid': authMessages.sign_up.name_error};
    } else {
      return null;
    }
  }

  Map<String, String> lastNameValidator(AbstractControl c) {
    if (AuthData(lastName: c.value).lastNameIsInvalid()) {
      return {'invalid': authMessages.sign_up.lastname_error};
    } else {
      return null;
    }
  }

  Map<String, String> emailValidator(AbstractControl c) {
    if (AuthData(email: c.value).emailIsInvalid()) {
      return {'invalid': authMessages.sign_up.email_error};
    } else {
      return null;
    }
  }

  Map<String, String> phoneNumberPrefixValidator(AbstractControl c) {
    if (AuthData(phoneNumberPrefix: c.value).phonePrefixIsInvalid()) {
      return {'invalid': authMessages.sign_up.phone_number_prefix_error};
    } else {
      return null;
    }
  }

  Map<String, String> phoneNumberValidator(AbstractControl c) {
    if (AuthData(phoneNumber: c.value).phoneIsInvalid()) {
      return {'invalid': authMessages.sign_up.phone_number_error};
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

  Map<String, String> passwordValidator(AbstractControl c) {
    if (AuthData(password: c.value).passwordIsInvalid()) {
      var message = validationMessages.validate.required(authMessages.sign_up.password);
      return {'invalid': message};
    } else {
      return null;
    }
  }

  Map<String, String> checkboxValueValidator(AbstractControl c) {
    var checked = (c.value is String) ? c.value != '' : c.value;

    if (AuthData(checkboxValue: checked).valueCheckboxIsNotChecked()) {
      return {'invalid': authMessages.sign_up.accept_terms_error};
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

  ControlGroup buildSignUpFormControl({bool submitAuthorized = false}) {
    return ControlGroup({
      'firstName': Control('', firstNameValidator),
      'lastName': Control('', lastNameValidator),
      'email': Control('', emailValidator),
      'password': Control('', passwordValidator),
      'checkboxValue': Control(submitAuthorized.toString(), checkboxValueValidator)
    });
  }

  ControlGroup buildPhoneSignUpFormControl({bool submitAuthorized = false}) {
    return ControlGroup({
      'firstName': Control('', firstNameValidator),
      'lastName': Control('', lastNameValidator),
      'phoneNumber': Control('', requiredPhoneValidator),
      'phoneNumberPrefix': Control('', requiredPhonePrefixValidator),
      'checkboxValue': Control('', checkboxValueValidator),
      'code': Control('', codeValidator)
    });
  }

  ControlGroup buildProfileFormControl() {
    return ControlGroup({
      'firstName': Control('', firstNameValidator),
      'lastName': Control('', lastNameValidator),
      'email': Control('', emailValidator),
      'phoneNumberPrefix': Control('', phoneNumberPrefixValidator),
      'phoneNumber': Control('', phoneNumberValidator)
    });
  }
}
