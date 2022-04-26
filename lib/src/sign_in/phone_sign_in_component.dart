import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/sign_in/sign_in_form.dart';
import 'package:web_widget/src/sign_in/sign_in_form_component.dart';
import 'package:web_widget/src/sign_in/phone_sign_in_error_component.dart';
import 'package:web_widget/src/widget_configuration.dart';

PhoneSignInBloc signInBlocFactory(AuthBloc authBloc) => ServiceLocator.container<PhoneSignInBloc>(param1: authBloc);

@Component(selector: 'phone-sign-in', templateUrl: 'phone_sign_in_component.html', styleUrls: [
  'phone_sign_in_component.css'
], providers: [
  FactoryProvider(PhoneSignInBloc, signInBlocFactory),
], directives: [
  formDirectives,
  coreDirectives,
  PhoneSignInErrorComponent
], pipes: [
  BlocPipe
])
class PhoneSignInComponent implements OnDestroy, OnInit, SignInFormComponent {
  PhoneSignInBloc signInBloc;
  MessagesModel messages;
  ControlGroup signInForm;
  AuthData model = AuthData();
  final WidgetConfiguration config;
  bool isPhoneSubmitted = false;
  bool isCodeSubmitted = false;
  bool isCodeFormShown = false;

  PhoneSignInComponent(this.signInBloc, this.messages, SignInForm formBuilder, this.config) {
    signInForm = formBuilder.buildPhoneSignInFormControl();
    signInBloc.listen(signInBlocListener);
  }

  @override
  void ngOnInit() {
    model.phoneNumberPrefix = config.defaultPhonePrefix;
  }

  @override
  void ngOnDestroy() {
    signInBloc.close();
  }

  @override
  void onSubmit() {
    if (isCodeFormShown) {
      isCodeSubmitted = true;
      if (model.isValidForPhoneSignIn()) {
        signInBloc.add(PhoneSignInCodeEntered((b) => b.code = model.code));
      }
    } else {
      isPhoneSubmitted = true;
      if (model.isValidForPhoneSignInVerification()) {
        signInBloc.add(PhoneSignInStarted((b) => b
          ..phoneNumberPrefix = model.phoneNumberPrefix
          ..phoneNumber = model.phoneNumber));
      }
    }
  }

  @override
  bool get isLoading {
    return signInBloc.state is PhoneSignInCodeSendInProgress || signInBloc.state is PhoneSignInVerificationInProgress;
  }

  void signInBlocListener(PhoneSignInState state) {
    if (state is PhoneSignInCodeSendSuccess) {
      isCodeFormShown = true;
    }
  }

  bool shouldShowError(AbstractControlDirective control) {
    return !control.valid && (control.touched || isPhoneSubmitted);
  }

  bool shouldShowCodeError(AbstractControlDirective control) {
    return !control.valid && isCodeSubmitted;
  }

  void resendCode() {
    signInBloc.add(PhoneSignInCodeResendRequested());
  }
}
