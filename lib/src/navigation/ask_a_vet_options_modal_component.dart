import 'dart:async';
import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/messages/messages_model.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/email_attributes.dart';
import 'package:web_widget/src/navigation/modal_component.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/routes.dart';
import 'package:web_widget/src/widget_configuration.dart';
import 'package:web_widget/src/widget_window/parent_window_service.dart';

@Component(
    selector: 'ask-a-vet-options-modal',
    templateUrl: 'ask_a_vet_options_modal_component.html',
    styleUrls: ['ask_a_vet_options_modal_component.css'],
    directives: [coreDirectives, ModalComponent, WidgetButtonComponent],
    exports: [RoutePaths])
class AskAVetOptionsModalComponent implements OnDestroy {
  final _chatWithAVetEventsController = StreamController();
  final _emailWithAVetEventsController = StreamController();
  final _closeEventsController = StreamController();
  final MessagesModel messages;
  final ParentWindowService parentWindowService;
  final WidgetConfiguration config;

  AskAVetOptionsModalComponent(this.messages, this.config, this.parentWindowService);

  @Input()
  String schedulePhoneCallLink;

  @Input()
  EmailAttributes emailAttributes;

  bool get externalLinksEventsEnabled => config.externalLinksEventsEnabled;

  bool get isEmbeddedEmailClientEnabled => config.embeddedEmailClientEnabled;

  String get title => messages.assessmentReportMessages.askAVetMenu.title;

  String get modalChatWithAVetText => messages.assessmentReportMessages.askAVetMenu.chatWithAVet;

  String get modalSendEmailText => messages.contactMessages.actions.sendEmail;

  String get modalSchedulePhoneCallText => messages.contactMessages.actions.schedulePhoneCall;

  String get modalCloseButtonText => messages.sharedMessages.cancel;

  bool get isChatWithAVetEnabled => config.telehealthChatEnabled;

  bool get isEmailContactEnabled => config.telehealthEmailEnabled;

  bool get isPhoneContactEnabled => config.telehealthPhoneCallEnabled;

  @Output()
  Stream get onChatWithVetPressed => _chatWithAVetEventsController.stream;

  @Output()
  Stream get onSendEmailPressed => _emailWithAVetEventsController.stream;

  @Output()
  Stream get onClosePressed => _closeEventsController.stream;

  @Output()
  void chatWithAVet() {
    _chatWithAVetEventsController.add(null);
  }

  @Output()
  void emailWithAVet() {
    _emailWithAVetEventsController.add(null);
  }

  @Output()
  void close() {
    _closeEventsController.add(null);
  }

  @override
  void ngOnDestroy() {
    _closeEventsController.close();
    _chatWithAVetEventsController.close();
  }

  void notifyEmailOptionSelected() {
    parentWindowService.notifyEmailRequested(emailAttributes.subject, emailAttributes.body, emailAttributes.to);
  }

  void notifyPhoneCallOptionSelected() {
    parentWindowService.notifyPhoneAppointmentRequested(schedulePhoneCallLink);
  }
}
