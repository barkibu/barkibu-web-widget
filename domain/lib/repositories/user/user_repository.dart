import 'package:common_barkibu_dart/datasources/user/user_datasource.dart';
import 'package:common_barkibu_dart/models/user.dart';

abstract class UserRepository {
  Future<User> create(User user, String password);
  Future<User> update(User user);
}

class UserRepositoryImpl implements UserRepository {
  final UserDatasource _userDatasource;

  UserRepositoryImpl(this._userDatasource);

  @override
  Future<User> create(User user, String password) => _userDatasource.create(user, password);

  @override
  Future<User> update(User user) => _userDatasource.update(user);
}
