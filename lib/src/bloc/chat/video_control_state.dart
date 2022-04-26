import 'package:web_widget/src/twilio/twilio_video_sdk_wrapper.dart';
import 'package:web_widget/src/twilio/twilio_video_service.dart';

abstract class VideoControlState {}

class VideoControlInitial extends VideoControlState {}

class VideoControlConnectedInProgress extends VideoControlState {}

class VideoControlConnected extends VideoControlState {
  final TwilioTrack localVideoTrack;
  final TwilioTrack localAudioTrack;
  final TwilioVideoService twilioVideoService;

  VideoControlConnected(this.localVideoTrack, this.localAudioTrack, this.twilioVideoService);
}

class VideoControlTerminated extends VideoControlState {}
