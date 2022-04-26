import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/ask_a_vet/ask_a_vet_message_component.dart';
import 'package:web_widget/src/ask_a_vet/ask_a_vet_system_message_component.dart';
import 'package:web_widget/src/ask_a_vet/ask_a_vet_typing_component.dart';
import 'package:web_widget/src/ask_a_vet/ask_a_vet_terminated_component.dart';

import 'dart:html';

@Component(selector: 'ask-a-vet-messages', templateUrl: 'ask_a_vet_messages_component.html', styleUrls: [
  'ask_a_vet_messages_component.css'
], directives: [
  coreDirectives,
  AskAVetMessageComponent,
  AskAVetSystemMessageComponent,
  AskAVetTypingComponent,
  AskAVetTerminatedComponent,
])
class AskAVetMessagesComponent implements OnInit {
  @Input()
  ChatWithVetState chatState;
  Element element;
  MessagesModel messages;

  AskAVetMessagesComponent(this.element, this.messages);

  @override
  void ngOnInit() => scrollToTheLastMessage();

  void scrollToTheLastMessage() {
    // Scroll on next event loop cycle to allow angular to update DOM
    Future.delayed(Duration.zero, () {
      element.scrollIntoView(ScrollAlignment.BOTTOM);
    });
  }

  bool hasMessageSourceChanged(int index) {
    if (messagesList.length == index + 1) {
      return true;
    }
    var currentMessage = messagesList[index];
    var nextMessage = messagesList[index + 1];
    if (isBotMessage(nextMessage)) {
      return true;
    }
    return isMyMessage(currentMessage) != isMyMessage(nextMessage);
  }

  List<SimpleChatMessage> get messagesList {
    if (isChatConnectSuccess) {
      return successStateMessages;
    } else {
      return terminateStateMessages;
    }
  }

  List<SimpleChatMessage> get successStateMessages {
    final state = chatState as ChatWithVetConnectSuccess;
    final list = List<SimpleChatMessage>.from(state.messages);
    list.addAll(state.pendingMessages);
    return list;
  }

  List<SimpleChatMessage> get terminateStateMessages {
    final state = chatState as ChatWithVetTerminateSuccess;
    return List<SimpleChatMessage>.from(state.messages);
  }

  bool isMyMessage(SimpleChatMessage message) {
    return message.me;
  }

  bool isMessageVisible(SimpleChatMessage message) {
    return message.attributes['hide'] == null || !message.attributes['hide'];
  }

  bool isBotMessage(SimpleChatMessage message) {
    return message.attributes['type'] != null || message.attributes['type'] == 'bot';
  }

  bool isMessagePending(SimpleChatMessage message) {
    return message is SendingChatMessage || message is SendingChatMediaMessage;
  }

  bool get isChatConnectSuccess => chatState is ChatWithVetConnectSuccess;
  bool get isChatConnectTerminated => chatState is ChatWithVetTerminateSuccess;
}
