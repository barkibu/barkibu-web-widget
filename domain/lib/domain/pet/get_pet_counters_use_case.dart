import 'package:common_barkibu_dart/models/models.dart';
import 'package:common_barkibu_dart/repositories/pet/pet_repository.dart';

abstract class GetPetCountersUseCase {
  Future<List<PetCounter>> getPetCounters(int id);
}

class GetPetCountersUseCaseImpl implements GetPetCountersUseCase {
  final PetRepository _petRepository;

  GetPetCountersUseCaseImpl(this._petRepository);

  @override
  Future<List<PetCounter>> getPetCounters(int petId) async => _petRepository.getCounters(petId);
}
