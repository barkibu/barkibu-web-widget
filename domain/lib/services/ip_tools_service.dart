import 'package:seeip_client/seeip_client.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/services/monitoring_service.dart';

abstract class IpToolsService {
  Future<String> getCountryCode();
  Future<String> getCountryName();
}

class IpToolsServiceImpl implements IpToolsService {
  Future<GeoIP> _getGeoIpData() async {
    final seeIp = SeeipClient();
    try {
      return await seeIp.getGeoIP();
    } catch (error) {
      ServiceLocator.container<MonitoringService>().capture(event: error, severityLevel: SeverityLevel.INFO);
      return null;
    }
  }

  @override
  Future<String> getCountryCode() async {
    return (await _getGeoIpData())?.country_code;
  }

  @override
  Future<String> getCountryName() async {
    return (await _getGeoIpData())?.country;
  }
}
