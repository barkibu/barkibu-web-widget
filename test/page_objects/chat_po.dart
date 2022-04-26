import 'package:pageloader/html.dart';
import 'chat_controls_po.dart';
import 'chat_messages_po.dart';
import 'assessment_report_po.dart';
import 'email_sender_po.dart';

part 'chat_po.g.dart';

@PageObject()
@CheckTag('chat')
abstract class ChatPO {
  ChatPO();
  factory ChatPO.create(PageLoaderElement context) = $ChatPO.create;
  factory ChatPO.lookup(PageLoaderSource context) = $ChatPO.lookup;

  @ByCheckTag()
  ChatControlsPO get controls;

  @ByCheckTag()
  ChatMessagesPO get messages;

  @ByCheckTag()
  AssessmentReportPO get report;

  @ByCheckTag()
  EmailSenderPO get emailSender;

  @ByCss('widget-button button')
  @WithInnerText('Continue')
  PageLoaderElement get _continueAssessmentButton;

  @ByCss('widget-button button')
  @WithInnerText('Ask a vet')
  PageLoaderElement get _askAVetLink;

  @ById('contactOptions')
  PageLoaderElement get askAVetContactModal;

  @ById('askAVetButtonModal')
  @WithInnerText('Chat with a Vet now')
  PageLoaderElement get _askAVetButton;

  void reportContinueAssessment() async {
    await _continueAssessmentButton.click();
  }

  void givePositiveFeedback() async {
    await controls.selectYesNoOption('Yes');
  }

  void reportAskAVet() async {
    await _askAVetLink.click();
  }

  void askAVetFromModal() {
    _askAVetButton.click();
  }
}
