import 'package:common_barkibu_dart/datasources/aivet/aivet_datasource.dart';
import 'package:common_barkibu_dart/datasources/pet/pet_datasource.dart';
import 'package:common_barkibu_dart/models/aivet.dart';
import 'package:common_barkibu_dart/models/consultation_options.dart';
import 'package:common_barkibu_dart/models/pet.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/services/locale_service.dart';

abstract class AiVetRepository {
  Future<ConsultationOptions> getConsultationsOptions();

  Future<List<SymptomDuration>> getSymptomDurations();

  Future<Anamnesis> anamnesis(String consultationId, Pet pet, List<Symptom> symptoms);
}

class AiVetRepositoryImpl implements AiVetRepository {
  final AiVetDatasource _aiVetDatasource;
  final PetDatasource _petDatasource;
  static const unknownLabel = "I don't know";

  AiVetRepositoryImpl(this._aiVetDatasource, this._petDatasource);

  @override
  Future<ConsultationOptions> getConsultationsOptions() async {
    return await _aiVetDatasource.getConsultationsOptions(locale: 'en');
  }

  @override
  Future<List<SymptomDuration>> getSymptomDurations() async {
    var consultationOptions = await getConsultationsOptions();
    consultationOptions.symptomsDurations.add(SymptomDuration(label: AiVetRepositoryImpl.unknownLabel));

    return consultationOptions.symptomsDurations;
  }

  @override
  Future<Anamnesis> anamnesis(String consultationId, Pet pet, List<Symptom> symptoms) async {
    return await _petDatasource.anamnesis(
      consultationId: consultationId,
      pet: pet,
      symptoms: symptoms,
      locale: ServiceLocator.container<LocaleService>().currentLocale,
    );
  }
}
