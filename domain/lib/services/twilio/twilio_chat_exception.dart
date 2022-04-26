class TwilioChatException implements Exception {
  final String message;
  TwilioChatException(this.message);
}

class InvalidAccessToken extends TwilioChatException {
  InvalidAccessToken(String message) : super(message);
}

class ChannelUnavailable extends TwilioChatException {
  ChannelUnavailable(String message) : super(message);
}
