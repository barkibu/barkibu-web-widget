// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ChatApiImpl extends ChatApiImpl {
  _$ChatApiImpl([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ChatApiImpl;

  @override
  Future<Response<dynamic>> getActiveChat() {
    final $url = '/chats';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getChannel(String aivetConsultationId) {
    final $url = '/chats/new';
    final $params = <String, dynamic>{
      'aivetConsultationId': aivetConsultationId
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
