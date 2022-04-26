// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_sign_in_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$PhoneSignInApiImpl extends PhoneSignInApiImpl {
  _$PhoneSignInApiImpl([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PhoneSignInApiImpl;

  @override
  Future<Response<dynamic>> sendVerificationCode(
      PhoneVerificationRequest request) {
    final $url = 'phone_sign_in';
    final $body = request;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> signIn(PhoneSignInRequest request) {
    final $url = 'phone_sign_in/verify';
    final $body = request;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
