import 'package:common_barkibu_dart/repositories/pet/pet_repository.dart';

abstract class DeletePetUseCase {
  Future<bool> deletePet(int id);
}

class DeletePetUseCaseImpl implements DeletePetUseCase {
  final PetRepository _petRepository;

  DeletePetUseCaseImpl(this._petRepository);

  @override
  Future<bool> deletePet(int id) async => await _petRepository.delete(id);
}
