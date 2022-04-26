import 'dart:convert';
import 'dart:math';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/datasources/auth/user_pool_datasource.dart';
// ignore: library_prefixes
import 'package:common_barkibu_dart/datasources/valueobjects/auth/phone_sign_in.dart' as SignInPhoneDatasource;

class ShouldNotHaveHappened {
  final String identifier;
  final String message;

  ShouldNotHaveHappened(this.identifier, this.message);
}

abstract class PhoneSignUpDatasource {
  Future<dynamic> sendVerificationCode(AuthData authData);
  Future<dynamic> signUp(AuthData authData);
}

class PhoneSignUpDatasourceImpl implements PhoneSignUpDatasource {
  final UserPoolDatasource _userPoolDatasource;
  final PhoneSignInDatasourceImpl _signInDatasource;
  CognitoUserPool get userPool => _userPoolDatasource.userPool;
  CognitoStorage get storage => _userPoolDatasource.storage;

  bool _isActuallySignIn = false;
  String _tmpPassword;

  CognitoUser initCognitoUser(AuthData authData) => CognitoUser(
        authData.fullPhoneNumber,
        userPool,
        storage: storage,
      );

  PhoneSignUpDatasourceImpl(
    SecureStorage _secureStorage,
    this._signInDatasource, {
    String userPoolId,
    String appClientId,
  }) : _userPoolDatasource = UserPoolDatasource(
          secureStorage: _secureStorage,
          userPoolId: userPoolId,
          appClientId: appClientId,
        );

  @override
  Future<dynamic> sendVerificationCode(AuthData authData) async {
    final userAttributes = [AttributeArg(name: 'name', value: authData.firstName)];
    _tmpPassword = temporaryPassword(authData);

    try {
      _isActuallySignIn = false;
      await userPool.signUp(
        authData.fullPhoneNumber,
        _tmpPassword,
        userAttributes: userAttributes,
      );
      return PhoneVerificationResponse();
    } on CognitoClientException catch (e) {
      if (e.name == 'UsernameExistsException') {
        final user = initCognitoUser(authData);
        try {
          await user.authenticateUser(AuthenticationDetails(password: _tmpPassword));
          // User is confirmed and has default password  => process not complete
          final event = ShouldNotHaveHappened(authData.fullPhoneNumber, 'User is confirmed but has default password');
          ServiceLocator.container<MonitoringService>().capture(event: event, severityLevel: SeverityLevel.WARNING);
          await user.resendConfirmationCode();
          return PhoneVerificationResponse();
        } catch (exp) {
          if (exp.name == 'UserNotConfirmedException') {
            // User is not confirmed and has default password => process not complete
            await user.resendConfirmationCode();
          } else {
            // User does not have the default password, it is then confirmed => he actually wants to sign in
            await _signInDatasource.sendVerificationCode(authData);
            _isActuallySignIn = true;
          }
          return PhoneVerificationResponse();
        }
      } else if (e.name == 'InvalidParameterException') {
        return ApiErrorResponse('invalid_phone_number');
      } else {
        ServiceLocator.container<MonitoringService>().capture(event: e, severityLevel: SeverityLevel.ERROR);
        return ApiErrorResponse(e.message);
      }
    }
  }

  @override
  Future<dynamic> signUp(AuthData authData) async {
    final user = initCognitoUser(authData);
    try {
      if (_isActuallySignIn) {
        final response = await _signInDatasource.signIn(authData);
        if (response is SignInPhoneDatasource.PhoneSignInResponse) {
          return PhoneSignUpResponse(response.accessToken);
        } else {
          return ApiErrorResponse('incorrect_code');
        }
      } else {
        await user.confirmRegistration(authData.code);
        await user.authenticateUser(AuthenticationDetails(password: _tmpPassword));
        await user.changePassword(_tmpPassword, randomPassword);
      }
      return PhoneSignUpResponse('');
    } catch (e) {
      if (e.name == 'CodeMismatchException') {
        return ApiErrorResponse('incorrect_code');
      } else if (e.name == 'ExpiredCodeException') {
        return ApiErrorResponse('code_expired');
      } else {
        ServiceLocator.container<MonitoringService>().capture(event: e, severityLevel: SeverityLevel.ERROR);
      }

      return ApiErrorResponse('Confirmation failed');
    }
  }

  String get randomPassword {
    var random = Random.secure();
    var values = List<int>.generate(15, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  String temporaryPassword(AuthData authData) {
    return base64UrlEncode(utf8.encode(authData.fullPhoneNumber));
  }
}
