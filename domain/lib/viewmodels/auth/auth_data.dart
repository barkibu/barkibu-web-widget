import 'package:common_barkibu_dart/configuration.dart';
import 'package:common_barkibu_dart/domain/auth/sign_in_use_case.dart';
import 'package:common_barkibu_dart/domain/auth/sign_up_use_case.dart';
import 'package:common_barkibu_dart/extensions/string_extensions.dart';
import 'package:common_barkibu_dart/service_locator.dart';

class AuthData {
  static final phonePrefixPattern = RegExp(r'^[+][\d]{1,4}$');
  static final phonePattern = RegExp(r'^[\d]*$');
  static final emailPattern = RegExp(r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  String firstName;
  String lastName;
  String email;
  String phoneNumberPrefix;
  String phoneNumber;
  String password;
  String passwordRepeat;
  String code;
  bool checkboxValue;

  String get fullPhoneNumber => phoneNumberPrefix + phoneNumber;

  bool get isFirstNameRequired => ServiceLocator.container<Configuration>().firstNameRequired ?? true;

  bool get isLastNameRequired => ServiceLocator.container<Configuration>().lastNameRequired ?? false;

  AuthData({
    String firstName = '',
    String lastName = '',
    String email = '',
    String phoneNumberPrefix = '',
    String phoneNumber = '',
    String password = '',
    String passwordRepeat = '',
    String code = '',
    bool checkboxValue = false,
  }) {
    this.firstName = firstName.trim();
    this.lastName = lastName.trim();
    this.email = email.trim();
    this.phoneNumberPrefix = phoneNumberPrefix.trim();
    this.phoneNumber = phoneNumber.trim();
    this.checkboxValue = checkboxValue;
    this.password = password;
    this.passwordRepeat = passwordRepeat;
    this.code = code;
  }

  SignUpParams toSignUpParams() => SignUpParams(
        email: email,
        firstName: firstName,
        lastName: lastName,
        phoneNumberPrefix: phoneNumberPrefix,
        phoneNumber: phoneNumber,
        password: password,
      );

  SignInParams toSignInParams() => SignInParams(
        email: email,
        password: password,
      );

  bool firstNameIsInvalid() {
    if (firstName.isEmpty && !isFirstNameRequired) {
      return false;
    }

    return firstName.length < 2 || firstName.length > 30;
  }

  bool lastNameIsInvalid() {
    if (lastName.isEmpty && !isLastNameRequired) {
      return false;
    }

    return lastName.length < 2 || lastName.length > 30;
  }

  bool emailIsInvalid() {
    return email.length < 5 || email.length > 100 || !email.contains(emailPattern);
  }

  bool emailUpdateIsInvalid() {
    if (email.isEmpty) {
      return false;
    }
    return emailIsInvalid();
  }

  bool phoneIsInvalid() {
    if (!phoneNumber.isNullEmptyOrWhitespace) return !phoneNumber.contains(phonePattern);
    return false;
  }

  bool phonePrefixIsInvalid() {
    if (!phoneNumberPrefix.isNullEmptyOrWhitespace) return !phoneNumberPrefix.contains(phonePrefixPattern);
    return false;
  }

  bool valueCheckboxIsNotChecked() {
    return !checkboxValue;
  }

  bool isProfileUpdateValid() {
    if (firstNameIsInvalid()) return false;
    if (lastNameIsInvalid()) return false;
    if (emailUpdateIsInvalid()) return false;
    return true;
  }

  bool isSignupValid() {
    if (firstNameIsInvalid()) return false;
    if (lastNameIsInvalid()) return false;
    if (emailIsInvalid()) return false;
    if (phoneIsInvalid()) return false;
    if (phonePrefixIsInvalid()) return false;
    if (passwordIsInvalid()) return false;
    if (valueCheckboxIsNotChecked()) return false;
    return true;
  }

  bool isSigninValid() {
    if (emailIsInvalid()) return false;
    if (passwordIsInvalid()) return false;
    return true;
  }

  bool isValidForPhoneSignUpVerification() {
    if (phoneNumber.isNullEmptyOrWhitespace || phoneIsInvalid()) return false;
    if (phoneNumberPrefix.isNullEmptyOrWhitespace || phonePrefixIsInvalid()) return false;
    if (firstNameIsInvalid()) return false;
    if (lastNameIsInvalid()) return false;
    if (valueCheckboxIsNotChecked()) return false;
    return true;
  }

  bool isValidForPhoneSignInVerification() {
    if (phoneNumber.isNullEmptyOrWhitespace || phoneIsInvalid()) return false;
    if (phoneNumberPrefix.isNullEmptyOrWhitespace || phonePrefixIsInvalid()) return false;
    return true;
  }

  bool isValidForPhoneSignUp() {
    return isValidForPhoneSignUpVerification() && isCodeValid();
  }

  bool isValidForPhoneSignIn() {
    return isValidForPhoneSignInVerification() && isCodeValid();
  }

  bool passwordIsInvalid() {
    return password.isEmpty;
  }

  bool passwordRepeatIsInvalid() {
    return password != passwordRepeat;
  }

  bool isPasswordValid() {
    if (passwordIsInvalid()) return false;
    return true;
  }

  bool codeIsInvalid() {
    var pattern = RegExp(r'^[0-9]{6}$');

    return !code.contains(pattern);
  }

  bool isCodeValid() {
    return !codeIsInvalid();
  }
}
