// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_chat_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$VideoChatApiImpl extends VideoChatApiImpl {
  _$VideoChatApiImpl([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = VideoChatApiImpl;

  @override
  Future<Response<dynamic>> getRoomAccess() {
    final $url = '/videochats/new';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
