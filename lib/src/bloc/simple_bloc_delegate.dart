import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';

class SimpleBlocDelegate extends BlocDelegate {
  final MonitoringService _monitoringService;

  SimpleBlocDelegate(this._monitoringService);

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    _monitoringService.capture(event: error, severityLevel: SeverityLevel.ERROR, stackTrace: stacktrace);
  }
}
