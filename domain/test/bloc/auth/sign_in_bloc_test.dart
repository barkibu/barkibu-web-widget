import 'package:common_barkibu_dart/bloc/bloc.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/domain/auth/sign_in_use_case.dart';
import 'package:common_barkibu_dart/services/analytics_service.dart';
import 'package:common_barkibu_dart/repositories/data/sign_in_data.dart';
import 'package:common_barkibu_dart/models/user.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/api/api_errors.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks/service_mocks.dart';

class MockSignInUseCase extends Mock implements SignInUseCase {}

class MockAuthBloc extends Mock implements AuthBloc {}

class MockLocaleService extends Mock implements LocaleService {
  @override
  MessagesModel messagesModel() {
    return MessagesModelDefault();
  }
}

final service = GetIt.instance;

void main() {
  SignInUseCase signinUseCase;
  SignInBloc signinBloc;
  AuthBloc authBloc;
  AnalyticsService analyticsService;

  setUp(() {
    signinUseCase = MockSignInUseCase();
    analyticsService = MockAnalyticsService();
    authBloc = MockAuthBloc();
    signinBloc = SignInBloc(signinUseCase, analyticsService, authBloc);

    if (!service.isRegistered<LocaleService>()) {
      service.registerSingleton<LocaleService>(MockLocaleService());
    }
  });

  tearDown(() {
    signinBloc?.close();
  });

  group('SigninBloc', () {
    test('initial state is correct', () {
      expect(signinBloc.initialState, SignInInitial());
    });

    test('validating incoming event', () {
      expectLater(
        signinBloc,
        emitsInOrder([SignInInitial(), SignInLoading(), SignInFailure((b) => b..error = 'Data not valid')]),
      );
      signinBloc.add(SingInSignInSubmitted());
    });

    group('Submitting a valid data in event', () {
      var validDataEvent = SingInSignInSubmitted(
        (b) => b
          ..email = 'john.doe@example.com'
          ..password = 'Password',
      );

      group('when signinUseCase returns SignInData', () {
        // ignore: missing_required_param
        final signInData = SignInData(User(), 'token');

        setUp(() {
          when(signinUseCase.signIn(any)).thenAnswer((_) => Future.value(signInData));
        });

        test('yields SigninInitial event', () {
          expectLater(
            signinBloc,
            emitsInOrder([SignInInitial(), SignInLoading(), SignInInitial()]),
          );
          signinBloc.add(validDataEvent);
        });

        test('makes a call to signinUseCase', () async {
          signinBloc.add(validDataEvent);
          var invocation = await untilCalled(signinUseCase.signIn(any));
          SignInParams params = invocation.positionalArguments.first;
          expect(params.email, validDataEvent.email);
          expect(params.password, validDataEvent.password);
        });

        test('makes a call to authBloc', () async {
          signinBloc.add(validDataEvent);
          await untilCalled(authBloc.add(any));
          verify(authBloc.add(SignedIn((b) => b..token = signInData.accessToken)));
        });
      });

      group('when signInUseCase raises an error', () {
        setUp(() {
          when(signinUseCase.signIn(any)).thenAnswer((_) => throw Exception('something happened'));
        });

        test('yields SigninFailure when exception is raised', () {
          expectLater(
            signinBloc,
            emitsInOrder(
                [SignInInitial(), SignInLoading(), SignInFailure((b) => b..error = 'Exception: something happened')]),
          );
          signinBloc.add(validDataEvent);
        });
      });

      group('when signUpUseCase returns error response', () {
        final errorResponse = ApiErrorResponse('Something went wrong');

        setUp(() {
          when(signinUseCase.signIn(any)).thenAnswer((_) => Future.value(errorResponse));
        });

        test('yields SignInFailure state', () {
          expectLater(
            signinBloc,
            emitsInOrder(
                [SignInInitial(), SignInLoading(), SignInFailure((b) => b..error = 'Email or password invalid')]),
          );
          signinBloc.add(validDataEvent);
        });
      });
    });
  });
}
