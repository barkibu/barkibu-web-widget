import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/datasources/api/auth_api.dart';
import 'package:common_barkibu_dart/datasources/auth/user_pool_datasource.dart';
import 'package:common_barkibu_dart/datasources/storage/storage.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/user/user.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/api/api_errors.dart';
import 'package:common_barkibu_dart/models/user.dart';
import 'package:common_barkibu_dart/services/token_decoder.dart';
import 'package:common_barkibu_dart/viewmodels/auth/auth_data.dart';

abstract class AuthDatasource {
  Future<void> setAccessToken(String accessToken);

  Future<String> getAccessToken();

  Future<void> deleteAccessToken();

  Future<dynamic> signIn(String email, String password);

  Future<dynamic> signInWithOTPToken(String otpToken);

  Future<void> signOut();

  Future<User> getUser();

  Future<bool> sendEmail(String email);

  Future<bool> resetPassword(AuthData userData);
}

class AuthDatasourceImpl implements AuthDatasource {
  final AuthApi _authApi;

  final UserPoolDatasource _userPoolDatasource;

  CognitoUserPool get userPool => _userPoolDatasource.userPool;

  CognitoStorage get storage => _userPoolDatasource.storage;

  CognitoUser initCognitoUser(String username) => CognitoUser(username, userPool, storage: storage);

  AuthDatasourceImpl(
    SecureStorage _secureStorage,
    this._authApi, {
    String userPoolId,
    String appClientId,
  }) : _userPoolDatasource = UserPoolDatasource(
          secureStorage: _secureStorage,
          userPoolId: userPoolId,
          appClientId: appClientId,
        );

  @override
  Future<String> getAccessToken() async {
    try {
      final session = await _getSession();
      return session.getAccessToken().getJwtToken();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> signInWithOTPToken(String otpToken) async {
    final payload = TokenDecoder(otpToken).payload;
    final user = initCognitoUser(payload['sub']);
    try {
      await user.initiateAuth(AuthenticationDetails(authParameters: []));
    } on CognitoUserCustomChallengeException catch (_) {
      await user.sendCustomChallengeAnswer(payload['code']);
    }
  }

  @override
  Future<void> deleteAccessToken() async {
    return;
  }

  @override
  Future<void> setAccessToken(String accessToken) async {
    return;
  }

  @override
  Future<dynamic> signIn(String email, String password) async {
    try {
      await (initCognitoUser(email)..setAuthenticationFlowType('USER_PASSWORD_AUTH'))
          .authenticateUser(AuthenticationDetails(
        username: email,
        password: password,
        authParameters: [],
      ));
      return SignInData(await getUser(), '');
    } catch (e) {
      return ApiErrorResponse(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      final user = await userPool.getCurrentUser();
      return await user.signOut();
    } catch (e) {
      ServiceLocator.container<MonitoringService>().capture(event: e, severityLevel: SeverityLevel.ERROR);
      return;
    }
  }

  @override
  Future<User> getUser() async {
    var response = await _authApi.getUser();
    return response.isSuccessful ? UserResponse.fromJson(response.body).toUser() : null;
  }

  @override
  Future<bool> sendEmail(String email) async {
    try {
      await initCognitoUser(email).forgotPassword();
      return true;
    } catch (e) {
      ServiceLocator.container<MonitoringService>().capture(event: e, severityLevel: SeverityLevel.ERROR);
    }
    return false;
  }

  @override
  Future<bool> resetPassword(AuthData userData) async {
    try {
      final user = initCognitoUser(userData.email);
      return await user.confirmPassword(userData.code, userData.password);
    } catch (e) {
      ServiceLocator.container<MonitoringService>().capture(event: e, severityLevel: SeverityLevel.ERROR);
      return false;
    }
  }

  Future<CognitoUserSession> _getSession() async {
    try {
      final user = await userPool.getCurrentUser();
      return user.getSession();
    } catch (e) {
      return null;
    }
  }
}
