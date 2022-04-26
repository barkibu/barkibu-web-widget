import 'package:pageloader/html.dart';

part 'profile_form_mixin.g.dart';

@PageObject()
abstract class ProfileFormMixin {
  @ByCss('go-back a')
  PageLoaderElement get _backButton;

  @ByCss('button[type="submit"]')
  PageLoaderElement get submitButton;

  @ByClass('invalid-feedback')
  List<PageLoaderElement> get _validationMessages;

  @ById('firstName')
  PageLoaderElement get _firstName;

  @ById('lastName')
  PageLoaderElement get _lastName;

  @ById('email')
  PageLoaderElement get _email;

  @ById('phoneNumberPrefix')
  PageLoaderElement get _phonePrefix;

  @ById('phoneNumber')
  PageLoaderElement get _phoneNumber;

  @ByClass('snackbar-alert')
  PageLoaderElement get _snackbarAlert;

  bool hasValidationMessage(String expectedMessage) {
    return _validationMessages.map((e) => e.innerText).contains(expectedMessage);
  }

  Future<void> navigateBack() async {
    await _backButton.click();
  }

  Future<void> submitForm() async {
    await submitButton.click();
  }

  Future<void> fillInFirstName(value) async {
    await _firstName.type(value);
  }

  Future<void> fillInLastName(value) async {
    await _lastName.type(value);
  }

  Future<void> fillInEmail(value) async {
    await _email.type(value);
  }

  Future<void> fillInPhonePrefix(value) async {
    await _phonePrefix.type(value);
  }

  Future<void> fillInPhoneNumber(value) async {
    await _phoneNumber.type(value);
  }

  bool isDisabled() {
    return submitButton.attributes['disabled'] != null;
  }

  String snackbarText() {
    return _snackbarAlert.innerText;
  }
}
