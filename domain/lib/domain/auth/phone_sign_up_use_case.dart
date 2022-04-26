import 'package:common_barkibu_dart/common_barkibu_dart.dart';

abstract class PhoneSignUpUseCase {
  Future<PhoneSignUpOperationResult> sendVerificationCode(AuthData authData);
  Future<PhoneSignUpOperationResult> signUp(AuthData authData);
}

class PhoneSignUpUseCaseImpl implements PhoneSignUpUseCase {
  final PhoneSignUpRepository _repository;

  PhoneSignUpUseCaseImpl(this._repository);

  @override
  Future<PhoneSignUpOperationResult> sendVerificationCode(AuthData authData) async {
    return await _repository.sendVerificationCode(authData);
  }

  @override
  Future<PhoneSignUpOperationResult> signUp(AuthData authData) async {
    return await _repository.signUp(authData);
  }
}
