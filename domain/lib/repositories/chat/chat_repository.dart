import 'package:common_barkibu_dart/datasources/chat/chat_datasource.dart';
import 'package:common_barkibu_dart/models/active_channel.dart';
import 'package:common_barkibu_dart/models/channel.dart';

abstract class ChatRepository {
  Future<Channel> getChannel(String consultationId);
  Future<ActiveChannel> getActiveChat();
}

class ChatRepositoryImpl extends ChatRepository {
  final ChatDatasource _chatDatasource;

  ChatRepositoryImpl(this._chatDatasource);

  @override
  Future<Channel> getChannel(String consultationId) => _chatDatasource.getChannel(consultationId);

  @override
  Future<ActiveChannel> getActiveChat() => _chatDatasource.getActiveChat();
}
