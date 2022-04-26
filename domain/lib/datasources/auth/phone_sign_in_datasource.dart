import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:common_barkibu_dart/datasources/auth/user_pool_datasource.dart';
import 'package:common_barkibu_dart/datasources/storage/storage.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/api/api_errors.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/auth/phone_sign_in.dart';
import 'package:common_barkibu_dart/viewmodels/auth/auth_data.dart';

abstract class PhoneSignInDatasource {
  Future<dynamic> sendVerificationCode(AuthData authData);

  Future<dynamic> signIn(AuthData authData);
}

class PhoneSignInDatasourceImpl implements PhoneSignInDatasource {
  final UserPoolDatasource _userPoolDatasource;

  CognitoUserPool get userPool => _userPoolDatasource.userPool;

  CognitoStorage get storage => _userPoolDatasource.storage;

  CognitoUser _user;

  PhoneSignInDatasourceImpl(
    SecureStorage _secureStorage, {
    String userPoolId,
    String appClientId,
  }) : _userPoolDatasource = UserPoolDatasource(
          secureStorage: _secureStorage,
          userPoolId: userPoolId,
          appClientId: appClientId,
        );

  @override
  Future<dynamic> sendVerificationCode(AuthData authData) async {
    try {
      _user = CognitoUser(authData.phoneNumberPrefix + authData.phoneNumber, userPool, storage: storage);
      await _user.initiateAuth(AuthenticationDetails(authParameters: []));
    } on CognitoUserCustomChallengeException {
      return PhoneVerificationResponse();
    } catch (e) {
      if (e.name == 'NotAuthorizedException') {
        return ApiErrorResponse('Not Found');
      }
      return ApiErrorResponse(e.toString());
    }
  }

  @override
  Future<dynamic> signIn(AuthData authData) async {
    try {
      await _user.sendCustomChallengeAnswer(authData.code);
      return PhoneSignInResponse(''); // TODO remove the param (access token)
    } on CognitoUserCustomChallengeException {
      return ApiErrorResponse('incorrect_code');
    } catch (e) {
      return ApiErrorResponse(e.toString());
    }
  }
}
