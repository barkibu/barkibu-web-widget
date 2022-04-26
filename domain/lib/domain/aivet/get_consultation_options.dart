import 'package:common_barkibu_dart/models/consultation_options.dart';
import 'package:common_barkibu_dart/repositories/aivet/aivet_repository.dart';

abstract class GetConsultationOptionsUseCase {
  Future<ConsultationOptions> retrieve();
}

class GetConsultationOptionsUseCaseImpl implements GetConsultationOptionsUseCase {
  final AiVetRepository _aiVetRepository;

  GetConsultationOptionsUseCaseImpl(this._aiVetRepository);

  @override
  Future<ConsultationOptions> retrieve() async => await _aiVetRepository.getConsultationsOptions();
}
