import 'package:common_barkibu_dart/datasources/api/chat_api.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/chat/channel.dart';
import 'package:common_barkibu_dart/models/active_channel.dart';
import 'package:common_barkibu_dart/models/channel.dart';

abstract class ChatDatasource {
  Future<Channel> getChannel(String consultationId);
  Future<ActiveChannel> getActiveChat();
}

class ChatDatasourceImpl implements ChatDatasource {
  final ChatApi _chatApi;

  ChatDatasourceImpl(this._chatApi);

  @override
  Future<Channel> getChannel(String consultationId) async {
    var response = await _chatApi.getChannel(consultationId);

    if (response.statusCode == 204) {
      return Channel(agentsAvailable: false);
    }
    return ChannelResponse.fromJson(response.body).toChannel();
  }

  @override
  Future<ActiveChannel> getActiveChat() async {
    var response = await _chatApi.getActiveChat();

    if (response.statusCode == 204) {
      return null;
    }
    return ActiveChannelResponse.fromJson(response.body).toChannel();
  }
}
