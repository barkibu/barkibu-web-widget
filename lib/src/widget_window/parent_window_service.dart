import 'dart:html';
import 'dart:js';
import 'dart:convert';

abstract class ParentWindowService {
  void notifyWidgetWindowClosed();
  void notifyAnalyticsEventLogged(String analyticsEventName, [Map<String, dynamic> parameters]);
  void notifyAnalyticsScreenLogged(String analyticsEventName);

  // Emitted if externalPetDataEnabled is true
  void notifyAddPetRequested(String path, Map<String, String> queryParameters);

  // Emitted if externalLinksEventsEnabled is true
  void notifyExportReportRequested(String exportUrl);
  void notifyEmailRequested(String subject, String body, String to);
  void notifyNutribotProductRequested(String productUrl, String productName, String productId);
  void notifyPhoneAppointmentRequested(String appointmentUrl);
  void notifyPhoneNumberAdded(String phoneNumber);
  void notifyRedirectionRequested(String destination, String url);
}

class ParentWindowServiceImpl implements ParentWindowService {
  ParentWindowServiceImpl();

  @override
  void notifyWidgetWindowClosed() {
    _postMessageAllChannels('widget_closed');
  }

  @override
  void notifyAddPetRequested(String path, Map<String, String> queryParameters) {
    _postMessageAllChannels('widget_add_pet_requested', {'path': path, 'query_params': queryParameters});
  }

  @override
  void notifyExportReportRequested(String exportUrl) {
    _postMessageAllChannels('widget_report_export_requested', {'url': exportUrl});
  }

  @override
  void notifyEmailRequested(String subject, String body, String to) {
    _postMessageAllChannels('widget_email_requested', {'subject': subject, 'body': body, 'to': to});
  }

  @override
  void notifyPhoneAppointmentRequested(String appointmentUrl) {
    notifyRedirectionRequested('phone_appointment', appointmentUrl);
  }

  @override
  void notifyRedirectionRequested(String destination, String url) {
    _postMessageAllChannels('widget_${destination}_requested', {'url': url});
  }

  @override
  void notifyNutribotProductRequested(String productUrl, String productName, String productId) {
    _postMessageAllChannels('widget_nutribot_product_requested', {
      'url': productUrl,
      'name': productName,
      'id': productId,
    });
  }

  @override
  void notifyAnalyticsEventLogged(String analyticsEventName, [Map<String, dynamic> parameters]) {
    _postMessageBrowser('widget_analytics_event_triggered',
        {'analytics_event_name': analyticsEventName, 'analytics_event_params': parameters});
  }

  @override
  void notifyAnalyticsScreenLogged(String analyticsEventName) {
    _postMessageBrowser('widget_analytics_screen_triggered',
        {'analytics_event_name': analyticsEventName, 'analytics_event_params': null});
  }

  @override
  void notifyPhoneNumberAdded(String phoneNumber) {
    _postMessageAllChannels('widget_phone_number_added', {'phoneNumber': phoneNumber});
  }

  void _postMessageWebview(String eventName, [Map<String, dynamic> payload]) {
    final message = {'event': eventName, 'payload': payload};
    context['ReactNativeWebView']?.callMethod('postMessage', [json.encode(message)]);
  }

  void _postMessageBrowser(String eventName, [Map<String, dynamic> payload]) {
    window.parent.postMessage({'event': eventName, 'payload': payload}, '*');
  }

  void _postMessageAllChannels(String eventName, [Map<String, dynamic> payload]) {
    _postMessageWebview(eventName, payload);
    _postMessageBrowser(eventName, payload);
  }
}
