@JS('Twilio.Video')
library twilio_video_sdk;

import 'dart:html';

import 'package:js/js.dart';

@JS()
@anonymous
class JsListenable {
  external void on(String eventName, Function eventHandler);
  external void removeListener(String eventName, Function eventHandler);
}

@JS()
external bool get isSupported;

@JS()
class Promise<T> {
  external Promise(void Function(void Function(T result) resolve, Function reject) executor);
  external Promise then(void Function(T result) onFulfilled, [Function onRejected]);
}

@JS()
@anonymous
class ConnectOptions {
  external String get name;
  external String get logLevel;
  external List<TwilioTrack> get tracks;
  external bool get video;
  external factory ConnectOptions({String name, String logLevel, List<TwilioTrack> tracks, bool video});
}

@JS()
external Promise<TwilioRoom> connect(String accessToken, ConnectOptions options);

@JS()
external Promise<TwilioTrack> createLocalVideoTrack();

@JS()
external Promise<TwilioTrack> createLocalAudioTrack();

@JS('Room')
@anonymous
class TwilioRoom extends JsListenable {
  external TwilioLocalParticipant get localParticipant;
  external TwilioRemoteParticipantMap get participants;
  external String get name;
  external String get sid;
  external String get state;

  external TwilioRoom disconnect();
}

@JS()
@anonymous
class TwilioRemoteParticipantMap {
  external void forEach(void Function(TwilioRemoteParticipant, String, TwilioRemoteParticipantMap) callback);
}

@JS()
@anonymous
class TwilioParticipant extends JsListenable {
  external String get sid;
  external String get state;
  external String get identity;
}

@JS()
@anonymous
class TwilioRemoteParticipant extends TwilioParticipant {
  external TwilioRemoteTrackPublicationMap get tracks;
}

@JS()
@anonymous
class TwilioRemoteTrackPublicationMap {
  external void forEach(void Function(TwilioRemoteTrackPublication, String, TwilioRemoteTrackPublicationMap) callback);
}

@JS('RemoteTrackPublication')
class TwilioRemoteTrackPublication {
  external bool get isSubscribed;
  external String get kind;
  external TwilioTrack get track;
}

@JS('Track')
class TwilioTrack {
  external HtmlElement attach();
  external List<HtmlElement> detach();
  external TwilioTrack stop();
}

@JS('LocalParticipant')
@anonymous
class TwilioLocalParticipant {}
