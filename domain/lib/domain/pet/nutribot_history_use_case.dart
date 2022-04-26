import 'package:common_barkibu_dart/models/nutribot_consultation.dart';
import 'package:common_barkibu_dart/repositories/nutribot/nutribot_repository.dart';

abstract class NutribotHistoryUseCase {
  Future<List<NutribotConsultation>> getNutribotConsultations(int pet);
}

class NutribotHistoryUseCaseImpl implements NutribotHistoryUseCase {
  final NutribotRepository _nutribotRepository;

  NutribotHistoryUseCaseImpl(this._nutribotRepository);

  @override
  Future<List<NutribotConsultation>> getNutribotConsultations(int petId) {
    return _nutribotRepository.getConsultations(petId);
  }
}
