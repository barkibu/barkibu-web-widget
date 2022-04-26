import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/bloc/auth/sign_in/sign_in_event.dart';
import 'package:common_barkibu_dart/bloc/auth/sign_in/sign_in_state.dart';
import 'package:common_barkibu_dart/domain/auth/sign_in_use_case.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/services/analytics_service.dart';
import 'package:common_barkibu_dart/services/locale_service.dart';
import 'package:common_barkibu_dart/viewmodels/auth/auth_data.dart';
import 'package:common_barkibu_dart/bloc/auth/authentication/auth_bloc.dart';
import 'package:common_barkibu_dart/repositories/data/sign_in_data.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase _signInUseCase;
  final AuthData data = AuthData();
  final AnalyticsService _analyticsService;
  final AuthBloc _authBloc;

  String get credentialError =>
      ServiceLocator.container<LocaleService>().messagesModel().authMessages.sign_in.credential_error;

  SignInBloc(this._signInUseCase, this._analyticsService, this._authBloc);

  @override
  SignInState get initialState => SignInInitial();

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SingInSignInSubmitted) {
      yield SignInLoading();

      data.email = event.email ?? data.email;
      data.password = event.password ?? data.password;

      if (data.isSigninValid()) {
        try {
          var result = await _signInUseCase.signIn(data.toSignInParams());
          if (result is SignInData) {
            _authBloc.add(SignedIn((b) => b..token = result.accessToken));
            _analyticsService.event.access.logSignInSuccess();
            yield SignInInitial();
          } else {
            _analyticsService.event.access.logSignInError();
            yield SignInFailure((b) => b..error = credentialError);
          }
        } catch (error) {
          _analyticsService.event.access.logSignInError();
          yield SignInFailure((b) => b..error = error.toString());
        }
      } else {
        yield SignInFailure((b) => b..error = 'Data not valid');
      }
    }
  }
}
