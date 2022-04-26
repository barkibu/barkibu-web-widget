import 'package:common_barkibu_dart/models/profile.dart';
import 'package:common_barkibu_dart/models/pet.dart';
import 'package:common_barkibu_dart/repositories/auth/auth_repository.dart';
import 'package:common_barkibu_dart/repositories/pet/pet_repository.dart';

abstract class GetProfileUseCase {
  Future<Profile> getProfile();
  Future<List<Pet>> getPets();
}

class GetProfileUseCaseImpl implements GetProfileUseCase {
  final AuthRepository _authRepository;
  final PetRepository _petRepository;

  GetProfileUseCaseImpl(this._authRepository, this._petRepository);

  @override
  Future<Profile> getProfile() async {
    var data = await Future.wait([
      _authRepository.getUser(),
      _petRepository.getPets(),
    ]);

    return Profile(data[0], data[1]);
  }

  @override
  Future<List<Pet>> getPets() async {
    return await _petRepository.getPets();
  }
}
