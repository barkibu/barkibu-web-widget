import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';

import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/navigation/auth_redirect_component.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/routes.dart';
import 'package:web_widget/src/sign_in/sign_in_error_component.dart';
import 'package:web_widget/src/sign_in/sign_in_form.dart';
import 'package:web_widget/src/sign_in/sign_in_form_component.dart';

SignInBloc signInBlocFactory(AuthBloc authBloc) => ServiceLocator.container<SignInBloc>(param1: authBloc);

@Component(selector: 'email-sign-in', templateUrl: 'email_sign_in_component.html', styleUrls: [
  'email_sign_in_component.css'
], providers: [
  FactoryProvider(SignInBloc, signInBlocFactory),
], directives: [
  GoBackComponent,
  SignInErrorComponent,
  AuthRedirectComponent,
  WidgetButtonComponent,
  layoutDirectives,
  formDirectives,
  coreDirectives,
  routerDirectives
], pipes: [
  BlocPipe
], exports: [
  RoutePaths
])
class EmailSignInComponent implements OnDestroy, SignInFormComponent {
  SignInBloc signInBloc;
  ControlGroup signInForm;
  AuthData model = AuthData();
  MessagesModel messages;
  bool submitted = false;

  EmailSignInComponent(this.signInBloc, this.messages, SignInForm formBuilder) {
    signInForm = formBuilder.buildEmailSignInFormControl();
  }

  @override
  void ngOnDestroy() {
    signInBloc.close();
  }

  bool shouldShowError(AbstractControlDirective control) {
    return submitted && !control.valid;
  }

  @override
  bool get isLoading => signInBloc.state is SignInLoading;

  @override
  void onSubmit() {
    submitted = true;
    var event = SingInSignInSubmitted((b) => (b
      ..email = model.email
      ..password = model.password));
    if (signInForm.valid) {
      signInBloc.add(event);
    }
  }
}
