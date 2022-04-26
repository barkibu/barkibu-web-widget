import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/configuration.dart';
import 'package:common_barkibu_dart/domain/domain.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/bloc/chat_with_vet/video_stream_event.dart';
import 'package:common_barkibu_dart/bloc/chat_with_vet/video_stream_state.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/services/twilio/twilio_message.dart';

export 'package:common_barkibu_dart/bloc/chat_with_vet/video_stream_event.dart';
export 'package:common_barkibu_dart/bloc/chat_with_vet/video_stream_state.dart';

enum VideoChatRoomStatus {
  requested,
  accepted,
  declined,
  terminated,
}

extension VideoChatRoomStatusScreamable on VideoChatRoomStatus {
  String toScreamyString() {
    return toString().split('.')[1].toUpperCase();
  }
}

class VideoStreamBloc extends Bloc<VideoStreamEvent, VideoStreamState> {
  /// Action to call a Vet to meet in Room with provided [roomSid]
  final void Function(String roomSid) _requestStreamSharing;
  final VideoChatUseCase _videoChatUseCase;
  final Configuration configuration = ServiceLocator.container<Configuration>();
  final AnalyticsService analyticsService = ServiceLocator.container<AnalyticsService>();

  VideoStreamBloc(this._videoChatUseCase, this._requestStreamSharing);

  @override
  VideoStreamState get initialState => VideoStreamInitial();

  @override
  Stream<VideoStreamState> mapEventToState(VideoStreamEvent event) async* {
    if (!configuration.telehealthVideoCapabilityEnabled) {
      return;
    }

    if (event is VideoStreamRequested) {
      yield VideoStreamRoomRequestInProgress();
      var roomAccess;
      try {
        roomAccess = await _videoChatUseCase.getRoomAccess();
        yield VideoStreamRoomRequestSuccess((b) => b..roomAccess = roomAccess);
        _requestStreamSharing(roomAccess.roomSid);
        yield VideoStreamCallRequestInProgress((b) => b..roomAccess = roomAccess);
      } catch (e) {
        yield VideoStreamRoomRequestFailure((b) => b
          ..roomAccess = roomAccess
          ..reason = e.toString());
      }
    }

    if (state is VideoStreamRoomedState) {
      final roomAccess = (state as VideoStreamRoomedState).roomAccess;

      if (event is VideoStreamAccepted && event.roomSid == roomAccess.roomSid) {
        yield VideoStreamCallRequestSuccess((b) => b..roomAccess = roomAccess);
      }
      if (event is VideoStreamDeclined && event.roomSid == roomAccess.roomSid) {
        yield VideoStreamCallRequestFailure((b) => b..roomAccess = roomAccess);
      }
      if (event is VideoStreamTerminated && event.roomSid == roomAccess.roomSid) {
        yield VideoStreamTerminateSuccess((b) => b..roomAccess = roomAccess);
      }
    }
  }

  void onMessage(TwilioMessage message) {
    if (message.attributes[videoSharingKey] != true) {
      return;
    }

    final roomSid = message.attributes[videoSharingRoomSidKey];
    final status = message.attributes[videoSharingStatusKey];

    if (status == VideoChatRoomStatus.accepted.toScreamyString()) {
      logAskAVetVideoStart();
      add(VideoStreamAccepted(roomSid));
    } else if (status == VideoChatRoomStatus.declined.toScreamyString()) {
      add(VideoStreamDeclined(roomSid));
    } else if (status == VideoChatRoomStatus.terminated.toScreamyString()) {
      logAskAVetVideoEnd();
      add(VideoStreamTerminated(roomSid, true));
    } else if (status != VideoChatRoomStatus.requested.toScreamyString()) {
      print('Unknown Video Stream Request Status: $status');
    }
  }

  void logAskAVetVideoStart() => analyticsService.event.askAVet.logAskAVetVideoStart();

  void logAskAVetVideoEnd() => analyticsService.event.askAVet.logAskAVetVideoEnd();
}
