import 'package:common_barkibu_dart/services/analytics_service.dart';
import 'package:web_widget/src/analytics/segment_js_wrapper.dart' as segment;
import 'package:web_widget/config.g.dart' as config;
import 'package:web_widget/src/widget_configuration.dart';
import 'package:web_widget/src/widget_window/parent_window_service.dart';
import 'package:js/js_util.dart' as js;

class AnalyticsNotificationsService extends AnalyticsService {
  final WidgetConfiguration widgetConfig;
  final ParentWindowService parentWindowService;

  AnalyticsNotificationsService(this.widgetConfig, this.parentWindowService) {
    segment.load(config.segmentWriteKey);
  }

  @override
  void setUserProperties(Map<String, dynamic> properties) async {
    final sendProperties = Map.from(properties);
    sendProperties['client_id'] = widgetConfig.clientId;
    sendProperties['country'] = widgetConfig.country;
    await segment.identify(sendProperties['pet_parent_id'], js.jsify(sendProperties));
  }

  @override
  void logEvent(String name, {Map<String, dynamic> parameters}) {
    if (parameters != null) {
      segment.track(name, js.jsify(parameters));
      parentWindowService.notifyAnalyticsEventLogged(name, parameters);
    } else {
      segment.track(name);
      parentWindowService.notifyAnalyticsEventLogged(name);
    }
  }

  @override
  void logScreen(String name) {
    segment.page(name);
    parentWindowService.notifyAnalyticsScreenLogged(name);
  }
}
