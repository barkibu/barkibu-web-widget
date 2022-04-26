import 'package:angular/angular.dart';
import 'package:web_widget/src/chat/chat_message_component.dart';
import 'package:common_barkibu_dart/viewmodels/viewmodels.dart';

import 'dart:html';

@Component(
    selector: 'chat-messages',
    templateUrl: 'chat_messages_component.html',
    styleUrls: ['chat_messages_component.css'],
    directives: [coreDirectives, ChatMessageComponent])
class ChatMessagesComponent implements OnInit {
  @Input()
  List<ChatViewModel> messagesList;
  Element element;

  ChatMessagesComponent(this.element);

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
    if (nextMessage is CardsListChatViewModel) {
      return true;
    }
    ;
    return isMyMessage(currentMessage) != isMyMessage(nextMessage);
  }

  bool isMyMessage(viewModel) {
    if (viewModel is MessageChatViewModel ||
        viewModel is MessageTypeChatViewModel ||
        viewModel is ButtonOutputChatViewModel) {
      return viewModel.me;
    } else {
      return false;
    }
  }
}
