import 'package:common_barkibu_dart/datasources/api/user_properties_api.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/user/user_properties.dart';
import 'package:common_barkibu_dart/models/user_properties.dart';

abstract class UserPropertiesDatasource {
  Future<UserProperties> getProperties();
}

class UserPropertiesDatasourceImpl implements UserPropertiesDatasource {
  final UserPropertiesApi _userPropertiesApi;

  UserPropertiesDatasourceImpl(this._userPropertiesApi);

  @override
  Future<UserProperties> getProperties() async {
    var response = await _userPropertiesApi.getProperties();

    if (!response.isSuccessful) {
      throw Exception('Failed to load user properties');
    }
    return UserPropertiesResponse.fromJson(response.body).toUserProperties();
  }
}
