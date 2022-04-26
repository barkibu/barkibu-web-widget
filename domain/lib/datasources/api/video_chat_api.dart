import 'package:chopper/chopper.dart';

part 'video_chat_api.chopper.dart';

abstract class VideoChatApi {
  Future<Response> getRoomAccess();
}

@ChopperApi(baseUrl: '/videochats')
abstract class VideoChatApiImpl extends ChopperService implements VideoChatApi {
  static VideoChatApi create([ChopperClient client]) => _$VideoChatApiImpl(client);

  @Get(path: 'new')
  @override
  Future<Response> getRoomAccess();
}
