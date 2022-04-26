import 'package:common_barkibu_dart/bloc/bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:common_barkibu_dart/services/twilio.dart';

export 'package:common_barkibu_dart/services/twilio.dart';

class TwilioTestChatService extends Mock implements TwilioChatService {
  final String petParentIdentity;
  TwilioTestChatService(this.petParentIdentity);

  Function(TwilioMember) _onMemberJoined;
  Function(TwilioMember) _onMemberLeaveHandler;
  Function(TwilioMember, bool) _onTypingHandler;
  Function(TwilioMessage) _onMessageAddedHandler;

  @override
  Future<List<TwilioMessage>> loadMessages(String channelSid) {
    return Future.value([]);
  }

  @override
  Future<List<TwilioMember>> loadMembers(String channelSid) {
    return Future.value([member(petParentIdentity)]);
  }

  @override
  Future<void> sendMessage(String channelSid, String body, [Map<String, dynamic> attributes = const {}]) async {
    Future.delayed(Duration.zero, () {
      if (_onMessageAddedHandler != null) {
        _onMessageAddedHandler(TwilioMessage((b) => b
          ..attributes = attributes
          ..body = body
          ..sid = 'message_sid'
          ..index = 0
          ..author = petParentIdentity));
      }
    });
  }

  @override
  Future<void> addOnMessageAddedHandler(String channelSid, Future<void> Function(TwilioMessage) handler) async {
    _onMessageAddedHandler = handler;
  }

  @override
  Future<void> addOnMemberLeaveChannelHandler(String channelSid, Future<void> Function(TwilioMember) handler) async {
    _onMemberLeaveHandler = handler;
  }

  @override
  Future<void> addOnMemberJoinChannelHandler(String channelSid, Future<void> Function(TwilioMember) handler) async {
    _onMemberJoined = handler;
  }

  @override
  Future<void> addOnTypingHandler(String channelSid, Future<void> Function(TwilioMember, bool) handler) async {
    _onTypingHandler = handler;
  }

  void joinAsVet(String vetIdentity) {
    _onMemberJoined(member(vetIdentity));

    _onMessageAddedHandler(TwilioMessage((b) => b
      ..index = 1
      ..sid = 'IM_XXX'
      ..author = vetIdentity
      ..body = 'Vet $vetIdentity joined the chat'
      ..attributes = {
        'hide': true,
        'type': 'bot',
        'botMessageType': 'vetJoined',
        'workerName': vetIdentity,
      }));
  }

  void sendMessageAsVet(String vetIdentity, String body) {
    _onMessageAddedHandler(TwilioMessage((b) => b
      ..attributes = {}
      ..body = body
      ..sid = 'message_sid'
      ..index = 0
      ..author = vetIdentity));
  }

  void vetIsTypeing(String vetIdentity) {
    _onTypingHandler(member(vetIdentity), true);
  }

  void vetStoppedTyping(String vetIdentity) {
    _onTypingHandler(member(vetIdentity), false);
  }

  void leaveAsAVet(String vetIdentity) {
    _onMemberLeaveHandler(member(vetIdentity));
  }

  Future<void> respondToVideoStreamShareRequest(String channelSid, String roomSid, VideoChatRoomStatus status) {
    return Future.delayed(Duration.zero, () {
      if (_onMessageAddedHandler != null) {
        final attributes = {
          videoSharingRoomSidKey: roomSid,
          videoSharingKey: true,
          videoSharingStatusKey: status.toScreamyString(),
          hideMessageKey: true,
        };
        _onMessageAddedHandler(TwilioMessage((b) => b
          ..attributes = attributes
          ..body = 'VideoStreamShare $status'
          ..sid = 'message_sid'
          ..index = 0
          ..author = 'Vet John'));
      }
    });
  }

  TwilioMember member(String vetIdentity) => TwilioMember((b) => b
    ..sid = 'ME_$vetIdentity\_SID'
    ..identity = vetIdentity
    ..fetchUser = () => Future.value(TwilioUser((b) => b
      ..identity = vetIdentity
      ..friendlyName = vetIdentity)));
}
