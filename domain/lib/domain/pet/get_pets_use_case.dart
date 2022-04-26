import 'package:common_barkibu_dart/models/pet.dart';
import 'package:common_barkibu_dart/repositories/pet/pet_repository.dart';

abstract class GetPetsUseCase {
  Future<List<Pet>> getPets();
  Future<Pet> getPet(int petId);
}

class GetPetsUseCaseImpl implements GetPetsUseCase {
  final PetRepository _petRepository;

  GetPetsUseCaseImpl(this._petRepository);

  @override
  Future<List<Pet>> getPets() async => await _petRepository.getPets();

  @override
  Future<Pet> getPet(int petId) async => await _petRepository.getPet(petId);
}
