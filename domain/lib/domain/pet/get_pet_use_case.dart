import 'package:common_barkibu_dart/models/pet.dart';
import 'package:common_barkibu_dart/repositories/pet/pet_repository.dart';

abstract class GetPetUseCase {
  Future<Pet> getPet(int id);
}

class GetPetUseCaseImpl implements GetPetUseCase {
  final PetRepository _petRepository;

  GetPetUseCaseImpl(this._petRepository);

  @override
  Future<Pet> getPet(int id) async => await _petRepository.getPet(id);
}
