import 'package:common_barkibu_dart/models/user.dart';
import 'package:common_barkibu_dart/repositories/user/user_repository.dart';

abstract class UpdateUserUseCase {
  Future<User> update(User user);
}

class UpdateUserUseCaseImpl implements UpdateUserUseCase {
  final UserRepository _userRepository;

  UpdateUserUseCaseImpl(this._userRepository);

  @override
  Future<User> update(User user) => _userRepository.update(user);
}
