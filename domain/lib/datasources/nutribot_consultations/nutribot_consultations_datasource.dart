import 'package:common_barkibu_dart/datasources/api/nutribot_consultations_api.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/nutribot_consultations/nutribot_consultations.dart';
import 'package:common_barkibu_dart/models/nutribot_consultation.dart';

abstract class NutribotConsultationsDatasource {
  Future<List<NutribotConsultation>> getConsultations(int petId);
}

class NutribotConsultationsDatasourceImpl implements NutribotConsultationsDatasource {
  final NutribotConsultationsApi _NutribotConsultationsApi;

  NutribotConsultationsDatasourceImpl(this._NutribotConsultationsApi);

  @override
  Future<List<NutribotConsultation>> getConsultations(int petId) async {
    var response = await _NutribotConsultationsApi.getConsultations();

    if (!response.isSuccessful) return [];
    final a = NutribotConsultationsResponse.fromJson(response.body['nutribotConsultations']);
    final b = a.map((NutribotConsultationResponse food) => food.toNutribotConsultation()).toList();
    final c = b.where((consultation) => consultation.pet.id == petId).toList();
    return c;
  }
}
