import 'package:pageloader/html.dart';

part 'chat_message_po.g.dart';

@PageObject()
@CheckTag('chat-message')
abstract class ChatMessagePO {
  ChatMessagePO();
  factory ChatMessagePO.create(PageLoaderElement context) = $ChatMessagePO.create;
  factory ChatMessagePO.lookup(PageLoaderSource context) = $ChatMessagePO.lookup;

  @ByCss('button')
  @WithInnerText('Learn more')
  PageLoaderElement get _learnMoreButton;

  @ByCss('.message-body')
  PageLoaderElement get _messageBody;

  void learnMore() {
    _learnMoreButton.click();
  }

  bool hasMessageBody(String message) {
    return _messageBody.innerText == message;
  }
}
