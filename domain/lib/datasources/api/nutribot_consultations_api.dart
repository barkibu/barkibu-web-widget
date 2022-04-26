import 'package:chopper/chopper.dart';

part 'nutribot_consultations_api.chopper.dart';

abstract class NutribotConsultationsApi {
  Future<Response> getConsultations();
}

@ChopperApi(baseUrl: 'nutribot_consultations')
abstract class NutribotConsultationsApiImpl extends ChopperService implements NutribotConsultationsApi {
  static NutribotConsultationsApi create([ChopperClient client]) => _$NutribotConsultationsApiImpl(client);

  @Get()
  @override
  Future<Response> getConsultations();
}
