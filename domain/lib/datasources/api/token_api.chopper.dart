// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$TokenApiImpl extends TokenApiImpl {
  _$TokenApiImpl([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = TokenApiImpl;

  @override
  Future<Response<dynamic>> createToken() {
    final $url = 'tokens';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
