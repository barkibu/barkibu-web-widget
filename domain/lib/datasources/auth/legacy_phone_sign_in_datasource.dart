import 'dart:convert';

import 'package:common_barkibu_dart/datasources/api/phone_sign_in_api.dart';
import 'package:common_barkibu_dart/datasources/auth/phone_sign_in_datasource.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/api/api_errors.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/auth/phone_sign_in.dart';
import 'package:common_barkibu_dart/viewmodels/auth/auth_data.dart';

class LegacyPhoneSignInDatasourceImpl implements PhoneSignInDatasource {
  final PhoneSignInApi _phoneSignInApi;

  LegacyPhoneSignInDatasourceImpl(this._phoneSignInApi);

  @override
  Future<dynamic> sendVerificationCode(AuthData authData) async {
    final request = PhoneVerificationRequest(authData.phoneNumber, authData.phoneNumberPrefix);
    final response = await _phoneSignInApi.sendVerificationCode(request);
    if (response.isSuccessful) {
      return PhoneVerificationResponse();
    } else {
      return ApiErrorResponse.fromJson(json.decode(response.error));
    }
  }

  @override
  Future<dynamic> signIn(AuthData authData) async {
    final request = PhoneSignInRequest(authData.phoneNumber, authData.phoneNumberPrefix, authData.code);
    final response = await _phoneSignInApi.signIn(request);
    if (response.isSuccessful) {
      final accessToken = response.headers['authorization'].split(' ')[1];
      return PhoneSignInResponse(accessToken);
    } else {
      return ApiErrorResponse.fromJson(json.decode(response.error));
    }
  }
}
