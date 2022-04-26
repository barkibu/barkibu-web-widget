import 'package:chopper/chopper.dart';

part 'chat_api.chopper.dart';

abstract class ChatApi {
  Future<Response> getActiveChat();
  Future<Response> getChannel(String aivetConsultationId);
}

@ChopperApi(baseUrl: '/chats')
abstract class ChatApiImpl extends ChopperService implements ChatApi {
  static ChatApi create([ChopperClient client]) => _$ChatApiImpl(client);

  @Get(path: '')
  @override
  Future<Response> getActiveChat();

  @Get(path: 'new')
  @override
  Future<Response> getChannel(@Query() String aivetConsultationId);
}
