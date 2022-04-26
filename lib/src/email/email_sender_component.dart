import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/bloc/email_contact/email_contact.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:common_barkibu_dart/models/email.dart';
import 'package:common_barkibu_dart/models/pet.dart';
import 'package:common_barkibu_dart/models/user.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/services/analytics_service.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/profile/snackbar_component.dart';
import 'package:web_widget/src/route_paths.dart';

EmailContactBloc emailContactBlocFactory() => ServiceLocator.container<EmailContactBloc>();

@Component(
  selector: 'email-sender',
  templateUrl: 'email_sender_component.html',
  styleUrls: ['email_sender_component.css'],
  directives: [
    coreDirectives,
    formDirectives,
    layoutDirectives,
    routerDirectives,
    GoBackComponent,
    WidgetButtonComponent,
    SnackbarComponent,
  ],
  exports: [RoutePaths],
  providers: [
    FactoryProvider(EmailContactBloc, emailContactBlocFactory),
  ],
)
class EmailSenderComponent implements OnInit, OnDestroy {
  final EmailContactBloc _emailContactBloc;
  final MessagesModel messages;
  final _onEmailSendController = StreamController();
  StreamSubscription emailContactBlocSubscription;
  EmailContactState emailContactBlocState;

  @Input()
  User user;

  @Input()
  Pet pet;

  @Input()
  String emailBody;

  @Output()
  Stream get emailSended => _onEmailSendController.stream;

  EmailSenderComponent(this.messages, this._emailContactBloc);

  final analyticsService = ServiceLocator.container<AnalyticsService>();

  String infoMessage;
  String errorMessage;
  bool isEmailSended;
  bool isEmailSending = false;
  String emailFinalBody;
  String get userEmail => user.email;
  String get goBackMessage => 'Go back';
  String get modalSendEmailText => messages.contactMessages.actions.sendEmail;
  bool get isInfoMessageEmpty => infoMessage?.isEmpty ?? true;
  bool get isErrorMessageEmpty => errorMessage?.isEmpty ?? true;
  String get emailSubject => messages.contactMessages.askAVetEmailTemplate.subjectWithInfo(pet.species, pet.name);

  @override
  void ngOnInit() {
    emailFinalBody = emailBody;
    emailContactBlocSubscription = _emailContactBloc.listen(emailContactBlocHandler);
    _onEmailSendController.add(false);
  }

  @override
  void ngOnDestroy() {
    emailContactBlocSubscription.cancel();
    _onEmailSendController.close();
  }

  void emailContactBlocHandler(EmailContactState state) {
    emailContactBlocState = state;
    if (state is EmailContactLoadFinished) {
      infoMessage = messages.contactMessages.info.success;
      isEmailSended = true;
      analyticsService.event.askAVet.logAskAVetEmailSended();
    } else if (state is EmailContactLoadFailed) {
      errorMessage = messages.contactMessages.info.error;
    }
  }

  void emailSendPressed() {
    isEmailSending = true;
    _emailContactBloc.add(EmailContactMessageSent(
      (b) => b..emailForVet = Email(subject: emailSubject, body: emailFinalBody),
    ));
    _onEmailSendController.add(true);
  }
}
