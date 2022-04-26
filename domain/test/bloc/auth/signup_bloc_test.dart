import 'package:common_barkibu_dart/bloc/bloc.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/domain/auth/sign_up_use_case.dart';
import 'package:common_barkibu_dart/services/analytics_service.dart';
import 'package:common_barkibu_dart/repositories/data/sign_in_data.dart';
import 'package:common_barkibu_dart/models/user.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/api/api_errors.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import '../../service_locator.dart' as test_service_locator;

import '../../mocks/service_mocks.dart';

class MockSignUpUseCase extends Mock implements SignUpUseCase {}

class MockAuthBloc extends Mock implements AuthBloc {}

void main() {
  SignUpUseCase signUpUseCase;
  SignUpBloc signUpBloc;
  AuthBloc authBloc;
  AnalyticsService analyticsService;

  test_service_locator.ServiceLocator.setup();

  setUp(() {
    signUpUseCase = MockSignUpUseCase();
    analyticsService = MockAnalyticsService();
    authBloc = MockAuthBloc();
    signUpBloc = SignUpBloc(signUpUseCase, analyticsService, authBloc);
  });

  tearDown(() {
    signUpBloc?.close();
  });

  group('SignUpBloc', () {
    test('initial state is correct', () {
      expect(signUpBloc.initialState, SignUpInitial());
    });

    test('validating incoming event', () {
      expectLater(
        signUpBloc,
        emitsInOrder([SignUpInitial(), SignUpLoading(), SignUpFailure((b) => b..error = 'Data not valid')]),
      );
      signUpBloc.add(SignUpSubmitted((b) => b
        ..email = 'this is not an email'
        ..password = 'Password'
        ..passwordRepeat = 'Password'
        ..checkboxValue = false));
    });

    group('Submitting a valid data in event', () {
      var validDataEvent = SignUpSubmitted((b) => b
        ..firstName = 'John'
        ..lastName = 'Doe'
        ..email = 'john.doe@example.com'
        ..phoneNumberPrefix = '+37'
        ..phoneNumber = '21212121'
        ..password = 'Password'
        ..passwordRepeat = 'Password'
        ..checkboxValue = true);

      group('when signUpUseCase case returns signInData', () {
        // ignore: missing_required_param
        final signInData = SignInData(User(), 'token');

        setUp(() {
          when(signUpUseCase.signUp(any)).thenAnswer((_) => Future.value(signInData));
        });

        test('yields SignUpInitial event', () {
          expectLater(
            signUpBloc,
            emitsInOrder([SignUpInitial(), SignUpLoading(), SignUpInitial()]),
          );
          signUpBloc.add(validDataEvent);
        });

        test('makes a call to signUpUseCase', () async {
          signUpBloc.add(validDataEvent);
          var invocation = await untilCalled(signUpUseCase.signUp(any));
          SignUpParams params = invocation.positionalArguments.first;
          expect(params.firstName, validDataEvent.firstName);
          expect(params.lastName, validDataEvent.lastName);
          expect(params.email, validDataEvent.email);
          expect(params.password, validDataEvent.password);
          expect(params.phoneNumberPrefix, validDataEvent.phoneNumberPrefix);
          expect(params.phoneNumber, validDataEvent.phoneNumber);
        });

        test('makes a call to authBloc', () async {
          signUpBloc.add(validDataEvent);
          await untilCalled(authBloc.add(any));
          verify(authBloc.add(SignedIn((b) => b..token = signInData.accessToken)));
        });
      });

      group('when signUpUseCase raises an exception', () {
        setUp(() {
          when(signUpUseCase.signUp(any)).thenAnswer((_) => throw Exception('something happened'));
        });

        test('yields SignUpFailure when exception is raised', () {
          expectLater(
            signUpBloc,
            emitsInOrder(
                [SignUpInitial(), SignUpLoading(), SignUpFailure((b) => b..error = 'Exception: something happened')]),
          );
          signUpBloc.add(validDataEvent);
        });
      });

      group('when signUpUseCase returns error response', () {
        final errorResponse = ApiErrorResponse('Email already taken');

        setUp(() {
          when(signUpUseCase.signUp(any)).thenAnswer((_) => Future.value(errorResponse));
        });

        test('yields SignUpFailure state', () {
          expectLater(
            signUpBloc,
            emitsInOrder([SignUpInitial(), SignUpLoading(), SignUpFailure((b) => b..error = 'Email already taken')]),
          );
          signUpBloc.add(validDataEvent);
        });
      });
    });
  });
}
