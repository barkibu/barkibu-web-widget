// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeds_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$BreedsApiImpl extends BreedsApiImpl {
  _$BreedsApiImpl([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = BreedsApiImpl;

  @override
  Future<Response<dynamic>> getBreeds(
      String query, String species, String locale) {
    final $url = 'breeds';
    final $params = <String, dynamic>{
      'query': query,
      'species': species,
      'locale': locale
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
