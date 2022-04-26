import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/domain/features/get_features_use_case.dart';
import 'package:common_barkibu_dart/domain/user/set_user_country_use_case.dart';
import 'package:common_barkibu_dart/services/analytics/events/access_event_analytics.dart';
import 'package:common_barkibu_dart/services/analytics_service.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:common_barkibu_dart/models/user.dart';
import 'package:common_barkibu_dart/domain/auth/set_user_use_case.dart';
import 'package:common_barkibu_dart/domain/auth/get_user_use_case.dart';
import 'package:common_barkibu_dart/domain/auth/sign_out_use_case.dart';
import 'package:common_barkibu_dart/domain/user/set_user_properties_use_case.dart';

export 'auth_event.dart';
export 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SetUserUseCase _setUserUseCase;
  final GetUserUseCase _getUserUseCase;
  final SignInWithOTPUseCase _signInWithOTPUseCase;
  final GetFeaturesUserUseCase _getFeaturesUserUseCase;
  final SignOutUseCase _signOutUseCase;
  final SetUserPropertiesUseCase _setUserPropertiesUseCase;
  final AnalyticsService _analyticsService;
  final SetUserCountryUseCase _setUserCountryUseCase;

  AuthBloc(this._setUserUseCase, this._getUserUseCase, this._getFeaturesUserUseCase, this._signOutUseCase,
      this._signInWithOTPUseCase, this._setUserPropertiesUseCase, this._analyticsService, this._setUserCountryUseCase);

  @override
  AuthState get initialState => AuthUninitialized();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStarted) {
      try {
        _analyticsService.event.access.logOpen(AnalyticsTags.APP_INITIALIZATION_DIRECT);
        yield AuthLoading();
        if (event.token != null) {
          add(SignedIn((b) => b.token = event.token));
        } else {
          if (event.otpToken != null) {
            await _signInWithOTPUseCase.signInWithOTP(event.otpToken);
          }
          final signedInUser = await _getUserUseCase.getUser();
          yield* _nextAuthState(signedInUser);
        }
      } catch (error) {
        ServiceLocator.container<MonitoringService>().capture(event: error, severityLevel: SeverityLevel.ERROR);
        yield AuthLoadingFailure();
      }
    }

    if (event is SignedIn) {
      yield AuthLoading();
      final signedInUser = await _setUserUseCase.setUser(event.token);
      if (signedInUser != null && signedInUser.country == null) {
        await _setUserCountryUseCase.setUserCountry(signedInUser);
      }
      yield* _nextAuthState(signedInUser);
    }

    if (event is SignedOut) {
      _analyticsService.event.access.logOut();
      yield AuthLoading();
      await _signOutUseCase.signOut();
      yield Unauthenticated();
    }

    if (event is UserUpdated) {
      yield AuthLoading();
      yield* _nextAuthState(event.user);
    }
  }

  Stream<AuthState> _nextAuthState(User user) async* {
    if (user != null) {
      await updateUserData();
      yield Authenticated((b) => b..user = user);
      if (user.country == null) {
        await _setUserCountryUseCase.setUserCountry(user);
      }
    } else {
      yield Unauthenticated();
    }
  }

  Future<void> updateUserData() async {
    await Future.wait([
      _setUserPropertiesUseCase.setProperties(),
      _getFeaturesUserUseCase.setFeaturesUser(),
    ]);
  }

  // ignore: missing_return
  Future<AuthState> finalAuthState() async {
    await for (AuthState state in this) {
      if ((state is Unauthenticated) || (state is Authenticated)) {
        return state;
      }
    }
  }
}
