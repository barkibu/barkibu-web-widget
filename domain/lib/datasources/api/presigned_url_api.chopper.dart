// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presigned_url_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$PresignedUrlApiAmazonImpl extends PresignedUrlApiAmazonImpl {
  _$PresignedUrlApiAmazonImpl([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PresignedUrlApiAmazonImpl;

  @override
  Future<Response<dynamic>> getUrl(String fileExtension) {
    final $url = 'presigned_url/$fileExtension';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
