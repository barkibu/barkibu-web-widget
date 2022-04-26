// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barkibu_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$BarkibuApiImpl extends BarkibuApiImpl {
  _$BarkibuApiImpl([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = BarkibuApiImpl;

  @override
  Future<Response<dynamic>> getConsultationsOptions(String locale) {
    final $url = '/consultations/consultation_options';
    final $params = <String, dynamic>{'locale': locale};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
