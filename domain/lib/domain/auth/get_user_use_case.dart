import 'package:common_barkibu_dart/models/user.dart';
import 'package:common_barkibu_dart/repositories/auth/auth_repository.dart';

abstract class GetUserUseCase {
  Future<User> getUser();
}

class GetUserUseCaseImpl implements GetUserUseCase {
  final AuthRepository _authRepository;

  GetUserUseCaseImpl(this._authRepository);

  @override
  Future<User> getUser() async {
    final isSignedIn = await _authRepository.isSignedIn();
    if (!isSignedIn) return null;

    final user = await _authRepository.getUser();
    if (user == null) {
      await _authRepository.signOut();
    }

    return user;
  }
}
