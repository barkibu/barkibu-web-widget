import 'package:common_barkibu_dart/datasources/video_chat/video_chat_datasource.dart';
import 'package:common_barkibu_dart/models/room_access.dart';

abstract class VideoChatRepository {
  Future<RoomAccess> getRoomAccess();
}

class VideoChatRepositoryImpl extends VideoChatRepository {
  final VideoChatDatasource _videoChatDatasource;

  VideoChatRepositoryImpl(this._videoChatDatasource);

  @override
  Future<RoomAccess> getRoomAccess() => _videoChatDatasource.getRoomAccess();
}
