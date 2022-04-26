// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ClinicApiImpl extends ClinicApiImpl {
  _$ClinicApiImpl([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ClinicApiImpl;

  @override
  Future<Response<dynamic>> getClinicsByCoords(
      String latitude, String longitude) {
    final $url = 'clinics';
    final $params = <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getClinicsByAddress(String address) {
    final $url = 'clinics';
    final $params = <String, dynamic>{'address': address};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
