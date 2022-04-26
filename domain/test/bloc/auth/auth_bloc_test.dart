import 'package:common_barkibu_dart/bloc/bloc.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/domain/user/set_user_country_use_case.dart';
import '../../service_locator.dart' as test_service_locator;
import 'package:common_barkibu_dart/domain/features/get_features_use_case.dart';
import 'package:common_barkibu_dart/models/user.dart';
import 'package:common_barkibu_dart/domain/auth/set_user_use_case.dart';
import 'package:common_barkibu_dart/domain/auth/get_user_use_case.dart';
import 'package:common_barkibu_dart/domain/auth/sign_out_use_case.dart';
import 'package:common_barkibu_dart/domain/user/set_user_properties_use_case.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks/service_mocks.dart';

class MockSetUserUseCase extends Mock implements SetUserUseCase {}

class MockSetUserCountryUseCase extends Mock implements SetUserCountryUseCase {}

class MockGetUserUseCase extends Mock implements GetUserUseCase {}

class MockSignOutUseCase extends Mock implements SignOutUseCase {}

class MockSignInWithOTPUseCase extends Mock implements SignInWithOTPUseCase {}

class MockSetUserPropertiesUseCase extends Mock implements SetUserPropertiesUseCase {}

class MockGetFeaturesUserUseCase extends Mock implements GetFeaturesUserUseCase {}

void main() {
  test_service_locator.ServiceLocator.setup();
  test_service_locator.services.registerSingleton<MonitoringService>(MockMonitoringService());

  SetUserUseCase setUserUseCase;
  GetUserUseCase getUserUseCase;
  GetFeaturesUserUseCase getFeatureFlagsUserUseCase;
  SignInWithOTPUseCase signInWithOTPUseCase;
  SignOutUseCase signOutUseCase;
  AnalyticsService analyticsService;
  AuthBloc authBloc;
  MockSetUserPropertiesUseCase setUserPropertiesUseCase;
  MockSetUserCountryUseCase setUserCountryUseCase;

  Matcher isUserAuthenticated(user) => predicate((state) => state is Authenticated && state.user == user);

  setUp(() {
    setUserUseCase = MockSetUserUseCase();
    setUserCountryUseCase = MockSetUserCountryUseCase();
    getUserUseCase = MockGetUserUseCase();
    getFeatureFlagsUserUseCase = MockGetFeaturesUserUseCase();
    signOutUseCase = MockSignOutUseCase();
    signInWithOTPUseCase = MockSignInWithOTPUseCase();
    setUserPropertiesUseCase = MockSetUserPropertiesUseCase();
    analyticsService = MockAnalyticsService();
    authBloc = AuthBloc(
      setUserUseCase,
      getUserUseCase,
      getFeatureFlagsUserUseCase,
      signOutUseCase,
      signInWithOTPUseCase,
      setUserPropertiesUseCase,
      analyticsService,
      setUserCountryUseCase,
    );
    when(setUserPropertiesUseCase.setProperties()).thenAnswer((_) => Future.value());
    when(getFeatureFlagsUserUseCase.setFeaturesUser()).thenAnswer((_) => Future.value());
  });

  tearDown(() {
    authBloc?.close();
  });

  group('AuthBloc', () {
    test('initial state is correct', () {
      expect(authBloc.state, AuthUninitialized());
    });

    group('AppStarted event', () {
      group('when getUserUseCase returns null', () {
        setUp(() {
          when(getUserUseCase.getUser()).thenAnswer((_) => Future.value(null));
        });

        test('it yields unauthenticated state', () {
          expectLater(
            authBloc,
            emitsInOrder([AuthUninitialized(), AuthLoading(), Unauthenticated()]),
          );
          authBloc.add(AppStarted());
        });

        test('does not set user properties', () async {
          authBloc.add(AppStarted());
          await authBloc.finalAuthState();
          verifyNever(setUserPropertiesUseCase.setProperties());
        });
      });

      group('when getUserUseCase returns user', () {
        User user;
        String token;

        setUp(() {
          user = User(email: 'random@random.com', firstName: 'John', lastName: 'Doe', id: 1, country: null);
          token = 'jwt-token';
          when(getUserUseCase.getUser()).thenAnswer((_) => Future.value(user));
          when(setUserUseCase.setUser(token)).thenAnswer((_) => Future.value(user));
        });

        test('it yields authenticated state', () {
          expectLater(
            authBloc,
            emitsInOrder([AuthUninitialized(), AuthLoading(), isUserAuthenticated(user)]),
          );
          authBloc.add(AppStarted());
        });

        test('makes a call to set user properties use case', () async {
          authBloc.add(AppStarted());
          await authBloc.finalAuthState();
          verify(setUserPropertiesUseCase.setProperties());
        });

        test('should call SetUserCountry use case', () async {
          authBloc.add(SignedIn((b) => b..token = token));
          await authBloc.close();
          verify(setUserCountryUseCase.setUserCountry(user));
        });
      });

      group('when AppStarted has a token', () {
        final token = 'jwt_token';
        User user;

        setUp(() {
          // ignore: missing_required_param
          user = User();
          when(setUserUseCase.setUser(token)).thenAnswer((_) => Future.value(user));
        });

        test('it yields authenticated state', () {
          expectLater(
            authBloc,
            emitsInOrder([AuthUninitialized(), AuthLoading(), Authenticated((b) => b..user = user)]),
          );
          authBloc.add(AppStarted((b) => b..token = token));
        });
      });

      group('when AppStarted has a valid OTP token', () {
        final otpToken = 'jwt_otp_token';
        // ignore: missing_required_param
        final user = User(firstName: 'Bob');

        setUp(() {
          when(signInWithOTPUseCase.signInWithOTP(otpToken)).thenAnswer((_) => Future.value(null));
          when(getUserUseCase.getUser()).thenAnswer((_) => Future.value(user));
        });

        test('it yields authenticated state', () {
          expectLater(
            authBloc,
            emitsInOrder([AuthUninitialized(), AuthLoading(), Authenticated((b) => b..user = user)]),
          );
          authBloc.add(AppStarted((b) => b..otpToken = otpToken));
        });
      });
    });

    group('SignedIn event', () {
      final token = 'jwt_token';

      group('when setUserUseCase returns null', () {
        setUp(() {
          when(setUserUseCase.setUser(token)).thenAnswer((_) => Future.value(null));
        });

        test('it yields unauthenticated state', () {
          expectLater(
            authBloc,
            emitsInOrder([AuthUninitialized(), AuthLoading(), Unauthenticated()]),
          );
          authBloc.add(SignedIn((b) => b..token = token));
        });

        test('does not set user properties', () async {
          authBloc.add(SignedIn((b) => b..token = token));
          await authBloc.finalAuthState();
          verifyNever(setUserPropertiesUseCase.setProperties());
        });
      });

      group('when setUserUseCase returns user', () {
        User user;

        setUp(() {
          // ignore: missing_required_param
          user = User();
          when(setUserUseCase.setUser(token)).thenAnswer((_) => Future.value(user));
        });

        test('it yields authenticated state', () {
          expectLater(
            authBloc,
            emitsInOrder([AuthUninitialized(), AuthLoading(), Authenticated((b) => b..user = user)]),
          );
          authBloc.add(SignedIn((b) => b..token = token));
        });

        test('makes a call to set user properties use case and user feature flags', () async {
          authBloc.add(SignedIn((b) => b..token = token));
          await authBloc.finalAuthState();
          verify(setUserPropertiesUseCase.setProperties());
          verify(getFeatureFlagsUserUseCase.setFeaturesUser());
        });
      });
    });

    group('SignedOut event', () {
      test('it yields unauthenticated state', () {
        expectLater(
          authBloc,
          emitsInOrder([AuthUninitialized(), AuthLoading(), Unauthenticated()]),
        );
        authBloc.add(SignedOut());
      });
    });

    group('UserUpdated event', () {
      // ignore: missing_required_param
      final user = User(firstName: 'Bob');
      // ignore: missing_required_param
      final updatedUser = User(firstName: 'Alice');

      setUp(() async {
        when(getUserUseCase.getUser()).thenAnswer((_) => Future.value(user));
        authBloc.add(AppStarted());
        await expectLater(authBloc, emitsThrough(isUserAuthenticated(user)));
      });

      test('it yields authenticated state with new user', () {
        expectLater(
          authBloc,
          emitsInOrder([isUserAuthenticated(user), AuthLoading(), isUserAuthenticated(updatedUser)]),
        );
        authBloc.add(UserUpdated((b) => b..user = updatedUser));
      });

      test('calls setUserPropertiesUseCase', () async {
        authBloc.add(UserUpdated((b) => b..user = updatedUser));
        await expectLater(authBloc, emitsThrough(isUserAuthenticated(updatedUser)));
        verify(setUserPropertiesUseCase.setProperties()).called(2);
      });
    });

    group('UserOffline case', () {
      // ignore: missing_required_param
      final user = User(firstName: 'Bob');
      setUp(() async {
        when(getUserUseCase.getUser()).thenAnswer((_) => Future.value(user));
        authBloc.add(AppStarted());
        await expectLater(authBloc, emitsThrough(isUserAuthenticated(user)));
      });
      test('it yields auth not connection state when user if offline', () {
        when(getUserUseCase.getUser()).thenThrow(Exception('boom'));
        authBloc.add(AppStarted());
        expectLater(
          authBloc,
          emitsInOrder([Authenticated((b) => b..user = user), AuthLoading(), AuthLoadingFailure()]),
        );
      });
    });
  });

  group('finalAuthState', () {
    group('when user is not authenticated', () {
      setUp(() async {
        when(getUserUseCase.getUser()).thenAnswer((_) => Future.value(null));
      });

      test('it returns Unauthenticated state', () async {
        authBloc.add(AppStarted());
        expect(await authBloc.finalAuthState(), isA<Unauthenticated>());
      });
    });

    group('when user is not authenticated', () {
      // ignore: missing_required_param
      final user = User();

      setUp(() async {
        when(getUserUseCase.getUser()).thenAnswer((_) => Future.value(user));
      });

      test('it returns Unauthenticated state', () async {
        authBloc.add(AppStarted());
        expect(await authBloc.finalAuthState(), isUserAuthenticated(user));
      });
    });

    // Following tests are very similar to the previous two. The only difference
    // is that `finalAuthState` is called after bloc state is set to final state
    group('when bloc state is Unauthenticated', () {
      setUp(() async {
        when(getUserUseCase.getUser()).thenAnswer((_) => Future.value(null));

        authBloc.add(AppStarted());
        await expectLater(authBloc, emitsThrough(isA<Unauthenticated>()));
      });

      test('it returns Unauthenticated state', () async {
        expect(await authBloc.finalAuthState(), isA<Unauthenticated>());
      });
    });

    group('when bloc state is Authenticated', () {
      // ignore: missing_required_param
      final user = User();

      setUp(() async {
        when(getUserUseCase.getUser()).thenAnswer((_) => Future.value(user));

        authBloc.add(AppStarted());
        await expectLater(authBloc, emitsThrough(isUserAuthenticated(user)));
      });

      test('it returns Unauthenticated state', () async {
        expect(await authBloc.finalAuthState(), isUserAuthenticated(user));
      });
    });
  });
}
