import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/repositories/auth/phone_sign_in_repository.dart';

abstract class PhoneSignInUseCase {
  Future<PhoneSignInOperationResult> sendVerificationCode(AuthData authData);
  Future<PhoneSignInOperationResult> signIn(AuthData authData);
}

class PhoneSignInUseCaseImpl implements PhoneSignInUseCase {
  final PhoneSignInRepository _repository;

  PhoneSignInUseCaseImpl(this._repository);

  @override
  Future<PhoneSignInOperationResult> sendVerificationCode(AuthData authData) async {
    return await _repository.sendVerificationCode(authData);
  }

  @override
  Future<PhoneSignInOperationResult> signIn(AuthData authData) async {
    return await _repository.signIn(authData);
  }
}
