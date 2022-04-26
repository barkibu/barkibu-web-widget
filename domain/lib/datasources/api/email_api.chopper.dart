// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$EmailApiImpl extends EmailApiImpl {
  _$EmailApiImpl([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = EmailApiImpl;

  @override
  Future<Response<dynamic>> emailQuestions(EmailRequest request) {
    final $url = 'emails';
    final $body = request;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
