import 'dart:convert';

import 'package:common_barkibu_dart/common_barkibu_dart.dart';

class LegacyPhoneSignUpDatasourceImpl implements PhoneSignUpDatasource {
  final PhoneSignUpApi _phoneSignUpApi;

  LegacyPhoneSignUpDatasourceImpl(this._phoneSignUpApi);

  @override
  Future<dynamic> sendVerificationCode(AuthData authData) async {
    final request = PhoneVerificationRequest(authData.phoneNumber, authData.phoneNumberPrefix);
    final response = await _phoneSignUpApi.sendVerificationCode(request);
    if (response.isSuccessful) {
      return PhoneVerificationResponse();
    } else {
      return ApiErrorResponse.fromJson(json.decode(response.error));
    }
  }

  @override
  Future<dynamic> signUp(AuthData authData) async {
    final request =
        PhoneSignUpRequest(authData.phoneNumber, authData.phoneNumberPrefix, authData.firstName, authData.code);
    final response = await _phoneSignUpApi.signUp(request);
    if (response.isSuccessful) {
      final accessToken = response.headers['authorization'].split(' ')[1];
      return PhoneSignUpResponse(accessToken);
    } else {
      return ApiErrorResponse.fromJson(json.decode(response.error));
    }
  }
}
