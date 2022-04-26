import 'package:common_barkibu_dart/models/user.dart';
import 'package:common_barkibu_dart/repositories/auth/auth_repository.dart';

abstract class SetUserUseCase {
  Future<User> setUser(String accessToken);
}

class SetUserUseCaseImpl implements SetUserUseCase {
  final AuthRepository _authRepository;

  SetUserUseCaseImpl(this._authRepository);

  @override
  Future<User> setUser(String accessToken) async {
    // TODO fix this! As we cannot set the token anymore directly!!
    await _authRepository.setAccessToken(accessToken);

    final user = await _authRepository.getUser();
    if (user == null) {
      await _authRepository.signOut();
    }

    return user;
  }
}
