import 'dart:convert';

import 'package:common_barkibu_dart/datasources/api/auth_api.dart';
import 'package:common_barkibu_dart/datasources/api/user_api.dart';
import 'package:common_barkibu_dart/datasources/auth/auth_datasource.dart';
import 'package:common_barkibu_dart/datasources/storage/storage.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/auth/sign_in.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/user/reset_password.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/user/user.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/api/api_errors.dart';
import 'package:common_barkibu_dart/models/user.dart';
import 'package:common_barkibu_dart/viewmodels/auth/auth_data.dart';

class LegacyAuthDatasourceImpl implements AuthDatasource {
  final SecureStorage _secureStorage;
  final AuthApi _authApi;
  final UserApi _userApi;

  LegacyAuthDatasourceImpl(this._secureStorage, this._authApi, this._userApi);

  @override
  Future<String> getAccessToken() async => _secureStorage.read(SecureStorageKeys.accessToken);

  @override
  Future<void> deleteAccessToken() async => _secureStorage.delete(SecureStorageKeys.accessToken);

  @override
  Future<void> setAccessToken(String accessToken) async =>
      _secureStorage.write(SecureStorageKeys.accessToken, accessToken);

  @override
  Future<dynamic> signIn(String email, String password) async {
    var signInData = SignInRequest(email, password);
    var response = await _authApi.signIn(signInData);

    if (response.isSuccessful) {
      var accessToken = response.headers['authorization'].split(' ')[1];

      return SignInResponse.fromJson(response.body).toSignInData(accessToken);
    }

    Map<String, dynamic> error = jsonDecode(response.error);

    return ApiErrorResponse.fromJson(error);
  }

  @override
  Future<void> signOut() async {
    await _authApi.signOut();

    return null;
  }

  @override
  Future<User> getUser() async {
    var response = await _authApi.getUser();

    return response.isSuccessful ? UserResponse.fromJson(response.body).toUser() : null;
  }

  @override
  Future<bool> sendEmail(String email) async {
    var sendEmailRequest = SendEmailRequest(email);
    var response = await _userApi.sendEmail(sendEmailRequest);

    return response.isSuccessful;
  }

  @override
  Future<bool> resetPassword(AuthData userData) async {
    var resetPasswordRequest = ResetPasswordRequest(userData.email, userData.code, userData.password);
    var response = await _userApi.resetPassword(resetPasswordRequest);

    return response.isSuccessful;
  }

  @override
  Future signInWithOTPToken(String refreshToken) {
    throw UnimplementedError();
  }
}
