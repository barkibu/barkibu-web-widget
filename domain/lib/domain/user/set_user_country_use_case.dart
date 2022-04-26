import 'package:common_barkibu_dart/models/user.dart';
import 'package:common_barkibu_dart/repositories/repositories.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/services/ip_tools_service.dart';
import 'package:common_barkibu_dart/services/services.dart';

abstract class SetUserCountryUseCase {
  void setUserCountry(User user);
}

class SetUserCountryUseCaseImpl implements SetUserCountryUseCase {
  final UserRepository userRepository;
  final IpToolsService ipToolsService;

  SetUserCountryUseCaseImpl(this.userRepository, this.ipToolsService);

  @override
  void setUserCountry(User user) async {
    try {
      final userCountry = await ipToolsService.getCountryCode();
      final userWithUpdatedCountry = user.copyWith(country: userCountry);
      await userRepository.update(userWithUpdatedCountry);
    } catch (e) {
      ServiceLocator.container<MonitoringService>().capture(event: e, severityLevel: SeverityLevel.ERROR);
    }
  }
}
