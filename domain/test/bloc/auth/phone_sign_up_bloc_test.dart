import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import '../../service_locator.dart' as test_service_locator;

class MockPhoneSignUpUseCase extends Mock implements PhoneSignUpUseCase {}

class MockAuthBloc extends Mock implements AuthBloc {}

void main() {
  test_service_locator.ServiceLocator.setup();
  PhoneSignUpUseCase useCase;
  AuthBloc authBloc;
  PhoneSignUpBloc phoneSignUpBloc;

  final validStartEvent = PhoneSignUpStarted((b) => b
    ..name = 'alice'
    ..phoneNumber = '123456'
    ..phoneNumberPrefix = '+7'
    ..checkboxValue = true);

  final invalidStartEvent = PhoneSignUpStarted((b) => b
    ..name = 'alice'
    ..phoneNumber = ''
    ..phoneNumberPrefix = ''
    ..checkboxValue = true);

  setUp(() {
    useCase = MockPhoneSignUpUseCase();
    authBloc = MockAuthBloc();
    phoneSignUpBloc = PhoneSignUpBloc(useCase, authBloc);
  });

  tearDown(() {
    phoneSignUpBloc?.close();
  });

  test('initial state', () {
    expect(phoneSignUpBloc.state, PhoneSignUpInitial());
  });

  group('PhoneSignUpStarted event', () {
    test('yields validation error state when data is not valid', () {
      expectLater(
        phoneSignUpBloc,
        emitsInOrder([PhoneSignUpInitial(), PhoneSignUpValidationFailure()]),
      );
      phoneSignUpBloc.add(invalidStartEvent);
    });

    test('yields PhoneSignUpCodeSendSuccess state when code was sent', () {
      final authDataMatcher = predicate((AuthData data) =>
          data.phoneNumber == validStartEvent.phoneNumber &&
          data.phoneNumberPrefix == validStartEvent.phoneNumberPrefix);
      final result = PhoneSignUpOperationSuccess();
      when(useCase.sendVerificationCode(argThat(authDataMatcher))).thenAnswer((_) => Future.value(result));
      expectLater(
        phoneSignUpBloc,
        emitsInOrder([PhoneSignUpInitial(), PhoneSignUpCodeSendInProgress(), PhoneSignUpCodeSendSuccess()]),
      );
      phoneSignUpBloc.add(validStartEvent);
    });

    test('yields PhoneSignUpCodeSendFailure when useCase returned an error', () {
      final result = PhoneSignUpOperationError(PhoneSignUpOperationErrorType.invalidPhone);
      when(useCase.sendVerificationCode(any)).thenAnswer((_) => Future.value(result));
      expectLater(
        phoneSignUpBloc,
        emitsInOrder([
          PhoneSignUpInitial(),
          PhoneSignUpCodeSendInProgress(),
          PhoneSignUpCodeSendFailure((b) => b.errorType = PhoneSignUpOperationErrorType.invalidPhone)
        ]),
      );
      phoneSignUpBloc.add(validStartEvent);
    });

    test('yields PhoneSignUpCodeSendFailure when use case raises an error', () {
      when(useCase.sendVerificationCode(any)).thenThrow(Exception('boom'));
      expectLater(
        phoneSignUpBloc,
        emitsInOrder([
          PhoneSignUpInitial(),
          PhoneSignUpCodeSendInProgress(),
          PhoneSignUpCodeSendFailure((b) => b
            ..errorType = PhoneSignUpOperationErrorType.generalError
            ..errorMessage = 'Exception: boom')
        ]),
      );
      phoneSignUpBloc.add(validStartEvent);
    });
  });

  group('PhoneSignUpCodeResendRequested event', () {
    test('yields PhoneSignUpCodeSendSuccess state when code was resent', () {
      final authDataMatcher = predicate((AuthData data) =>
          data.phoneNumber == validStartEvent.phoneNumber &&
          data.phoneNumberPrefix == validStartEvent.phoneNumberPrefix);
      final result = PhoneSignUpOperationSuccess();
      when(useCase.sendVerificationCode(argThat(authDataMatcher))).thenAnswer((_) => Future.value(result));
      expectLater(
        phoneSignUpBloc,
        emitsInOrder([
          PhoneSignUpInitial(),
          PhoneSignUpCodeSendInProgress(),
          PhoneSignUpCodeSendSuccess(),
          PhoneSignUpCodeSendInProgress(),
          PhoneSignUpCodeSendSuccess()
        ]),
      );
      phoneSignUpBloc.add(validStartEvent);
      phoneSignUpBloc.add(PhoneSignUpCodeResendRequested());
    });
  });

  group('PhoneSignUpCodeEntered event', () {
    final code = '123456';
    final token = 'tok3n';
    final validCodeEnteredEvent = PhoneSignUpCodeEntered((b) => b..code = code);

    setUp(() {
      final result = PhoneSignUpOperationSuccess();
      when(useCase.sendVerificationCode(any)).thenAnswer((_) => Future.value(result));
    });

    test('yields validation error state when code is invalid', () {
      expectLater(
        phoneSignUpBloc,
        emitsInOrder([
          PhoneSignUpInitial(),
          PhoneSignUpCodeSendInProgress(),
          PhoneSignUpCodeSendSuccess(),
          PhoneSignUpValidationFailure()
        ]),
      );
      phoneSignUpBloc.add(validStartEvent);
      phoneSignUpBloc.add(PhoneSignUpCodeEntered((b) => b..code = 'invalid'));
    });

    test('yields PhoneSignUpVerificationSuccess when code is correct', () async {
      final authDataMatcher = predicate((AuthData data) => data.code == code);
      final result = PhoneSignUpOperationSuccess(accessToken: token);
      when(useCase.signUp(argThat(authDataMatcher))).thenAnswer((_) => Future.value(result));

      expect(
        phoneSignUpBloc,
        emitsInOrder([
          PhoneSignUpInitial(),
          PhoneSignUpCodeSendInProgress(),
          PhoneSignUpCodeSendSuccess(),
          PhoneSignUpVerificationInProgress(),
          PhoneSignUpVerificationSuccess()
        ]),
      );
      phoneSignUpBloc.add(validStartEvent);
      phoneSignUpBloc.add(validCodeEnteredEvent);
      await expectLater(phoneSignUpBloc, emitsThrough(PhoneSignUpVerificationSuccess()));
      verify(authBloc.add(SignedIn((b) => b.token = token)));
    });

    test('yields PhoneSignUpVerificationFailure when useCase returned an error', () {
      final result = PhoneSignUpOperationError(PhoneSignUpOperationErrorType.incorrectCode);
      when(useCase.signUp(any)).thenAnswer((_) => Future.value(result));
      expectLater(
        phoneSignUpBloc,
        emitsInOrder([
          PhoneSignUpInitial(),
          PhoneSignUpCodeSendInProgress(),
          PhoneSignUpCodeSendSuccess(),
          PhoneSignUpVerificationInProgress(),
          PhoneSignUpVerificationFailure((b) => b.errorType = PhoneSignUpOperationErrorType.incorrectCode)
        ]),
      );
      phoneSignUpBloc.add(validStartEvent);
      phoneSignUpBloc.add(validCodeEnteredEvent);
    });

    test('yields PhoneSignUpVerificationFailure when use case raises an error', () {
      when(useCase.signUp(any)).thenThrow(Exception('boom'));
      expectLater(
        phoneSignUpBloc,
        emitsInOrder([
          PhoneSignUpInitial(),
          PhoneSignUpCodeSendInProgress(),
          PhoneSignUpCodeSendSuccess(),
          PhoneSignUpVerificationInProgress(),
          PhoneSignUpVerificationFailure((b) => b
            ..errorType = PhoneSignUpOperationErrorType.generalError
            ..errorMessage = 'Exception: boom')
        ]),
      );
      phoneSignUpBloc.add(validStartEvent);
      phoneSignUpBloc.add(validCodeEnteredEvent);
    });
  });
}
