import 'package:common_barkibu_dart/repositories/chat/chat_repository.dart';
import 'package:common_barkibu_dart/services/twilio.dart';

enum TwilioConnectionStatus { connecting, connected, noAgents, closed, error }

abstract class ConnectChatUseCase {
  Future<ConnectionResponse> connect(String consultationId);
  Future<ActiveChatConnection> retrieveActiveChatConnection();
}

class ConnectChatUseCaseImpl implements ConnectChatUseCase {
  final TwilioChatService _twilio;
  final ChatRepository _chatRepository;

  ConnectChatUseCaseImpl(this._twilio, this._chatRepository);

  @override
  Future<ConnectionResponse> connect(String consultationId) async {
    try {
      _twilio.init();
      final channel = await _chatRepository.getChannel(consultationId);

      if (channel.agentsAvailable) {
        await _twilio.initChatClient(channel.accessToken);
        return ConnectionResponse(TwilioConnectionStatus.connected,
            twilio: _twilio, channelSid: channel.channelSid, accessToken: channel.accessToken);
      } else {
        return ConnectionResponse(TwilioConnectionStatus.noAgents);
      }
    } catch (exception) {
      return ConnectionResponse(TwilioConnectionStatus.error);
    }
  }

  @override
  Future<ActiveChatConnection> retrieveActiveChatConnection() async {
    _twilio.init();

    var channel = await _chatRepository.getActiveChat();

    if (channel != null) {
      await _twilio.initChatClient(channel.accessToken);
      return ActiveChatConnection(
        _twilio,
        channelSid: channel.channelSid,
        consultationId: channel.consultationId,
        petId: channel.petId,
      );
    }
    return null;
  }
}

class ConnectionResponse {
  final TwilioConnectionStatus status;
  final String accessToken;
  final String channelSid;
  final TwilioChatService twilio;

  ConnectionResponse(this.status, {this.twilio, this.channelSid, this.accessToken});
}

class ActiveChatConnection {
  final TwilioChatService twilio;
  final String channelSid;
  final String consultationId;
  final int petId;

  ActiveChatConnection(this.twilio, {this.channelSid, this.consultationId, this.petId});
}
