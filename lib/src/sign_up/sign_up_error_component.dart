import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/bloc/auth/sign_up/sign_up_state.dart';
import 'package:web_widget/src/alerts/alert_component.dart';

@Component(
    selector: 'sign-up-error',
    templateUrl: 'sign_up_error_component.html',
    directives: [coreDirectives, AlertComponent])
class SignUpErrorComponent {
  @Input()
  SignUpState state;

  bool isSignUpStateError() {
    return state is SignUpFailure;
  }

  String get errorMessage => (state as SignUpFailure).error;
}
