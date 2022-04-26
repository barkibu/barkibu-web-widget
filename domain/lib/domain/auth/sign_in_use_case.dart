import 'package:meta/meta.dart';
import 'package:common_barkibu_dart/repositories/auth/auth_repository.dart';

abstract class SignInUseCase {
  Future<dynamic> signIn(SignInParams params);
}

class SignInUseCaseImpl implements SignInUseCase {
  final AuthRepository _authRepository;

  SignInUseCaseImpl(this._authRepository);

  @override
  Future<dynamic> signIn(SignInParams params) async => await _authRepository.signIn(params.email, params.password);
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({@required this.email, @required this.password});
}
