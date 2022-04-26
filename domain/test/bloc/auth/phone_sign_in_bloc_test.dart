import 'package:common_barkibu_dart/bloc/auth/phone_sign_in/phone_sign_in_bloc.dart';
import 'package:common_barkibu_dart/bloc/auth/phone_sign_in/phone_sign_in_event.dart';
import 'package:common_barkibu_dart/bloc/auth/phone_sign_in/phone_sign_in_state.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/domain/auth/phone_sign_in_use_case.dart';
import 'package:common_barkibu_dart/repositories/auth/phone_sign_in_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import '../../service_locator.dart' as test_service_locator;

class MockPhoneSignInUseCase extends Mock implements PhoneSignInUseCase {}

class MockAuthBloc extends Mock implements AuthBloc {}

void main() {
  test_service_locator.ServiceLocator.setup();

  PhoneSignInUseCase useCase;
  AuthBloc authBloc;
  PhoneSignInBloc phoneSignInBloc;

  final validStartEvent = PhoneSignInStarted((b) => b
    ..phoneNumber = '123456'
    ..phoneNumberPrefix = '+7');

  final invalidStartEvent = PhoneSignInStarted((b) => b
    ..phoneNumber = ''
    ..phoneNumberPrefix = '');

  setUp(() {
    useCase = MockPhoneSignInUseCase();
    authBloc = MockAuthBloc();
    phoneSignInBloc = PhoneSignInBloc(useCase, authBloc);
  });

  tearDown(() {
    phoneSignInBloc?.close();
  });

  test('initial state', () {
    expect(phoneSignInBloc.state, PhoneSignInInitial());
  });

  group('PhoneSignInStarted event', () {
    test('yields validation error state when data is not valid', () {
      expectLater(
        phoneSignInBloc,
        emitsInOrder([PhoneSignInInitial(), PhoneSignInValidationFailure()]),
      );
      phoneSignInBloc.add(invalidStartEvent);
    });

    test('yields PhoneSignInCodeSendSuccess state when code was sent', () {
      final authDataMatcher = predicate((AuthData data) =>
          data.phoneNumber == validStartEvent.phoneNumber &&
          data.phoneNumberPrefix == validStartEvent.phoneNumberPrefix);
      final result = PhoneSignInOperationSuccess();
      when(useCase.sendVerificationCode(argThat(authDataMatcher))).thenAnswer((_) => Future.value(result));
      expectLater(
        phoneSignInBloc,
        emitsInOrder([PhoneSignInInitial(), PhoneSignInCodeSendInProgress(), PhoneSignInCodeSendSuccess()]),
      );
      phoneSignInBloc.add(validStartEvent);
    });

    test('yields PhoneSignInCodeSendFailure when useCase returned an error', () {
      final result = PhoneSignInOperationError(PhoneSignInOperationErrorType.invalidPhone);
      when(useCase.sendVerificationCode(any)).thenAnswer((_) => Future.value(result));
      expectLater(
        phoneSignInBloc,
        emitsInOrder([
          PhoneSignInInitial(),
          PhoneSignInCodeSendInProgress(),
          PhoneSignInCodeSendFailure((b) => b.errorType = PhoneSignInOperationErrorType.invalidPhone)
        ]),
      );
      phoneSignInBloc.add(validStartEvent);
    });

    test('yields PhoneSignInCodeSendFailure when use case raises an error', () {
      when(useCase.sendVerificationCode(any)).thenThrow(Exception('boom'));
      expectLater(
        phoneSignInBloc,
        emitsInOrder([
          PhoneSignInInitial(),
          PhoneSignInCodeSendInProgress(),
          PhoneSignInCodeSendFailure((b) => b
            ..errorType = PhoneSignInOperationErrorType.generalError
            ..errorMessage = 'Exception: boom')
        ]),
      );
      phoneSignInBloc.add(validStartEvent);
    });
  });

  group('PhoneSignInCodeResendRequested event', () {
    test('yields PhoneSignInCodeSendSuccess state when code was resent', () {
      final authDataMatcher = predicate((AuthData data) =>
          data.phoneNumber == validStartEvent.phoneNumber &&
          data.phoneNumberPrefix == validStartEvent.phoneNumberPrefix);
      final result = PhoneSignInOperationSuccess();
      when(useCase.sendVerificationCode(argThat(authDataMatcher))).thenAnswer((_) => Future.value(result));
      expectLater(
        phoneSignInBloc,
        emitsInOrder([
          PhoneSignInInitial(),
          PhoneSignInCodeSendInProgress(),
          PhoneSignInCodeSendSuccess(),
          PhoneSignInCodeSendInProgress(),
          PhoneSignInCodeSendSuccess()
        ]),
      );
      phoneSignInBloc.add(validStartEvent);
      phoneSignInBloc.add(PhoneSignInCodeResendRequested());
    });
  });

  group('PhoneSignInCodeEntered event', () {
    final code = '123456';
    final token = 'tok3n';
    final validCodeEnteredEvent = PhoneSignInCodeEntered((b) => b..code = code);

    setUp(() {
      final result = PhoneSignInOperationSuccess();
      when(useCase.sendVerificationCode(any)).thenAnswer((_) => Future.value(result));
    });

    test('yields validation error state when code is invalid', () {
      expectLater(
        phoneSignInBloc,
        emitsInOrder([
          PhoneSignInInitial(),
          PhoneSignInCodeSendInProgress(),
          PhoneSignInCodeSendSuccess(),
          PhoneSignInValidationFailure()
        ]),
      );
      phoneSignInBloc.add(validStartEvent);
      phoneSignInBloc.add(PhoneSignInCodeEntered((b) => b..code = 'invalid'));
    });

    test('yields PhoneSignInVerificationSuccess when code is correct', () async {
      final authDataMatcher = predicate((AuthData data) => data.code == code);
      final result = PhoneSignInOperationSuccess(accessToken: token);
      when(useCase.signIn(argThat(authDataMatcher))).thenAnswer((_) => Future.value(result));

      expect(
        phoneSignInBloc,
        emitsInOrder([
          PhoneSignInInitial(),
          PhoneSignInCodeSendInProgress(),
          PhoneSignInCodeSendSuccess(),
          PhoneSignInVerificationInProgress(),
          PhoneSignInVerificationSuccess()
        ]),
      );
      phoneSignInBloc.add(validStartEvent);
      phoneSignInBloc.add(validCodeEnteredEvent);
      await expectLater(phoneSignInBloc, emitsThrough(PhoneSignInVerificationSuccess()));
      verify(authBloc.add(SignedIn((b) => b.token = token)));
    });

    test('yields PhoneSignInVerificationFailure when useCase returned an error', () {
      final result = PhoneSignInOperationError(PhoneSignInOperationErrorType.incorrectCode);
      when(useCase.signIn(any)).thenAnswer((_) => Future.value(result));
      expectLater(
        phoneSignInBloc,
        emitsInOrder([
          PhoneSignInInitial(),
          PhoneSignInCodeSendInProgress(),
          PhoneSignInCodeSendSuccess(),
          PhoneSignInVerificationInProgress(),
          PhoneSignInVerificationFailure((b) => b.errorType = PhoneSignInOperationErrorType.incorrectCode)
        ]),
      );
      phoneSignInBloc.add(validStartEvent);
      phoneSignInBloc.add(validCodeEnteredEvent);
    });

    test('yields PhoneSignInVerificationFailure when use case raises an error', () {
      when(useCase.signIn(any)).thenThrow(Exception('boom'));
      expectLater(
        phoneSignInBloc,
        emitsInOrder([
          PhoneSignInInitial(),
          PhoneSignInCodeSendInProgress(),
          PhoneSignInCodeSendSuccess(),
          PhoneSignInVerificationInProgress(),
          PhoneSignInVerificationFailure((b) => b
            ..errorType = PhoneSignInOperationErrorType.generalError
            ..errorMessage = 'Exception: boom')
        ]),
      );
      phoneSignInBloc.add(validStartEvent);
      phoneSignInBloc.add(validCodeEnteredEvent);
    });
  });
}
