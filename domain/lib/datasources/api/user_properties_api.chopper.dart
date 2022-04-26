// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_properties_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$UserPropertiesApiImpl extends UserPropertiesApiImpl {
  _$UserPropertiesApiImpl([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = UserPropertiesApiImpl;

  @override
  Future<Response<dynamic>> getProperties() {
    final $url = 'user_properties';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
