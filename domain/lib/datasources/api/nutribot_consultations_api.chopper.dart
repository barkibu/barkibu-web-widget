// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutribot_consultations_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$NutribotConsultationsApiImpl extends NutribotConsultationsApiImpl {
  _$NutribotConsultationsApiImpl([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = NutribotConsultationsApiImpl;

  @override
  Future<Response<dynamic>> getConsultations() {
    final $url = 'nutribot_consultations';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
