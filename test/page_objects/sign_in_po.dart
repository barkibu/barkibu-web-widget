import 'package:pageloader/html.dart';

part 'sign_in_po.g.dart';

@PageObject()
@CheckTag('sign-in')
abstract class SignInPO {
  SignInPO();
  factory SignInPO.create(PageLoaderElement context) = $SignInPO.create;

  @ByCss('go-back a')
  PageLoaderElement get _backButton;

  @ByTagName('button')
  @WithInnerText('Log in')
  PageLoaderElement get _submitButton;

  @ByClass('invalid-feedback')
  List<PageLoaderElement> get _validationMessages;

  @ByCss('button[role="tab"]')
  @WithInnerText('Email')
  PageLoaderElement get _emailSignInTab;

  @ByCss('button[role="tab"]')
  @WithInnerText('Phone')
  PageLoaderElement get _phoneSignInTab;

  @ById('email')
  PageLoaderElement get _email;

  @ById('password')
  PageLoaderElement get _password;

  @ById('phoneNumberPrefix')
  PageLoaderElement get _phonePrefix;

  @ById('phoneNumber')
  PageLoaderElement get _phoneNumber;

  @ById('code')
  PageLoaderElement get _code;

  @ByTagName('button')
  @WithInnerText('Resend code')
  PageLoaderElement get _resendCodeButton;

  @ByCss('a')
  @WithInnerText('Have you forgotten your password?')
  PageLoaderElement get _recoverPasswordLink;

  @ByTagName('alert')
  PageLoaderElement get _alertMessage;

  bool hasValidationMessage(String expectedMessage) {
    return _validationMessages.map((e) => e.innerText).contains(expectedMessage);
  }

  Future<void> navigateToEmailSignIn() async {
    await _emailSignInTab.click();
  }

  Future<void> navigateBack() async {
    await _backButton.click();
  }

  Future<void> submitForm() async {
    await _submitButton.click();
  }

  Future<void> fillInEmail(value) async {
    await _email.type(value);
  }

  Future<void> fillInPassword(value) async {
    await _password.type(value);
  }

  Future<void> fillInPhonePrefix(value) async {
    await _phonePrefix.type(value);
  }

  Future<void> fillInPhoneNumber(value) async {
    await _phoneNumber.type(value);
  }

  Future<void> navigateToPasswordRecovery() async {
    await _recoverPasswordLink.click();
  }

  bool hasErrorMessage(String message) {
    return _alertMessage.innerText == message;
  }

  Future<void> resendVerificationCode() async {
    await _resendCodeButton.click();
  }

  Future<void> fillInCode(value) async {
    await _code.type(value);
  }

  bool get hasEmailTab => _emailSignInTab.exists;
  bool get hasPhoneTab => _phoneSignInTab.exists;
}
