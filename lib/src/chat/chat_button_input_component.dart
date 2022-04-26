import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/viewmodels/viewmodels.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'chat_control_events.dart';
import 'chat_streamed_events_control.dart';

@Component(
  selector: 'chat-button-input',
  templateUrl: 'chat_button_input_component.html',
  directives: [coreDirectives, WidgetButtonComponent],
  styleUrls: ['chat_button_input_component.css'],
)
class ChatButtonInputComponent extends ChatStreamedEventsControls<ChatActionButtonPressed> {
  final MessagesModel messages;

  ChatButtonInputComponent(this.messages);

  @Input('chatViewModel')
  ButtonInputChatViewModel chatViewModel;

  void onButtonClicked() {
    controlEventsController.add(ChatActionButtonPressed(chatViewModel));
  }

  String get buttonTitle {
    if (chatViewModel.action == ChatViewModelAction.openReport) {
      return messages.chatMessages.openReport;
    } else {
      return '';
    }
  }
}
