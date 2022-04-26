import 'package:pageloader/html.dart';
import 'profile_form_mixin.dart';

part 'sign_up_po.g.dart';

@PageObject()
@CheckTag('sign-up')
abstract class SignUpPO extends Object with ProfileFormMixin {
  SignUpPO();
  factory SignUpPO.create(PageLoaderElement context) = $SignUpPO.create;

  @ById('password')
  PageLoaderElement get _password;

  @ById('checkboxValue')
  PageLoaderElement get _checkboxValue;

  @ById('code')
  PageLoaderElement get _code;

  @ByCss('button[role="tab"]')
  @WithInnerText('Email')
  PageLoaderElement get _emailSignUpTab;

  @ByCss('button[role="tab"]')
  @WithInnerText('Phone')
  PageLoaderElement get _phoneSignUpTab;

  @override
  @ByTagName('button')
  @WithInnerText('Sign up')
  PageLoaderElement get submitButton;

  @ByTagName('alert')
  PageLoaderElement get _alertMessage;

  @ByTagName('button')
  @WithInnerText('Resend code')
  PageLoaderElement get _resendCodeButton;

  @ByTagName('button')
  @WithInnerText('Terms of Service')
  PageLoaderElement get _termsAndConditionsButton;

  @ByTagName('widget-layout')
  List<PageLoaderElement> get _layout;

  Future<void> fillInPassword(value) async {
    await _password.type(value);
  }

  Future<void> acceptTerms() async {
    await _checkboxValue.click();
  }

  Future<void> navigateToEmailSignUp() async {
    await _emailSignUpTab.click();
  }

  bool hasAlertMessage(String text) {
    return _alertMessage.innerText == text;
  }

  Future<void> resendVerificationCode() async {
    await _resendCodeButton.click();
  }

  Future<void> openTermsAndConditions() async {
    await _termsAndConditionsButton.click();
  }

  Future<void> fillInCode(value) async {
    await _code.type(value);
  }

  bool isFormHidden() {
    // Form is not removed from dom to save the form state.
    // There will be two widget-layouts elements and one will be hidden
    return _layout.first.properties['hidden'] == 'true';
  }

  bool get hasEmailTab => _emailSignUpTab.exists;
  bool get hasPhoneTab => _phoneSignUpTab.exists;
}
