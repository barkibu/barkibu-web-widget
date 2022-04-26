import 'package:chopper/chopper.dart';

part 'clinic_api.chopper.dart';

abstract class ClinicApi {
  Future<Response> getClinicsByCoords(String latitude, String longitude);

  Future<Response> getClinicsByAddress(String address);
}

@ChopperApi(baseUrl: 'clinics')
abstract class ClinicApiImpl extends ChopperService implements ClinicApi {
  static ClinicApi create([ChopperClient client]) => _$ClinicApiImpl(client);

  @Get()
  @override
  Future<Response> getClinicsByCoords(@Query() String latitude, @Query() String longitude);

  @Get()
  @override
  Future<Response> getClinicsByAddress(@Query() String address);
}
