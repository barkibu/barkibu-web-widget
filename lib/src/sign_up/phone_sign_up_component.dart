import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/bloc/chat/info_bloc.dart';
import 'package:web_widget/src/home/terms_of_service_component.dart';
import 'package:web_widget/src/route_paths.dart';
import 'package:web_widget/src/sign_up/sign_up_form.dart';
import 'package:web_widget/src/sign_up/sign_up_form_component.dart';
import 'package:web_widget/src/sign_up/phone_sign_up_error_component.dart';
import 'package:web_widget/src/widget_configuration.dart';

PhoneSignUpBloc signUpBlocFactory(AuthBloc authBloc) => ServiceLocator.container<PhoneSignUpBloc>(param1: authBloc);

@Component(
  selector: 'phone-sign-up',
  templateUrl: 'phone_sign_up_component.html',
  styleUrls: ['phone_sign_up_component.css'],
  providers: [FactoryProvider(PhoneSignUpBloc, signUpBlocFactory), ClassProvider(SignUpForm)],
  directives: [formDirectives, coreDirectives, routerDirectives, PhoneSignUpErrorComponent, TermsOfServiceComponent],
  pipes: [BlocPipe],
  exports: [RoutePaths],
)
class PhoneSignUpComponent extends SignUpFormComponent implements OnDestroy, OnInit {
  PhoneSignUpBloc signUpBloc;
  MessagesModel messages;
  ControlGroup signUpForm;
  AuthData model = AuthData();
  final WidgetConfiguration config;
  final InfoBloc _infoBloc;
  bool isPhoneSubmitted = false;
  bool isCodeSubmitted = false;
  bool isCodeFormShown = false;

  PhoneSignUpComponent(this.signUpBloc, this.messages, SignUpForm formBuilder, this.config, this._infoBloc) {
    signUpForm = formBuilder.buildPhoneSignUpFormControl();
    signUpBloc.listen(signUpBlocListener);
  }
  @override
  void ngOnInit() {
    model.phoneNumberPrefix = config.defaultPhonePrefix;
  }

  @override
  void ngOnDestroy() {
    signUpBloc.close();
  }

  @override
  void onSubmit() {
    if (isCodeFormShown) {
      isCodeSubmitted = true;
      if (model.isValidForPhoneSignUp()) {
        signUpBloc.add(PhoneSignUpCodeEntered((b) => b.code = model.code));
      }
    } else {
      isPhoneSubmitted = true;
      if (model.isValidForPhoneSignUpVerification()) {
        signUpBloc.add(PhoneSignUpStarted((b) => b
          ..name = model.firstName
          ..lastName = model.lastName
          ..phoneNumberPrefix = model.phoneNumberPrefix
          ..phoneNumber = model.phoneNumber
          ..checkboxValue = model.checkboxValue));
      }
    }
  }

  @override
  bool get isLoading {
    return signUpBloc.state is PhoneSignUpCodeSendInProgress || signUpBloc.state is PhoneSignUpVerificationInProgress;
  }

  void signUpBlocListener(PhoneSignUpState state) {
    if (state is PhoneSignUpCodeSendSuccess) {
      isCodeFormShown = true;
    }
  }

  bool get externalToSEnabled => config.externalToSEnabled;

  String get brandName => config.brandName;

  String get terms_and_condition_url => messages.authMessages.sign_up.terms_and_condition_url;

  String get terms_and_privacy_url => messages.authMessages.sign_up.privacy_url;

  bool get isLastNameRequired => config.lastNameRequired;

  bool shouldShowError(AbstractControlDirective control) {
    return !control.valid && (control.touched || isPhoneSubmitted);
  }

  bool shouldShowCodeError(AbstractControlDirective control) {
    return !control.valid && isCodeSubmitted;
  }

  void showTermsAndConditions() => _infoBloc.add(TermsAndConditionsOpened());

  void resendCode() {
    signUpBloc.add(PhoneSignUpCodeResendRequested());
  }
}
