import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/bloc/chat/info_bloc.dart';
import 'package:web_widget/src/route_paths.dart';
import 'package:web_widget/src/sign_up/sign_up_error_component.dart';
import 'package:web_widget/src/sign_up/sign_up_form.dart';
import 'package:web_widget/src/sign_up/sign_up_form_component.dart';
import 'package:web_widget/src/widget_configuration.dart';

SignUpBloc signUpBlocFactory(AuthBloc authBloc) => ServiceLocator.container<SignUpBloc>(param1: authBloc);

@Component(selector: 'email-sign-up', templateUrl: 'email_sign_up_component.html', styleUrls: [
  'email_sign_up_component.css'
], providers: [
  FactoryProvider(SignUpBloc, signUpBlocFactory),
  ClassProvider(SignUpForm)
], directives: [
  SignUpErrorComponent,
  formDirectives,
  routerDirectives,
  coreDirectives,
], pipes: [
  BlocPipe
], exports: [
  RoutePaths
])
class EmailSignUpComponent extends SignUpFormComponent implements OnDestroy {
  SignUpBloc signUpBloc;
  final InfoBloc _infoBloc;
  ControlGroup signUpForm;
  AuthData model = AuthData();
  final WidgetConfiguration config;
  MessagesModel messages;
  bool submitted = false;

  EmailSignUpComponent(this.signUpBloc, this.messages, SignUpForm formBuilder, this.config, this._infoBloc) {
    signUpForm = formBuilder.buildSignUpFormControl();
  }

  @override
  void ngOnDestroy() {
    signUpBloc.close();
  }

  bool shouldShowError(AbstractControlDirective control) {
    return !control.valid && (control.touched || submitted);
  }

  bool shouldShowPasswordRepeatError(NgControlGroup passwordGroup, NgControlName passwordRepeat) {
    return passwordRepeat.dirty && passwordGroup.errors != null;
  }

  bool get externalToSEnabled => config.externalToSEnabled;

  String get brandName => config.brandName;

  String get marketingBrandName => config.marketingBrandName;

  String get affiliatesUrl => config.affiliatesUrl;

  String get terms_and_condition_url => messages.authMessages.sign_up.terms_and_condition_url;

  String get terms_and_privacy_url => messages.authMessages.sign_up.privacy_url;

  bool get isLastNameRequired => config.lastNameRequired;

  bool get submitAuthorized => model.checkboxValue || marketingBrandName.isNotEmpty;

  bool get marketingOptInEnabled => config.marketingOptInEnabled;

  SignUpSubmitted buildSubmitEvent() {
    return SignUpSubmitted((b) => (b
      ..firstName = model.firstName
      ..lastName = model.lastName
      ..email = model.email
      ..checkboxValue = submitAuthorized
      ..password = model.password
      ..passwordRepeat = model.passwordRepeat));
  }

  @override
  void onSubmit() {
    submitted = true;
    if (signUpForm.valid) {
      signUpBloc.add(buildSubmitEvent());
    }
  }

  void showTermsAndConditions() => _infoBloc.add(TermsAndConditionsOpened());

  @override
  bool get isLoading => signUpBloc.state is SignUpLoading;
}
