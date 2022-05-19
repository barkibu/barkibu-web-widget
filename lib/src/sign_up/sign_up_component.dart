import 'dart:web_gl';

import 'package:angular/angular.dart';
import 'package:angular/security.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/bloc/chat/info_bloc.dart';

import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/navigation/auth_redirect_component.dart';
import 'package:web_widget/src/symptom_info/has_info_screen.dart';
import 'package:web_widget/src/symptom_info/info_screen_component.dart';
import 'package:web_widget/src/tabs/tabs_component.dart';
import 'package:web_widget/src/sign_up/email_sign_up_component.dart';
import 'package:web_widget/src/sign_up/phone_sign_up_component.dart';
import 'package:web_widget/src/sign_up/sign_up_form_component.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/routes.dart';
import 'package:web_widget/src/widget_configuration.dart';

@Component(
  selector: 'sign-up',
  templateUrl: 'sign_up_component.html',
  styleUrls: ['sign_up_component.css'],
  providers: [
    ClassProvider(InfoBloc),
  ],
  directives: [
    GoBackComponent,
    AuthRedirectComponent,
    PhoneSignUpComponent,
    EmailSignUpComponent,
    TabComponent,
    TabsComponent,
    WidgetButtonComponent,
    InfoScreenComponent,
    layoutDirectives,
    coreDirectives,
  ],
  exports: [RoutePaths],
)
class SignUpComponent extends HasInfoScreen implements OnDestroy {
  final MessagesModel messages;
  final WidgetConfiguration _config;
  final DomSanitizationService _domSanitizationService;
  bool isPhoneFormActive = true;

  @ViewChild(EmailSignUpComponent)
  EmailSignUpComponent emailSignUpForm;

  @ViewChild(PhoneSignUpComponent)
  PhoneSignUpComponent phoneSignUpForm;

  SignUpComponent(this.messages, this._config, this._domSanitizationService, InfoBloc infoBloc) {
    setInfoBloc(infoBloc);
  }

  @override
  void ngOnDestroy() {
    closeSymtomInfoBloc();
  }

  void submitForm() {
    activeForm.onSubmit();
  }

  SignUpFormComponent get activeForm {
    return isPhoneFormActive ? phoneSignUpForm : emailSignUpForm;
  }

  void setPhoneForm(_) {
    isPhoneFormActive = true;
  }

  void setEmailForm(_) {
    isPhoneFormActive = false;
  }

  bool get isLoading => activeForm != null && activeForm.isLoading;
  bool get hideEmailForm => !_config.authByEmailEnabled;
  bool get hidePhoneForm => !_config.authByPhoneEnabled;
  String get privacyUrl => _config.privacyUrl;
  bool get marketingOptInEnabled => _config.marketingOptInEnabled;

  SafeHtml get messageDataPrivacyPolicy =>
      _domSanitizationService.bypassSecurityTrustHtml(messages.authMessages.sign_up.data_privacy_policy(privacyUrl));

  bool get isCodeFormShown {
    return phoneSignUpForm != null && isPhoneFormActive && phoneSignUpForm.isCodeFormShown;
  }
}
