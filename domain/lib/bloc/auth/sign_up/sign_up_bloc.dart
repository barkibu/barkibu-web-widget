import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/bloc/auth/sign_up/sign_up_event.dart';
import 'package:common_barkibu_dart/bloc/auth/sign_up/sign_up_state.dart';
import 'package:common_barkibu_dart/domain/auth/sign_up_use_case.dart';
import 'package:common_barkibu_dart/services/analytics_service.dart';
import 'package:common_barkibu_dart/viewmodels/auth/auth_data.dart';
import 'package:common_barkibu_dart/bloc/auth/authentication/auth_bloc.dart';
import 'package:common_barkibu_dart/repositories/data/sign_in_data.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase _signUpUseCase;
  final AnalyticsService _analyticsService;
  final AuthBloc _authBloc;
  final AuthData _data = AuthData();

  SignUpBloc(this._signUpUseCase, this._analyticsService, this._authBloc);

  @override
  SignUpState get initialState => SignUpInitial();

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpSubmitted) {
      _analyticsService.event.access.logSignUpCreate();

      yield SignUpLoading();

      _data.firstName = event.firstName ?? _data.firstName;
      _data.lastName = event.lastName ?? _data.lastName;
      _data.email = event.email ?? _data.email;
      _data.phoneNumberPrefix = event.phoneNumberPrefix ?? _data.phoneNumberPrefix;
      _data.phoneNumber = event.phoneNumber ?? _data.phoneNumber;
      _data.checkboxValue = event.checkboxValue ?? _data.checkboxValue;
      _data.password = event.password ?? _data.password;
      _data.passwordRepeat = event.passwordRepeat ?? _data.passwordRepeat;

      if (_data.isSignupValid()) {
        try {
          var result = await _signUpUseCase.signUp(_data.toSignUpParams());
          if (result is SignInData) {
            _authBloc.add(SignedIn((b) => b..token = result.accessToken));
            _analyticsService.event.access.logSignUpCompleted();
            yield SignUpInitial();
          } else {
            yield SignUpFailure((b) => b..error = result.error);
          }
        } catch (error) {
          yield SignUpFailure((b) => b..error = error.toString());
        }
      } else {
        yield SignUpFailure((b) => b..error = 'Data not valid');
      }
    }
  }
}
