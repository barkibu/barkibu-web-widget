import 'package:common_barkibu_dart/common_barkibu_dart.dart';

class AskAVetEventAnalytics {
  final AnalyticsService _analytics;

  AskAVetEventAnalytics(this._analytics);

  void logAskAVetStart(String source) => _analytics.logEvent('ask_a_vet-starts', parameters: {'source': source});

  void logAskAVetConfirms() => _analytics.logEvent('ask_a_vet-confirms');

  void logAskAVetVideoStartCall() => _analytics.logEvent('ask_a_vet-video_start_call');

  void logAskAVetVideoEndCall() => _analytics.logEvent('ask_a_vet-video_end_call');

  void logAskAVetVideoStart() => _analytics.logEvent('ask_a_vet-video_starts');

  void logAskAVetVideoEnd() => _analytics.logEvent('ask_a_vet-video_ends');

  void logAskAVetChat() {
    _logAskAVetChooseChannel('chat');
    _analytics.logEvent('ask_a_vet-chat');
  }

  void logAskAVetPhone() {
    _logAskAVetChooseChannel('phone');
    _analytics.logEvent('ask_a_vet-phone');
  }

  void logAskAVetEmail() {
    _logAskAVetChooseChannel('email');
    _analytics.logEvent('ask_a_vet-email');
  }

  void logAskAVetEmailClientOpened() {
    _analytics.logEvent('ask_a_vet-email_open_client');
  }

  void logAskAVetEmailSended() {
    _analytics.logEvent('ask_a_vet-email_sent');
  }

  void _logAskAVetChooseChannel(String channel) {
    _analytics.logEvent('ask_a_vet-choose_channel', parameters: {
      'channel': channel,
    });
  }

  void logAskAVetAnotherQuestion() => _analytics.logEvent('ask_a_vet-another_question');

  void logAskAVetEnd() => _analytics.logEvent('ask_a_vet-finish');

  void logAskAVetHelpful(bool isHelpful) =>
      _analytics.logEvent('ask_a_vet-was_helpful', parameters: {'answer': _analytics.event.yesNo(isHelpful)});
}
