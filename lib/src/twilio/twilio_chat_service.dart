import 'dart:html';

import 'package:common_barkibu_dart/services/twilio.dart';
import 'twilio_sdk_wrapper.dart' as sdk;

import 'dart:js';
import 'dart:js_util';

class ChannelState {
  sdk.TwilioChatChannel channel;
  Map<String, Function> listeners = {};

  ChannelState(this.channel);

  void addEventListener(String eventName, Function listener) {
    removeEventListener(eventName);
    channel.on(eventName, listener);
    listeners[eventName] = listener;
  }

  void removeEventListener(String eventName) {
    if (listeners[eventName] != null) {
      channel.removeListener(eventName, listeners[eventName]);
      listeners[eventName] = null;
    }
  }
}

class TwilioChatServiceImpl implements TwilioChatService {
  sdk.TwilioChatClient _twilioChatClient;
  Map<String, ChannelState> channelStates = {};

  @override
  void init() {}

  void disconnect() {
    _twilioChatClient.shutdown();
  }

  @override
  Future<void> initChatClient(String accessToken) async {
    try {
      _twilioChatClient = await promiseToFuture(sdk.TwilioChatClient.create(accessToken));
    } catch (exception) {
      throw TwilioChatException(exception.message);
    }
  }

  @override
  ChatClientConnectionState chatClientConnectionState() {
    if (_twilioChatClient == null) {
      return ChatClientConnectionState.noChatClient;
    }

    switch (_twilioChatClient.connectionState) {
      case 'connecting':
        return ChatClientConnectionState.connecting;
      case 'connected':
        return ChatClientConnectionState.connected;
      case 'disconnecting':
        return ChatClientConnectionState.disconnected;
      case 'disconnected':
        return ChatClientConnectionState.disconnected;
      case 'denied':
        return ChatClientConnectionState.denied;
      default:
        return ChatClientConnectionState.unknown;
    }
  }

  @override
  Future<void> leaveChannel(String channelSid) async {
    final channel = (await _loadChannel(channelSid)).channel;
    await promiseToFuture(channel.leave());
  }

  @override
  Future<List<TwilioMember>> loadMembers(String channelSid) async {
    final channel = (await _loadChannel(channelSid)).channel;
    final members = await promiseToFuture(channel.getMembers());
    return List<sdk.TwilioChatMember>.from(members).map((member) => sdk.toLibMember(member)).toList();
  }

  Future<ChannelState> _loadChannel(String channelSid) async {
    if (channelStates[channelSid] != null) {
      return channelStates[channelSid];
    }

    try {
      final channel = await promiseToFuture(_twilioChatClient.getChannelBySid(channelSid));
      channelStates[channelSid] = ChannelState(channel);
    } catch (exception) {
      print(exception.message);
      throw TwilioChatException(exception.message);
    }

    return channelStates[channelSid];
  }

  @override
  Future<void> sendMessage(String channelSid, dynamic message, [Map<String, dynamic> attributes = const {}]) async {
    final channel = (await _loadChannel(channelSid)).channel;
    final sendAttributes = attributes != null ? sdk.attributesFromMap(attributes) : sdk.MessageAttributes();
    try {
      await promiseToFuture(channel.sendMessage(message, sendAttributes));
    } catch (exception) {
      throw TwilioChatException(exception.message);
    }
  }

  @override
  Future<void> sendMediaFormData(String channelSid, Object formData,
      [Map<String, dynamic> attributes = const {}]) async {
    return sendMessage(channelSid, formData, attributes);
  }

  @override
  Future<void> addOnMessageAddedHandler(channelSid, void Function(TwilioMessage) handler) async {
    final channelState = await _loadChannel(channelSid);

    channelState.addEventListener('messageAdded', allowInterop((sdk.TwilioChatMessage message) async {
      handler(await sdk.toLibMessage(message));
    }));
  }

  @override
  Future<void> addOnMemberLeaveChannelHandler(channelSid, void Function(TwilioMember) handler) async {
    final channelState = await _loadChannel(channelSid);

    channelState.addEventListener('memberLeft', allowInterop((sdk.TwilioChatMember member) {
      handler(sdk.toLibMember(member));
    }));
  }

  @override
  Future<void> addOnMemberJoinChannelHandler(channelSid, void Function(TwilioMember) handler) async {
    final channelState = await _loadChannel(channelSid);

    channelState.addEventListener('memberJoined', allowInterop((sdk.TwilioChatMember member) {
      handler(sdk.toLibMember(member));
    }));
  }

  @override
  Future<void> addOnTypingHandler(channelSid, void Function(TwilioMember, bool) handler) async {
    final channelState = await _loadChannel(channelSid);

    channelState.addEventListener('typingStarted', allowInterop((sdk.TwilioChatMember member) {
      handler(sdk.toLibMember(member), true);
    }));

    channelState.addEventListener('typingEnded', allowInterop((sdk.TwilioChatMember member) {
      handler(sdk.toLibMember(member), false);
    }));
  }

  @override
  void removeHandlers(String channelSid) {
    final channelState = channelStates[channelSid];
    channelState?.removeEventListener('messageAdded');
    channelState?.removeEventListener('memberLeft');
    channelState?.removeEventListener('typingStarted');
    channelState?.removeEventListener('typingEnded');
  }

  @override
  Future<List<TwilioMessage>> loadMessages(String channelSid) async {
    final channel = (await _loadChannel(channelSid)).channel;
    try {
      var paginator = await promiseToFuture(channel.getMessages(100, 0, 'forward'));
      var result = await _buildPage(paginator);
      while (paginator.hasNextPage) {
        paginator = await promiseToFuture(paginator.nextPage());
        result.addAll(await _buildPage(paginator));
      }
      return result;
    } catch (exception) {
      throw TwilioChatException(exception.message);
    }
  }

  Future<List<TwilioMessage>> _buildPage(sdk.TwilioPaginator<sdk.TwilioChatMessage> paginator) async {
    final items = List<sdk.TwilioChatMessage>.from(paginator.items);
    final messageMapping = items.map((message) => sdk.toLibMessage(message)).toList();
    return Future.wait(messageMapping);
  }

  @override
  Future<void> sendMediaFile(String channelSid, String path, String mimetype,
      [Map<String, dynamic> attributes = const {}]) async {}
}
