import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks/mocks.dart';

class MockSignInDatasource extends Mock implements PhoneSignInDatasourceImpl {}

class StubbedPhoneSignUpDatasource extends PhoneSignUpDatasourceImpl {
  final PhoneSignInDatasource signInDatasource;

  StubbedPhoneSignUpDatasource(
    SecureStorage secureStorage,
    this.signInDatasource, {
    String userPoolId,
    String appClientId,
  }) : super(
          secureStorage,
          signInDatasource,
          userPoolId: userPoolId,
          appClientId: appClientId,
        );

  final mockInitiatedUser = MockCognitoUser();
  @override
  CognitoUser initCognitoUser(AuthData username) => mockInitiatedUser;

  final _userPool = MockCognitoUserPool();
  @override
  CognitoUserPool get userPool => _userPool;
}

void main() {
  final service = GetIt.instance;
  final authData = AuthData(firstName: 'alice', phoneNumberPrefix: '+1', phoneNumber: '1234', code: '000000');

  PhoneSignUpUseCase useCase;
  StubbedPhoneSignUpDatasource datasource;

  PhoneSignUpUseCase initializeUseCase() {
    final secureStorage = MockSecureStorage();
    datasource = StubbedPhoneSignUpDatasource(
      secureStorage,
      MockSignInDatasource(),
      userPoolId: 'eu-west-1_zXXXX',
      appClientId: 'xxxxxxx',
    );
    final repo = PhoneSignUpRepositoryImpl(datasource);
    return PhoneSignUpUseCaseImpl(repo);
  }

  setUp(() {
    service.registerSingleton<MonitoringService>(MockMonitoringService());
    useCase = initializeUseCase();
  });

  tearDown(() {
    if (service.isRegistered<MonitoringService>()) {
      service.unregister<MonitoringService>();
    }
  });

  group('sendVerificationCode', () {
    group('when phone is invalid', () {
      setUp(() {
        when(datasource.userPool.signUp(any, any, userAttributes: anyNamed('userAttributes')))
            .thenThrow(CognitoClientException('Oops', name: 'InvalidParameterException'));
      });
      test('returns operation error', () async {
        final result = await useCase.sendVerificationCode(authData);
        expect(result, isA<PhoneSignUpOperationError>());
        expect((result as PhoneSignUpOperationError).errorType, PhoneSignUpOperationErrorType.invalidPhone);
      });
    });

    group('when un-handled server error occurs', () {
      setUp(() {
        when(datasource.userPool.signUp(any, any, userAttributes: anyNamed('userAttributes')))
            .thenThrow(CognitoClientException('Oops', name: 'SomethingElseBoomed'));
      });
      test('returns operation error', () async {
        final result = await useCase.sendVerificationCode(authData);
        expect(result, isA<PhoneSignUpOperationError>());
        expect((result as PhoneSignUpOperationError).errorType, PhoneSignUpOperationErrorType.generalError);
      });
    });

    group('when request is successfully sent to Cognito', () {
      setUp(() {
        when(datasource.userPool.signUp(any, any, userAttributes: anyNamed('userAttributes')))
            .thenAnswer((_) => Future.value());
      });
      test('calls signUp with the user\'s phone number', () async {
        await useCase.sendVerificationCode(authData);
        verify(datasource.userPool.signUp(authData.phoneNumberPrefix + authData.phoneNumber, any,
            userAttributes: anyNamed('userAttributes')));
      });

      test('returns operation success', () async {
        final result = await useCase.sendVerificationCode(authData);
        expect(result, isA<PhoneSignUpOperationSuccess>());
      });
    });
  });

  group('signUp', () {
    group('when code is incorrect', () {
      setUp(() {
        when(datasource.mockInitiatedUser.confirmRegistration(any))
            .thenThrow(CognitoClientException('Oops', name: 'CodeMismatchException'));
      });

      test('returns operation error', () async {
        final result = await useCase.signUp(authData);
        expect(result, isA<PhoneSignUpOperationError>());
        expect((result as PhoneSignUpOperationError).errorType, PhoneSignUpOperationErrorType.incorrectCode);
      });
    });

    group('when server returns another error', () {
      setUp(() {
        when(datasource.mockInitiatedUser.confirmRegistration(any))
            .thenThrow(CognitoClientException('Oops', name: 'Boom!'));
      });

      test('returns operation error', () async {
        final result = await useCase.signUp(authData);
        expect(result, isA<PhoneSignUpOperationError>());
        expect((result as PhoneSignUpOperationError).errorType, PhoneSignUpOperationErrorType.generalError);
      });
    });

    group('when code confirmation is successfull', () {
      setUp(() {
        when(datasource.mockInitiatedUser.confirmRegistration(any)).thenAnswer((_) => Future.value());
        when(datasource.mockInitiatedUser.authenticateUser(any)).thenAnswer((_) => Future.value());
        when(datasource.mockInitiatedUser.changePassword(any, any)).thenAnswer((_) => Future.value());
      });
      test('sends code, name and number to the backend', () async {
        await useCase.signUp(authData);
      });

      test('returns a token when response is successful', () async {
        final result = await useCase.signUp(authData);
        expect(result, isA<PhoneSignUpOperationSuccess>());
      });
    });
  });
}
