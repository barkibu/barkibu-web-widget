import 'package:common_barkibu_dart/datasources/user/user_properties_datasource.dart';
import 'package:common_barkibu_dart/models/user_properties.dart';

abstract class UserPropertiesRepository {
  Future<UserProperties> getProperties();
}

class UserPropertiesRepositoryImpl implements UserPropertiesRepository {
  final UserPropertiesDatasource _userPropertiesDatasource;

  UserPropertiesRepositoryImpl(this._userPropertiesDatasource);

  @override
  Future<UserProperties> getProperties() => _userPropertiesDatasource.getProperties();
}
