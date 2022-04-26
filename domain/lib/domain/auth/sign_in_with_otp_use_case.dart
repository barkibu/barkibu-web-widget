import 'package:common_barkibu_dart/repositories/auth/auth_repository.dart';

abstract class SignInWithOTPUseCase {
  Future<dynamic> signInWithOTP(String otpToken);
}

class SignInWithOTPUseCaseImpl implements SignInWithOTPUseCase {
  final AuthRepository _authRepository;

  SignInWithOTPUseCaseImpl(this._authRepository);

  @override
  Future<dynamic> signInWithOTP(String otpToken) async => await _authRepository.signInWithOTPToken(otpToken);
}
