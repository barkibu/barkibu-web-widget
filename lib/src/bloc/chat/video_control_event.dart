import 'package:common_barkibu_dart/common_barkibu_dart.dart';

abstract class VideoControlEvent {}

class VideoControlStarted extends VideoControlEvent {}

class VideoControlStreamStatusUpdated extends VideoControlEvent {
  final VideoStreamState videoStreamState;
  VideoControlStreamStatusUpdated(this.videoStreamState);
}

class VideoControlStreamTerminated extends VideoControlEvent {}

class VideoControlClosed extends VideoControlEvent {}
