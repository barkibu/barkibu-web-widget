import 'package:common_barkibu_dart/repositories/auth/auth_repository.dart';

abstract class SignOutUseCase {
  Future<void> signOut();
}

class SignOutUseCaseImpl implements SignOutUseCase {
  final AuthRepository _authRepository;

  SignOutUseCaseImpl(this._authRepository);

  @override
  Future<void> signOut() async {
    await _authRepository.signOut();
  }
}
