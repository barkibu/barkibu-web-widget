import 'package:common_barkibu_dart/models/user.dart';
import 'package:meta/meta.dart';
import 'package:common_barkibu_dart/repositories/auth/auth_repository.dart';
import 'package:common_barkibu_dart/repositories/user/user_repository.dart';

abstract class SignUpUseCase {
  Future<dynamic> signUp(SignUpParams params);
}

class SignUpUseCaseImpl implements SignUpUseCase {
  final UserRepository _userRepository;
  final AuthRepository _authRepository;

  SignUpUseCaseImpl(this._userRepository, this._authRepository);

  @override
  Future<dynamic> signUp(SignUpParams params) async {
    var user = User(
      firstName: params.firstName,
      lastName: params.lastName,
      email: params.email,
      phoneNumberPrefix: params.phoneNumberPrefix,
      phoneNumber: params.phoneNumber,
    );

    var userCreated = await _userRepository.create(user, params.password);
    return await _authRepository.signIn(userCreated.email, params.password);
  }
}

class SignUpParams {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phoneNumberPrefix;
  final String phoneNumber;

  SignUpParams({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.password,
    this.phoneNumberPrefix,
    this.phoneNumber,
  });
}
