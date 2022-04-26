import 'package:common_barkibu_dart/models/pet.dart';
import 'package:common_barkibu_dart/repositories/pet/pet_repository.dart';

abstract class CreatePetUseCase {
  Future<Pet> createPet(Pet pet);
}

class CreatePetUseCaseImpl implements CreatePetUseCase {
  final PetRepository _petRepository;

  CreatePetUseCaseImpl(this._petRepository);

  @override
  Future<Pet> createPet(Pet pet) async => await _petRepository.create(pet);
}
