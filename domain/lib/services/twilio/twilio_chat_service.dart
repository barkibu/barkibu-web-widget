import 'package:common_barkibu_dart/services/twilio.dart';

/// Service to interact with [Channel]s from Twilio Chat Client
abstract class TwilioChatService {
  void init();

  /// Returns the [ChatClientConnectionState] of the underlying Twilio ChatClient.
  ChatClientConnectionState chatClientConnectionState();

  /// Init the underlying Twilio ChatClient using the provided [accessToken].
  ///
  /// Throws a [InvalidAccessToken] if provided token is invalid/expired.
  Future<void> initChatClient(String accessToken);

  /// Returns the list of [TwilioMessage]s published on the channel identified by [channelSid] on
  /// the previously initialized [initChatClient()] Chat Client.
  ///
  /// Throws a [ChannelUnavailable] if channel does not exist or user is not a member of this channel.
  Future<List<TwilioMessage>> loadMessages(String channelSid);

  /// Returns the list of [TwilioMember]s on the channel identified by [channelSid] on
  /// the previously initialized [initChatClient()] Chat Client.
  ///
  /// Throws a [ChannelUnavailable] if channel does not exist or user is not a member of this channel.
  Future<List<TwilioMember>> loadMembers(String channelSid);

  /// Sends a message on the Channel [channelSid] with the given [body] and [attributes]
  /// Returns the [Message] Instance created
  ///
  /// Throws a [ChannelUnavailable] exception if channel is not available (user not a member for instance)
  Future<void> sendMessage(String channelSid, String body, [Map<String, dynamic> attributes = const {}]);

  /// Sends a media message on the Channel [channelSid] with the media at the given [path] with given [mimeType].
  /// Returns the [Message] Instance created.
  ///
  /// Throws a [ChannelUnavailable] exception if channel is not available (user not a member for instance)
  Future<void> sendMediaFile(String channelSid, String path, String mimetype,
      [Map<String, dynamic> attributes = const {}]);

  /// Sends a media message on the Channel [channelSid] with the media at the [FormData].
  /// Intended to be used only in browser environment
  Future<void> sendMediaFormData(String channelSid, Object formData, [Map<String, dynamic> attributes = const {}]);

  /// Binds/Replaces [handler] to be triggered once [TwilioMessage]s are added to the Channel [channelSid].
  ///
  /// Throws a [ChannelUnavailable] exception if channel is not available (user not a member for instance)
  Future<void> addOnMessageAddedHandler(String channelSid, Future<void> Function(TwilioMessage) handler);

  /// Binds/Replaces [handler] to be triggered once a [TwilioMember] leaves the Channel [channelSid]
  ///
  /// Throws a [ChannelUnavailable] exception if channel is not available (user not a member for instance)
  Future<void> addOnMemberLeaveChannelHandler(String channelSid, Future<void> Function(TwilioMember) handler);

  /// Binds/Replaces [handler] to be triggered once a [TwilioMember] joins the Channel [channelSid]
  ///
  /// Throws a [ChannelUnavailable] exception if channel is not available (user not a member for instance)
  Future<void> addOnMemberJoinChannelHandler(String channelSid, Future<void> Function(TwilioMember) handler);

  /// Binds/Replaces [handler] to be triggered once a [Member] starts/stops Typing on the Channel [channelSid]
  ///
  /// Throws a [ChannelUnavailable] exception if channel is not available (user not a member for instance)
  Future<void> addOnTypingHandler(String channelSid, Future<void> Function(TwilioMember, bool) handler);

  /// Leave the channel [channelSid]
  ///
  /// Throws a [ChannelUnavailable] exception if the user was not member of the channel
  Future<void> leaveChannel(String channelSid);

  /// Removes all handlers bound to Channel [channelSid].
  void removeHandlers(String channelSid);
}
