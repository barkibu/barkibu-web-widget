import 'package:common_barkibu_dart/models/models.dart';
import 'package:common_barkibu_dart/repositories/pet/pet_repository.dart';

abstract class GetPetInteractionsUseCase {
  Future<List<Interaction>> getPetInteractions(int id);
}

class GetPetInteractionsUseCaseImpl implements GetPetInteractionsUseCase {
  final PetRepository _petRepository;

  GetPetInteractionsUseCaseImpl(this._petRepository);

  @override
  Future<List<Interaction>> getPetInteractions(int petId) async => _petRepository.getInteractions(petId);
}
