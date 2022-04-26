import 'dart:async';
import 'dart:html';

import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/bloc/chat/video_control_event.dart';
import 'package:web_widget/src/bloc/chat/video_control_state.dart';

import 'package:bloc/bloc.dart';
import 'package:web_widget/src/twilio/twilio_video_sdk_wrapper.dart';
import 'package:web_widget/src/twilio/twilio_video_service.dart';

class VideoControlBloc extends Bloc<VideoControlEvent, VideoControlState> {
  final VideoStreamBloc videoStreamBloc;
  final DivElement streamHtmlContainer;
  StreamSubscription _videoStreamBlocSubscription;

  VideoControlBloc(this.videoStreamBloc, this.streamHtmlContainer);

  @override
  VideoControlState get initialState => VideoControlInitial();

  @override
  Stream<VideoControlState> mapEventToState(VideoControlEvent event) async* {
    if (event is VideoControlStarted) {
      yield VideoControlConnectedInProgress();
      _videoStreamBlocSubscription = videoStreamBloc.skip(1).listen(videoStreamListener);
      videoStreamBloc.add(VideoStreamRequested());
    }

    if (state is! VideoControlInitial && event is VideoControlStreamStatusUpdated) {
      if (event.videoStreamState is VideoStreamCallRequestSuccess) {
        yield await _connect(event.videoStreamState);
      } else if (event.videoStreamState is VideoStreamTerminateSuccess) {
        yield _onCallTerminated();
      }
    }

    if (event is VideoControlStreamTerminated) {
      final currentState = state;
      final roomSid = currentState is VideoControlConnected ? currentState.twilioVideoService.roomSid : null;
      videoStreamBloc.add(VideoStreamTerminated(roomSid));
      yield _onCallTerminated();
    }

    if (event is VideoControlClosed) {
      await _videoStreamBlocSubscription?.cancel();
      yield VideoControlInitial();
    }
  }

  void videoStreamListener(VideoStreamState streamState) {
    add(VideoControlStreamStatusUpdated(streamState));
  }

  Future<VideoControlState> _connect(VideoStreamCallRequestSuccess state) async {
    final twilioVideoService = ServiceLocator.container<TwilioVideoService>(
        param1: TwilioVideoParams(state.roomAccess.roomSid, state.roomAccess.accessToken, streamHtmlContainer));
    final videoTrack = await localVideoTrack(twilioVideoService);
    final audioTrack = await localAudioTrack(twilioVideoService);
    twilioVideoService.connectAndDisplay(videoTrack, audioTrack);
    return VideoControlConnected(videoTrack, audioTrack, twilioVideoService);
  }

  VideoControlState _onCallTerminated() {
    final currentState = state;
    if (currentState is VideoControlConnected) {
      currentState.twilioVideoService?.disconnect();
      currentState.localVideoTrack?.detach()?.forEach((element) => element.remove());
      currentState.localVideoTrack?.stop();
      currentState.localAudioTrack?.detach()?.forEach((element) => element.remove());
      currentState.localAudioTrack?.stop();
    }
    return VideoControlTerminated();
  }

  Future<TwilioTrack> localVideoTrack(TwilioVideoService twilioVideoService) async {
    final localVideoTrack = await twilioVideoService.createLocalVideoTrack();
    final videoElement = localVideoTrack.attach();
    streamHtmlContainer.append(videoElement);
    return localVideoTrack;
  }

  Future<TwilioTrack> localAudioTrack(TwilioVideoService twilioVideoService) async {
    final localAudioTrack = await twilioVideoService.createLocalAudioTrack();
    return localAudioTrack;
  }

  @override
  Future<void> close() async {
    add(VideoControlClosed());
    await super.close();
  }
}
