import 'package:common_barkibu_dart/repositories/user/user_properties_repository.dart';
import 'package:common_barkibu_dart/services/analytics_service.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';

abstract class SetUserPropertiesUseCase {
  Future<void> setProperties();
}

class SetUserPropertiesUseCaseImpl implements SetUserPropertiesUseCase {
  final UserPropertiesRepository _userPropertiesRepository;
  final AnalyticsService _analyticsService;

  SetUserPropertiesUseCaseImpl(this._userPropertiesRepository, this._analyticsService);

  @override
  Future<void> setProperties() async {
    try {
      final userProperties = await _userPropertiesRepository.getProperties();
      _analyticsService.trackUserProperties(userProperties);
    } catch (exception) {
      ServiceLocator.container<MonitoringService>().capture(event: exception, severityLevel: SeverityLevel.ERROR);
    }
  }
}
