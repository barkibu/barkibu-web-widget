@JS('Twilio.Chat')
library twilio_chat_sdk;

import 'package:common_barkibu_dart/services/twilio.dart' as lib;
import 'package:js/js.dart';
import 'dart:js_util';

@JS()
class Promise<T> {
  external Promise(void Function(void Function(T result) resolve, Function reject) executor);
  external Promise then(void Function(T result) onFulfilled, [Function onRejected]);
}

@JS()
@anonymous
class TwilioPaginator<T> {
  external List<T> get items;
  external bool get hasNextPage;
  external bool get hasPrevPage;

  external TwilioPaginator<T> nextPage();
  external TwilioPaginator<T> prevPage();
}

@JS('Client')
class TwilioChatClient {
  external static Promise<TwilioChatClient> create(String accessToken);
  external Promise<TwilioChatChannel> getChannelBySid(String channelSid);
  external String get connectionState;
  external void shutdown();
}

@JS()
@anonymous
class TwilioChatChannel {
  external Promise<void> sendMessage(dynamic message, MessageAttributes attributes);
  external void on(String eventName, Function eventHandler);
  external void removeListener(String eventName, Function eventHandler);
  external String get status;
  external Promise<TwilioPaginator<TwilioChatMessage>> getMessages([pageSize, anchor, direction]);
  external Promise<List<TwilioChatMember>> getMembers();
  external Promise<void> leave();
}

@JS()
@anonymous
class TwilioChatMessage {
  external String get sid;
  external int get index;
  external String get author;
  external String get body;
  external MessageAttributes get attributes;
  external String get mediaSid;
  external String get mediaFilename;
  external String get mediaType;
  external TwilioChatMessageMedia get media;
}

@JS()
@anonymous
class TwilioChatMessageMedia {
  external String get contentType;
  external String get sid;
  external int get size;
  external String get filename;

  external Promise<String> getContentTemporaryUrl();
}

@JS()
@anonymous
class MessageAttributes {
  bool hide;
  String tmp_id;
  String type;

  bool isVideoRequest;
  String botMessageType;
  String roomSid;
  String videoSharingStatus;
  String workerName;

  external factory MessageAttributes({
    bool hide,
    String tmp_id,
    String type,
    bool isVideoRequest,
    String roomSid,
    String botMessageType,
    String videoSharingStatus,
    String workerName,
  });
}

@JS()
@anonymous
class TwilioChatUserDescriptor {
  external String get identity;
  external String get friendlyName;
}

@JS()
@anonymous
class TwilioChatMember {
  external String get sid;
  external String get identity;
  external String get type;
  external Promise<TwilioChatUserDescriptor> getUserDescriptor();
}

Future<lib.TwilioMessage> toLibMessage(TwilioChatMessage message) async {
  var mediaFileUrl;
  if (message.media != null) {
    mediaFileUrl = await promiseToFuture(message.media.getContentTemporaryUrl());
  }
  return lib.TwilioMessage((b) => b
    ..sid = message.sid
    ..index = message.index
    ..author = message.author
    ..body = message.body ?? ''
    ..attributes = mapFromAttributes(message.attributes)
    ..mediaSid = message.mediaSid
    ..mediaFilename = message.mediaFilename
    ..mediaFileUrl = mediaFileUrl
    ..mediaType = message.mediaType);
}

Map<String, dynamic> mapFromAttributes(MessageAttributes attrs) {
  return {
    'hide': attrs.hide,
    'tmp_id': attrs.tmp_id,
    'type': attrs.type,
    'isVideoRequest': attrs.isVideoRequest,
    'botMessageType': attrs.botMessageType,
    'roomSid': attrs.roomSid,
    'videoSharingStatus': attrs.videoSharingStatus,
    'workerName': attrs.workerName,
  };
}

MessageAttributes attributesFromMap(Map<String, dynamic> attrs) {
  return MessageAttributes(
    hide: attrs['hide'],
    tmp_id: attrs['tmp_id'],
    type: attrs['type'],
    isVideoRequest: attrs['isVideoRequest'],
    botMessageType: attrs['botMessageType'],
    roomSid: attrs['roomSid'],
    videoSharingStatus: attrs['videoSharingStatus'],
    workerName: attrs['workerName'],
  );
}

lib.TwilioMember toLibMember(TwilioChatMember member) {
  return lib.TwilioMember((b) => b
    ..sid = member.sid
    ..identity = member.identity
    ..fetchUser = toLibUserFetcher(member));
}

Future<lib.TwilioUser> Function() toLibUserFetcher(TwilioChatMember member) {
  if (member.type != 'chat') {
    return () => null;
  }
  return () async {
    final userDescriptor = await promiseToFuture<TwilioChatUserDescriptor>(member.getUserDescriptor());
    return lib.TwilioUser((b) => b
      ..identity = userDescriptor.identity
      ..friendlyName = userDescriptor.friendlyName);
  };
}
