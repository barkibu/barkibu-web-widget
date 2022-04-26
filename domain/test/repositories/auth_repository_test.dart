import 'dart:convert';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:chopper/chopper.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/datasources/api/interceptors/auth_interceptor.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/api/api_errors.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

import 'package:common_barkibu_dart/datasources/storage/storage.dart';
import 'package:common_barkibu_dart/repositories/auth/auth_repository.dart';
import 'package:common_barkibu_dart/datasources/api/auth_api.dart';
import 'package:common_barkibu_dart/datasources/auth/auth_datasource.dart';
import 'package:common_barkibu_dart/viewmodels/auth/auth_data.dart';

import '../mocks/mocks.dart';

class StubbedAuthDatasource extends AuthDatasourceImpl {
  StubbedAuthDatasource(
    SecureStorage secureStorage,
    AuthApi authApi, {
    String userPoolId,
    String appClientId,
  }) : super(
          secureStorage,
          authApi,
          userPoolId: userPoolId,
          appClientId: appClientId,
        );

  final mockInitiatedUser = MockCognitoUser();

  @override
  CognitoUser initCognitoUser(username) => mockInitiatedUser;

  final _userPool = MockCognitoUserPool();

  @override
  CognitoUserPool get userPool => _userPool;
}

void main() {
  SecureStorage secureStorage;
  final service = GetIt.instance;

  var userApiResponse = {
    'id': 5106,
    'email': 'charlene_cronin@dietrichbode.com',
    'firstName': 'James',
    'lastName': 'Schmeler',
    'phoneNumber': '(344) 098-8015',
    'jti': 'a0ceb2cc-be66-42da-8401-d88a97474273',
    'createdAt': '2020-04-15T16:03:34.336Z',
    'updatedAt': '2020-04-15T16:03:34.336Z',
    'passwordResetCode': null,
    'passwordResetCodeExpiration': null,
    'phoneNumberPrefix': '+378'
  };

  Future<http.Response> noopHandler(http.Request request) async {
    return Future.value(http.Response('', 200));
  }

  AuthDatasourceImpl authDatasource;

  AuthRepository initializeRepository(MockClientHandler handler) {
    var chopperClient = ChopperClient(
      converter: JsonConverter(),
      baseUrl: 'http://example.com/v1',
      client: MockClient(handler),
      interceptors: [AuthInterceptor()],
    );

    var authApi = AuthApiImpl.create(chopperClient);
    authDatasource = StubbedAuthDatasource(
      secureStorage,
      authApi,
      userPoolId: 'eu-west-1_zXXXX',
      appClientId: 'xxxxxxx',
    );

    return AuthRepositoryImpl(authDatasource);
  }

  setUp(() {
    secureStorage = MockSecureStorage();
    service.registerSingleton<MonitoringService>(MockMonitoringService());
  });

  tearDown(() {
    if (service.isRegistered<AuthDatasource>()) {
      service.unregister<AuthDatasource>();
    }
    if (service.isRegistered<MonitoringService>()) {
      service.unregister<MonitoringService>();
    }
  });

  final token = 'MyCognitoJwtToken';

  final mockSignedInUser = MockCognitoUser();
  final mockUserSession = MockCognitoUserSession();
  final mockAccessToken = MockCognitoAccessToken();

  group('signIn', () {
    AuthRepository authRepository;

    group('when response is successful', () {
      setUp(() {
        Future<http.Response> requestHandler(http.Request request) async {
          var body = json.encode({'user': userApiResponse});
          expect(request.method, 'GET');
          expect(request.url.path, '/v1/auth');
          expect(request.headers['authorization'], 'Bearer $token');
          return Future.value(http.Response(body, 200));
        }

        when(mockAccessToken.getJwtToken()).thenReturn(token);
        when(mockUserSession.getAccessToken()).thenReturn(mockAccessToken);
        when(mockSignedInUser.getSession()).thenAnswer((_) => Future.value(mockUserSession));
        authRepository = initializeRepository(requestHandler);
        service.registerSingleton<AuthDatasource>(authDatasource);
        when(authDatasource.userPool.getCurrentUser()).thenAnswer((_) => Future.value(mockSignedInUser));
      });

      test('Returns SignInData', () async {
        var signInData = await authRepository.signIn('email', 'password');
        var user = signInData.user;
        expect(user.firstName, userApiResponse['firstName']);
        expect(user.lastName, userApiResponse['lastName']);
        expect(user.email, userApiResponse['email']);
        expect(user.phoneNumber, userApiResponse['phoneNumber']);
        expect(user.phoneNumberPrefix, userApiResponse['phoneNumberPrefix']);
      });
    });

    group('when credentials are invalid', () {
      setUp(() {
        authRepository = initializeRepository(noopHandler);
        when((authDatasource as StubbedAuthDatasource).mockInitiatedUser.authenticateUser(any))
            .thenThrow(Exception('An error'));
      });

      test('returns an error message', () async {
        var errorResponse = await authRepository.signIn('email', 'password');
        expect(errorResponse, isA<ApiErrorResponse>());
      });
    });
  });

  group('isSignedIn', () {
    AuthRepository authRepository;

    setUp(() {
      when(mockAccessToken.getJwtToken()).thenReturn(token);
      when(mockUserSession.getAccessToken()).thenReturn(mockAccessToken);
      when(mockSignedInUser.getSession()).thenAnswer((_) => Future.value(mockUserSession));
      authRepository = initializeRepository(noopHandler);
    });

    group('when no current user is present', () {
      setUp(() {
        when(authDatasource.userPool.getCurrentUser()).thenAnswer((_) => Future.value(null));
      });

      test('it returns false', () async {
        var result = await authRepository.isSignedIn();
        expect(result, isFalse);
      });
    });

    group('when a current user is present', () {
      setUp(() {
        when(authDatasource.userPool.getCurrentUser()).thenAnswer((_) => Future.value(mockSignedInUser));
      });

      test('it returns true', () async {
        var result = await authRepository.isSignedIn();
        expect(result, isTrue);
      });
    });
  });

  group('signOut', () {
    AuthRepository authRepository;
    setUp(() {
      authRepository = initializeRepository(noopHandler);

      when(authDatasource.userPool.getCurrentUser()).thenAnswer((_) => Future.value(mockSignedInUser));
      when(mockSignedInUser.signOut()).thenAnswer((_) => Future.value());
    });

    group('when response is successful', () {
      setUp(() {
        when(authDatasource.userPool.getCurrentUser()).thenAnswer((_) => Future.value(mockSignedInUser));
      });

      test('Calls the underlying signOut method on CognitoUser', () async {
        await authRepository.signOut();
        verify(mockSignedInUser.signOut());
      });
    });

    group('when response is not successful', () {
      setUp(() {
        when(authDatasource.userPool.getCurrentUser()).thenAnswer((_) => Future.value(mockSignedInUser));
        when(mockSignedInUser.signOut()).thenThrow(Exception('Oops'));
      });

      test('Calls the underlying signOut method on CognitoUser and swallow the error', () async {
        await authRepository.signOut();
        verify(mockSignedInUser.signOut());
      });
    });
  });

  group('getUser', () {
    AuthRepository authRepository;

    group('when response is successful', () {
      setUp(() {
        Future<http.Response> requestHandler(http.Request request) async {
          var body = json.encode({'user': userApiResponse});
          expect(request.method, 'GET');
          expect(request.url.path, '/v1/auth');
          return Future.value(http.Response(body, 200));
        }

        authRepository = initializeRepository(requestHandler);
        service.registerSingleton<AuthDatasource>(authDatasource);
      });

      test('Returns signed in user', () async {
        var user = await authRepository.getUser();
        expect(user.firstName, userApiResponse['firstName']);
        expect(user.lastName, userApiResponse['lastName']);
        expect(user.email, userApiResponse['email']);
        expect(user.phoneNumber, userApiResponse['phoneNumber']);
        expect(user.phoneNumberPrefix, userApiResponse['phoneNumberPrefix']);
      });
    });

    group('when response is not successful', () {
      setUp(() {
        Future<http.Response> requestHandler(http.Request request) async {
          return Future.value(http.Response('', 500));
        }

        authRepository = initializeRepository(requestHandler);
        service.registerSingleton<AuthDatasource>(authDatasource);
      });

      test('returns an error message', () async {
        var user = await authRepository.getUser();
        expect(user, isNull);
      });
    });
  });

  group('sendEmail', () {
    AuthRepository authRepository;
    var requestBody = {'email': 'email@example.com'};

    group('when response is successful', () {
      setUp(() {
        authRepository = initializeRepository(noopHandler);
        when((authDatasource as StubbedAuthDatasource).mockInitiatedUser.forgotPassword())
            .thenAnswer((_) => Future.value());
      });

      test('Returns true', () async {
        var result = await authRepository.sendEmail(requestBody['email']);
        expect(result, isTrue);
      });
    });

    group('when response is not successful', () {
      setUp(() {
        authRepository = initializeRepository(noopHandler);
        when((authDatasource as StubbedAuthDatasource).mockInitiatedUser.forgotPassword())
            .thenThrow(Exception('An error'));
      });

      test('Returns false', () async {
        var result = await authRepository.sendEmail(requestBody['email']);
        expect(result, isFalse);
      });
    });
  });

  group('resetPassword', () {
    AuthRepository authRepository;
    final code = 'secr3t_reset_code';
    final newPassword = 'New password';

    var authData = AuthData(email: 'email@example.com', password: newPassword, code: code);

    group('when response is successful', () {
      setUp(() {
        authRepository = initializeRepository(noopHandler);
        when((authDatasource as StubbedAuthDatasource).mockInitiatedUser.confirmPassword(code, newPassword))
            .thenAnswer((_) => Future.value(true));
      });

      test('Returns true', () async {
        var result = await authRepository.resetPassword(authData);
        expect(result, isTrue);
        verify((authDatasource as StubbedAuthDatasource).mockInitiatedUser.confirmPassword(any, any));
      });
    });

    group('when response is not successful', () {
      setUp(() {
        authRepository = initializeRepository(noopHandler);
        when((authDatasource as StubbedAuthDatasource).mockInitiatedUser.confirmPassword(code, newPassword))
            .thenThrow(Exception('Ooops'));
      });

      test('Returns false', () async {
        var result = await authRepository.resetPassword(authData);
        expect(result, isFalse);
      });
    });
  });
}
