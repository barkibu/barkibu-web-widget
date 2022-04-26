import 'package:common_barkibu_dart/datasources/api/barkibu_api.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/consultation_options.dart';
import 'package:common_barkibu_dart/models/consultation_options.dart';

abstract class AiVetDatasource {
  Future<ConsultationOptions> getConsultationsOptions({String locale});
}

class AiVetDatasourceImpl implements AiVetDatasource {
  final BarkibuApi _barkibuApi;

  AiVetDatasourceImpl(this._barkibuApi);

  @override
  Future<ConsultationOptions> getConsultationsOptions({String locale}) async {
    final response = await _barkibuApi.getConsultationsOptions(locale);

    return ConsultationOptionsVO.fromJson(response.body).toConsultationOptions();
  }
}
