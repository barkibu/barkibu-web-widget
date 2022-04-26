abstract class VideoStreamEvent {}

class VideoStreamRequested extends VideoStreamEvent {}

class VideoStreamAccepted extends VideoStreamEvent {
  final String roomSid;
  VideoStreamAccepted(this.roomSid);
}

class VideoStreamDeclined extends VideoStreamEvent {
  final String roomSid;
  VideoStreamDeclined(this.roomSid);
}

class VideoStreamTerminated extends VideoStreamEvent {
  final String roomSid;
  final bool initiatedByVet;
  VideoStreamTerminated(this.roomSid, [this.initiatedByVet = false]);
}
