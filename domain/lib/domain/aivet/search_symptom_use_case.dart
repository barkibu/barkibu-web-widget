import 'package:common_barkibu_dart/models/consultation_options.dart';
import 'package:common_barkibu_dart/repositories/pet/pet_repository.dart';

abstract class SearchSymptomUseCase {
  Future<List<SymptomFound>> findSymptoms(int petId, String query);
}

class SearchSymptomUseCaseImpl implements SearchSymptomUseCase {
  final PetRepository _petRepository;

  SearchSymptomUseCaseImpl(this._petRepository);

  @override
  Future<List<SymptomFound>> findSymptoms(int petId, String query) {
    return _petRepository.findSymptoms(petId, query);
  }
}
