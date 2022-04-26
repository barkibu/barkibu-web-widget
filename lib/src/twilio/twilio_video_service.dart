import 'dart:html';
import 'dart:js';
import 'dart:js_util';
import 'twilio_video_sdk_wrapper.dart' as sdk;

class TwilioVideoParams {
  final String roomSid;
  final String accessToken;
  final DivElement streamHtmlContainer;

  TwilioVideoParams(this.roomSid, this.accessToken, this.streamHtmlContainer);
}

abstract class TwilioVideoService {
  final String roomSid;
  final String accessToken;
  final DivElement streamHtmlContainer;

  TwilioVideoService(TwilioVideoParams twilioVideoParams)
      : roomSid = twilioVideoParams.roomSid,
        accessToken = twilioVideoParams.accessToken,
        streamHtmlContainer = twilioVideoParams.streamHtmlContainer;

  void connectAndDisplay(
    sdk.TwilioTrack localVideoTrack,
    sdk.TwilioTrack localAudioTrack,
  );
  void disconnect();
  Future<sdk.TwilioTrack> createLocalVideoTrack();
  Future<sdk.TwilioTrack> createLocalAudioTrack();
  static bool get isSupported => sdk.isSupported;
}

class TwilioVideoServiceImpl extends TwilioVideoService {
  RoomState _room;

  TwilioVideoServiceImpl(TwilioVideoParams twilioVideoParams) : super(twilioVideoParams);

  Future<RoomState> _connect(sdk.TwilioTrack localVideoTrack, sdk.TwilioTrack localAudioTrack) async {
    final options = sdk.ConnectOptions(name: roomSid, tracks: [localVideoTrack, localAudioTrack], video: false);
    return RoomState(await promiseToFuture(sdk.connect(accessToken, options)));
  }

  @override
  Future<sdk.TwilioTrack> createLocalVideoTrack() {
    return promiseToFuture(sdk.createLocalVideoTrack());
  }

  @override
  Future<sdk.TwilioTrack> createLocalAudioTrack() {
    return promiseToFuture(sdk.createLocalAudioTrack());
  }

  @override
  void connectAndDisplay(sdk.TwilioTrack localVideoTrack, sdk.TwilioTrack localAudioTrack) async {
    _room = await _connect(localVideoTrack, localAudioTrack);
    _room.forEachParticipant(_participantConnected);
    _room.addEventListener('participantConnected', (sdk.TwilioRemoteParticipant participant) {
      _participantConnected(ParticipantState(participant));
    });
    _room.addEventListener('participantDisconnected', _participantDisconnected);
  }

  void _participantConnected(ParticipantState participant) {
    final div = DivElement();
    div.id = participant.sid;

    participant.addEventListener('trackSubscribed', (track, remote) => _trackSubscribed(track, div));
    participant.addEventListener('trackUnsubscribed', _trackUnsubscribed);

    participant.forEachTracks((sdk.TwilioRemoteTrackPublication publication, _, __) {
      if (publication.isSubscribed && publication.kind == 'audio') {
        _trackSubscribed(publication.track, div);
      }
    });

    streamHtmlContainer.append(div);
  }

  void _participantDisconnected(sdk.TwilioRemoteParticipant participant) {
    document.getElementById(participant.sid).remove();
  }

  void _trackSubscribed(sdk.TwilioTrack track, DivElement div) {
    div.append(track.attach());
  }

  void _trackUnsubscribed(sdk.TwilioTrack track, sdk.TwilioRemoteParticipant _) {
    track.detach().forEach((element) => element.remove());
  }

  @override
  void disconnect() {
    _room?.disconnect();
  }
}

abstract class Listenable<T extends sdk.JsListenable> {
  final T _nativeJsElement;
  Map<String, Function> listeners = {};

  Listenable(this._nativeJsElement);

  void addEventListener(String eventName, Function listener) {
    removeEventListener(eventName);
    _nativeJsElement.on(eventName, allowInterop(listener));
    listeners[eventName] = allowInterop(listener);
  }

  void removeEventListener(String eventName) {
    if (listeners[eventName] != null) {
      _nativeJsElement.removeListener(eventName, listeners[eventName]);
      listeners[eventName] = null;
    }
  }
}

class RoomState extends Listenable<sdk.TwilioRoom> {
  @override
  final sdk.TwilioRoom _nativeJsElement;

  RoomState(this._nativeJsElement) : super(_nativeJsElement);

  void disconnect() {
    _nativeJsElement.disconnect();
  }

  void forEachParticipant(void Function(ParticipantState) callback) {
    _nativeJsElement.participants.forEach(allowInterop((participant, _, __) {
      callback.call(ParticipantState(participant));
    }));
  }
}

class ParticipantState extends Listenable<sdk.TwilioRemoteParticipant> {
  @override
  final sdk.TwilioRemoteParticipant _nativeJsElement;
  ParticipantState(this._nativeJsElement) : super(_nativeJsElement);

  String get sid => _nativeJsElement.sid;

  void forEachTracks(
      void Function(sdk.TwilioRemoteTrackPublication, String, sdk.TwilioRemoteTrackPublicationMap) callback) {
    _nativeJsElement.tracks.forEach(allowInterop(callback));
  }
}
