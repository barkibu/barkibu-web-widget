import 'package:common_barkibu_dart/models/pet.dart';
import 'package:common_barkibu_dart/repositories/pet/pet_repository.dart';

abstract class UpdatePetUseCase {
  Future<bool> updatePet(Pet pet);
}

class UpdatePetUseCaseImpl implements UpdatePetUseCase {
  final PetRepository _petRepository;

  UpdatePetUseCaseImpl(this._petRepository);

  @override
  Future<bool> updatePet(Pet pet) async => await _petRepository.update(pet);
}
