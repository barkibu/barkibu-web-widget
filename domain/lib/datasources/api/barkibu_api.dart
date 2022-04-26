import 'package:chopper/chopper.dart';

part 'barkibu_api.chopper.dart';

abstract class BarkibuApi {
  Future<Response> getConsultationsOptions(String locale);
}

@ChopperApi(baseUrl: '/consultations')
abstract class BarkibuApiImpl extends ChopperService implements BarkibuApi {
  static BarkibuApi create([ChopperClient client]) => _$BarkibuApiImpl(client);

  @Get(path: 'consultation_options')
  @override
  Future<Response> getConsultationsOptions(@Query() String locale);
}
