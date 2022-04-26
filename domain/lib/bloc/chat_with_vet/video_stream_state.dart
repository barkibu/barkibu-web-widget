import 'package:built_value/built_value.dart';
import 'package:common_barkibu_dart/messages/messages_model.dart';
import 'package:common_barkibu_dart/models/room_access.dart';

part 'video_stream_state.g.dart';

abstract class Localizable {
  String toLocalizedString(MessagesModel messages) {
    return toString();
  }
}

abstract class VideoStreamState extends Localizable {}

abstract class VideoStreamRoomedState extends VideoStreamState {
  @nullable
  RoomAccess get roomAccess;
}

abstract class VideoStreamStateErrored implements VideoStreamRoomedState {}

class VideoStreamInitial extends VideoStreamState {}

class VideoStreamRoomRequestInProgress extends VideoStreamState implements Localizable {
  @override
  String toLocalizedString(MessagesModel messages) {
    return messages.chatMessages.chatWithVet.videoSharing.roomRequestInProgress;
  }
}

abstract class VideoStreamRoomRequestFailure
    implements Built<VideoStreamRoomRequestFailure, VideoStreamRoomRequestFailureBuilder>, VideoStreamStateErrored {
  String get reason;

  @override
  String toLocalizedString(MessagesModel messages) {
    return messages.chatMessages.chatWithVet.videoSharing.roomRequestFailure;
  }

  VideoStreamRoomRequestFailure._();
  factory VideoStreamRoomRequestFailure([void Function(VideoStreamRoomRequestFailureBuilder) updates]) =
      _$VideoStreamRoomRequestFailure;
}

abstract class VideoStreamRoomRequestSuccess
    implements Built<VideoStreamRoomRequestSuccess, VideoStreamRoomRequestSuccessBuilder>, VideoStreamRoomedState {
  @override
  String toLocalizedString(MessagesModel messages) {
    return messages.chatMessages.chatWithVet.videoSharing.roomRequestSuccess;
  }

  VideoStreamRoomRequestSuccess._();
  factory VideoStreamRoomRequestSuccess([void Function(VideoStreamRoomRequestSuccessBuilder) updates]) =
      _$VideoStreamRoomRequestSuccess;
}

abstract class VideoStreamCallRequestInProgress
    implements
        Built<VideoStreamCallRequestInProgress, VideoStreamCallRequestInProgressBuilder>,
        VideoStreamRoomedState {
  @override
  String toLocalizedString(MessagesModel messages) {
    return messages.chatMessages.chatWithVet.videoSharing.callRequestInProgress;
  }

  VideoStreamCallRequestInProgress._();
  factory VideoStreamCallRequestInProgress([void Function(VideoStreamCallRequestInProgressBuilder) updates]) =
      _$VideoStreamCallRequestInProgress;
}

abstract class VideoStreamCallRequestSuccess
    implements Built<VideoStreamCallRequestSuccess, VideoStreamCallRequestSuccessBuilder>, VideoStreamRoomedState {
  @override
  String toLocalizedString(MessagesModel messages) {
    return messages.chatMessages.chatWithVet.videoSharing.callRequestSuccess;
  }

  VideoStreamCallRequestSuccess._();
  factory VideoStreamCallRequestSuccess([void Function(VideoStreamCallRequestSuccessBuilder) updates]) =
      _$VideoStreamCallRequestSuccess;
}

abstract class VideoStreamCallRequestFailure
    implements Built<VideoStreamCallRequestFailure, VideoStreamCallRequestFailureBuilder>, VideoStreamStateErrored {
  @override
  String toLocalizedString(MessagesModel messages) {
    return messages.chatMessages.chatWithVet.videoSharing.callRequestFailure;
  }

  VideoStreamCallRequestFailure._();
  factory VideoStreamCallRequestFailure([void Function(VideoStreamCallRequestFailureBuilder) updates]) =
      _$VideoStreamCallRequestFailure;
}

abstract class VideoStreamTerminateSuccess
    implements Built<VideoStreamTerminateSuccess, VideoStreamTerminateSuccessBuilder>, VideoStreamRoomedState {
  @override
  String toLocalizedString(MessagesModel messages) {
    return messages.chatMessages.chatWithVet.videoSharing.terminateSuccess;
  }

  VideoStreamTerminateSuccess._();
  factory VideoStreamTerminateSuccess([void Function(VideoStreamTerminateSuccessBuilder) updates]) =
      _$VideoStreamTerminateSuccess;
}
