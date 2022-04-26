import 'package:pageloader/html.dart';

part 'email_sender_po.g.dart';

@PageObject()
@CheckTag('email-sender')
abstract class EmailSenderPO {
  EmailSenderPO();
  factory EmailSenderPO.create(PageLoaderElement context) = $EmailSenderPO.create;

  @ById('message')
  PageLoaderElement get _emailText;

  @ById('info')
  PageLoaderElement get _infoMessage;

  @ById('error')
  PageLoaderElement get _errorMessage;

  @ById('email')
  PageLoaderElement get _emailAdress;

  @ById('send_email_button')
  PageLoaderElement get _sendEmailButton;

  bool get isEmailAddressPresent => _emailAdress.exists;
  bool get isEmailTextAreaPresent => _emailText.exists;
  bool get isSendEmailButtonPresent => _sendEmailButton.exists;
  bool get isInfoMessageDisplayed => _infoMessage.exists;
  bool get isErrorMessageDisplayed => _errorMessage.exists;
  void sendMail() async => await _sendEmailButton.click();
}
