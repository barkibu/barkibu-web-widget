import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/bloc/auth/sign_in/sign_in_state.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:web_widget/src/alerts/alert_component.dart';

@Component(
    selector: 'sign-in-error',
    templateUrl: 'sign_in_error_component.html',
    directives: [coreDirectives, AlertComponent])
class SignInErrorComponent {
  @Input()
  SignInState state;

  final MessagesModel messages;

  SignInErrorComponent(this.messages);

  bool get isSignInStateError => state is SignInFailure;
  String get errorMessage => messages.validationMessages.validate.emailPasswordIncorrect;
}
