import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:common_barkibu_dart/viewmodels/viewmodels.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:web_widget/src/form/age_input_component.dart';
import 'chat_control_events.dart';
import 'chat_streamed_events_control.dart';

@Component(
  selector: 'chat-age-input',
  templateUrl: 'chat_age_input_component.html',
  directives: [coreDirectives, formDirectives, AgeInputComponent],
  styleUrls: ['chat_age_input_component.css'],
)
class ChatAgeInputComponent extends ChatStreamedEventsControls<ChatAgeConfirmed> {
  final MessagesModel messages;
  String birthdate;

  ChatAgeInputComponent(this.messages);

  @Input('chatViewModel')
  AgeSelectorViewModel chatViewModel;

  void onAgeConfirmed() {
    controlEventsController.add(ChatAgeConfirmed(chatViewModel.chatFlow, birthdate));
  }
}
