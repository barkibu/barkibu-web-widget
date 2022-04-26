import 'package:pageloader/html.dart';
import 'profile_form_mixin.dart';

part 'password_recovery_po.g.dart';

@PageObject()
@CheckTag('password-recovery')
abstract class PasswordRecoveryPO extends Object with ProfileFormMixin {
  PasswordRecoveryPO();
  factory PasswordRecoveryPO.create(PageLoaderElement context) = $PasswordRecoveryPO.create;
  factory PasswordRecoveryPO.lookup(PageLoaderSource context) = $PasswordRecoveryPO.lookup;

  @ByCss('button[type="submit"]')
  @WithInnerText('Send reset email')
  PageLoaderElement get _emailSubmitButton;

  @ByCss('button[type="button"]')
  @WithInnerText('Not received anything? Resend code')
  PageLoaderElement get _resetResetCodeButton;

  @ByCss('button[type="submit"]')
  @WithInnerText('Reset password & log in')
  PageLoaderElement get _resetPasswordSubmitButton;

  @ByCss('.alert.alert-success')
  PageLoaderElement get _successMessage;

  @ByCss('.alert.alert-danger')
  PageLoaderElement get _errorMessage;

  @ById('password')
  PageLoaderElement get _password;

  @ById('passwordRepeat')
  PageLoaderElement get _passwordRepeat;

  @ById('code')
  PageLoaderElement get _code;

  Future<void> fillInPassword(value) async {
    await _password.type(value);
  }

  Future<void> fillInPasswordRepeat(value) async {
    await _passwordRepeat.type(value);
  }

  Future<void> fillInCode(value) async {
    await _code.type(value);
  }

  bool isEmailSubmitDisabled() {
    return _emailSubmitButton.attributes['disabled'] != null;
  }

  Future<void> submitEmail() async {
    await _emailSubmitButton.click();
  }

  Future<void> resendResetCode() async {
    await _resetResetCodeButton.click();
  }

  Future<void> submitPasswordReset() async {
    await _resetPasswordSubmitButton.click();
  }

  String successMessage() {
    return _successMessage.innerText;
  }

  String errorMessage() {
    return _errorMessage.innerText;
  }
}
