import 'package:common_barkibu_dart/repositories/auth/auth_repository.dart';
import 'package:common_barkibu_dart/viewmodels/auth/auth_data.dart';

abstract class ResetPasswordUseCase {
  Future<bool> sendEmail(String email);
  Future<bool> resetPassword(AuthData userData);
}

class ResetPasswordUseCaseImpl implements ResetPasswordUseCase {
  final AuthRepository _authRepository;

  ResetPasswordUseCaseImpl(this._authRepository);

  @override
  Future<bool> sendEmail(String email) async => await _authRepository.sendEmail(email);

  @override
  Future<bool> resetPassword(AuthData userData) async => await _authRepository.resetPassword(userData);
}
