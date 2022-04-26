import 'package:common_barkibu_dart/services/analytics_service.dart';

export 'package:common_barkibu_dart/services/analytics_service.dart';

class AnalyticsServiceMock extends AnalyticsService {
  @override
  void setUserProperties(Map properties) {}

  @override
  void logScreen(String name) {
    print('Log screen $name');
  }

  @override
  void logEvent(String name, {Map<String, dynamic> parameters}) {
    print('Log event $name with $parameters');
  }
}
