import 'package:meta/meta.dart';

enum SeverityLevel { FATAL, ERROR, WARNING, INFO, DEBUG }

abstract class MonitoringService {
  void capture({
    @required dynamic event,
    @required SeverityLevel severityLevel,
    dynamic stackTrace,
  });
}

class DebugMonitoringService extends MonitoringService {
  @override
  void capture({event, SeverityLevel severityLevel, stackTrace}) {
    print('Debug: $event');
    print('Debug: $severityLevel');
  }
}
