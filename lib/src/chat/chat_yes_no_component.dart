import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/viewmodels/viewmodels.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:web_widget/src/chat/chat_control_events.dart';
import 'package:web_widget/src/chat/chat_streamed_events_control.dart';

@Component(
    selector: 'chat-yes-no',
    templateUrl: 'chat_yes_no_component.html',
    directives: [coreDirectives],
    styleUrls: ['chat_yes_no_component.css'])
class ChatYesNoComponent extends ChatStreamedEventsControls<YesNoUnkownConfirmed> {
  final MessagesModel messages;

  @Input('yesNoViewModel')
  YesNoViewModel yesNoViewModel;

  @Input('yesNoUnkownViewModel')
  YesNoUnknownViewModel yesNoUnkownViewModel;

  ChatYesNoComponent(this.messages);

  void confirmYes() => _confirmAnswer(true);
  void confirmNo() => _confirmAnswer(false);
  void confirmUnknown() => _confirmAnswer(null);

  dynamic get viewModel {
    return yesNoViewModel ?? yesNoUnkownViewModel;
  }

  void _confirmAnswer(bool answer) {
    controlEventsController.add(YesNoUnkownConfirmed(viewModel?.chatFlow, answer));
  }
}
