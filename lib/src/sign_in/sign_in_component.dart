import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';

import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/navigation/auth_redirect_component.dart';
import 'package:web_widget/src/sign_in/phone_sign_in_component.dart';
import 'package:web_widget/src/sign_in/sign_in_form.dart';
import 'package:web_widget/src/sign_in/sign_in_form_component.dart';
import 'package:web_widget/src/tabs/tabs_component.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/routes.dart';
import 'package:web_widget/src/widget_configuration.dart';

import 'email_sign_in_component.dart';

@Component(selector: 'sign-in', templateUrl: 'sign_in_component.html', styleUrls: [
  'sign_in_component.css'
], providers: [
  ClassProvider(SignInForm),
], directives: [
  GoBackComponent,
  AuthRedirectComponent,
  PhoneSignInComponent,
  EmailSignInComponent,
  TabComponent,
  TabsComponent,
  WidgetButtonComponent,
  layoutDirectives,
  coreDirectives,
], exports: [
  RoutePaths
])
class SignInComponent {
  final MessagesModel messages;
  final WidgetConfiguration _config;
  final AuthBloc _authBloc;
  bool isPhoneFormActive = true;

  @ViewChild(EmailSignInComponent)
  EmailSignInComponent emailSignInForm;

  @ViewChild(PhoneSignInComponent)
  PhoneSignInComponent phoneSignInForm;

  SignInComponent(this.messages, this._config, this._authBloc);

  void submitForm() {
    activeForm.onSubmit();
  }

  SignInFormComponent get activeForm {
    return isPhoneFormActive ? phoneSignInForm : emailSignInForm;
  }

  void setPhoneForm(_) {
    isPhoneFormActive = true;
  }

  void setEmailForm(_) {
    isPhoneFormActive = false;
  }

  bool get isLoading => (activeForm != null && activeForm.isLoading) || _authBloc.state is AuthLoading;
  bool get hideEmailForm => !_config.authByEmailEnabled;
  bool get hidePhoneForm => !_config.authByPhoneEnabled;

  bool get isCodeFormShown {
    return phoneSignInForm != null && isPhoneFormActive && phoneSignInForm.isCodeFormShown;
  }
}
