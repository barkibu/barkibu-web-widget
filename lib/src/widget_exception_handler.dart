import 'dart:html';
import 'package:common_barkibu_dart/services/monitoring_service.dart' as monitoring;
import 'package:logging/logging.dart';
import 'package:angular/angular.dart';
import 'package:sentry/sentry.dart';
import 'package:angular_sentry/angular_sentry.dart';
import 'package:platform_detect/platform_detect.dart' as platform;
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/widget_configuration.dart';

SentryClient sentryProvider(WidgetConfiguration config) => SentryClient(
      dsn: config.sentryDsn,
      environmentAttributes: Event(
        environment: config.envName,
        release: 'web-widgets-${config.version}',
        contexts: Contexts(
          browser: Browser(name: platform.browser.name, version: platform.browser.version.toString()),
          operatingSystem: OperatingSystem(name: platform.operatingSystem.name),
        ),
        extra: {
          'client_id': config.clientId,
          'locale': config.locale,
        },
      ),
    );

WidgetConfiguration configurationFactory() => ServiceLocator.container<Configuration>();

const exceptionHandlerModule = Module(provide: [
  FactoryProvider(SentryClient, sentryProvider),
  ClassProvider(ExceptionHandler, useClass: WidgetExceptionHandler),
  FactoryProvider(WidgetConfiguration, configurationFactory),
  ClassProvider(Logger)
]);

class WidgetExceptionHandler extends AngularSentry {
  final WidgetConfiguration config;

  WidgetExceptionHandler(this.config, SentryClient client) : super(client);

  @override
  Event transformEvent(Event e) {
    return super.transformEvent(e).copyWith(
      extra: {'location': window.location.hash},
    );
  }

  @override
  void capture(exception, [trace, String reason]) {
    if (['staging', 'production'].contains(config.envName)) {
      super.capture(exception, trace, reason);
    }
    window.console.error(ExceptionHandler.exceptionToString(exception, trace, reason));
  }
}

class MonitoringServiceImpl implements monitoring.MonitoringService {
  final ExceptionHandler _exceptionHandler;

  MonitoringServiceImpl(this._exceptionHandler);

  @override
  void capture({event, monitoring.SeverityLevel severityLevel, stackTrace}) {
    _exceptionHandler.call(event, stackTrace);
  }
}
