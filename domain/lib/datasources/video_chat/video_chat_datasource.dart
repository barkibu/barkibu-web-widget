import 'package:common_barkibu_dart/datasources/api/video_chat_api.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/video_chat/room_access.dart';
import 'package:common_barkibu_dart/models/room_access.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/services/locale_service.dart';

abstract class VideoChatDatasource {
  Future<RoomAccess> getRoomAccess();
}

class VideoChatRoomAccessException implements Exception {
  @override
  String toString() {
    return ServiceLocator.container<LocaleService>().messagesModel().chatMessages.chatWithVet.videoChatUnavailable;
  }
}

class VideoChatDatasourceImpl implements VideoChatDatasource {
  final VideoChatApi _videoChatApi;

  VideoChatDatasourceImpl(this._videoChatApi);

  @override
  Future<RoomAccess> getRoomAccess() async {
    var response = await _videoChatApi.getRoomAccess();

    if (response.isSuccessful) {
      return RoomAccessResponse.fromJson(response.body).toRoomAccess();
    }

    throw VideoChatRoomAccessException();
  }
}
