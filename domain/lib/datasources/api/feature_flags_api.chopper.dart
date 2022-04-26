// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_flags_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$FeatureFlagApiImpl extends FeatureFlagApiImpl {
  _$FeatureFlagApiImpl([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = FeatureFlagApiImpl;

  @override
  Future<Response<dynamic>> getFeatureFlagsUser() {
    final $url = 'feature_flags';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
