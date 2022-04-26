import 'package:common_barkibu_dart/models/room_access.dart';
import 'package:common_barkibu_dart/repositories/video_chat/video_chat_repository.dart';

abstract class VideoChatUseCase {
  Future<RoomAccess> getRoomAccess();
}

class VideoChatUseCaseImpl implements VideoChatUseCase {
  final VideoChatRepository _videoChatRepository;

  VideoChatUseCaseImpl(this._videoChatRepository);

  @override
  Future<RoomAccess> getRoomAccess() {
    return _videoChatRepository.getRoomAccess();
  }
}
