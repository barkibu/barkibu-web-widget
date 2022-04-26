import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/viewmodels/viewmodels.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/widget_window/parent_window_service.dart';
import 'package:web_widget/src/widget_configuration.dart';
import 'chat_control_events.dart';
import 'chat_streamed_events_control.dart';

@Component(
  selector: 'chat-buttons-input',
  templateUrl: 'chat_buttons_input_component.html',
  directives: [coreDirectives, WidgetButtonComponent],
  styleUrls: ['chat_buttons_input_component.css'],
)
class ChatButtonsInputComponent extends ChatStreamedEventsControls<ChatOptionButtonPressed> {
  final MessagesModel messages;
  final WidgetConfiguration _config;
  final ParentWindowService _parentWindow;

  ChatButtonsInputComponent(this.messages, this._config, this._parentWindow);

  @Input('chatViewModel')
  ButtonsInputChatViewModel<ChatButtonOptionType> chatViewModel;

  bool get embeddedEmailClientEnabled => _config.embeddedEmailClientEnabled ?? false;

  void onButtonClicked(ChatButtonOptionType optionType) {
    controlEventsController.add(ChatOptionButtonPressed(optionType));
  }

  bool isAskAnotherQuestionOption(item) {
    return item == ChatButtonOptionType.askAnotherQuestion;
  }

  bool isTalkToAVetOption(item) {
    return item == ChatButtonOptionType.talkWithAVet;
  }

  bool isPersonalRecommendationsOption(item) {
    return item == ChatButtonOptionType.personalRecommendations;
  }

  bool isBackHomeOption(item) {
    return item == ChatButtonOptionType.backHome;
  }

  bool get isBackButtonEnabled => _config.backButtonEnabled;

  bool isGoBackOption(item) {
    return item == ChatButtonOptionType.goBack;
  }

  bool isOpenReport(item) {
    return item == ChatButtonOptionType.openReport;
  }

  bool isNoThanks(item) {
    return item == ChatButtonOptionType.noThanks;
  }

  bool isSchedulePhoneCall(item) {
    return item == ChatButtonOptionType.schedulePhoneCall;
  }

  bool isSendEmail(item) {
    return item == ChatButtonOptionType.sendEmail;
  }

  bool get externalLinksEventsEnabled => _config.externalLinksEventsEnabled;

  void notifyEmailOption() {
    _parentWindow.notifyEmailRequested(
        chatViewModel.data['subject'], chatViewModel.data['body'], chatViewModel.data['to']);
  }

  void notifyPhoneOption() {
    _parentWindow.notifyPhoneAppointmentRequested(chatViewModel.data['appointment_url']);
  }
}
