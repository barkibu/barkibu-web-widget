import 'dart:convert';

import 'package:common_barkibu_dart/datasources/api/user_api.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/api/api_errors.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/user/exceptions.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/user/user.dart';
import 'package:common_barkibu_dart/models/user.dart';

abstract class UserDatasource {
  Future<User> create(User user, String password);
  Future<User> update(User user);
}

class UserDatasourceImpl implements UserDatasource {
  final UserApi _userApi;

  UserDatasourceImpl(this._userApi);

  @override
  Future<User> create(User user, String password) async {
    var response = await _userApi.createUser(UserRequest(
      email: user.email,
      firstName: user.firstName,
      lastName: user.lastName,
      phoneNumber: user.phoneNumber,
      country: user.country,
      phoneNumberPrefix: user.phoneNumberPrefix,
      password: password,
    ));

    if (!response.isSuccessful) {
      final apiError = ApiValidationErrorResponse.fromJson(json.decode(response.error));
      throw UserSignUpException(apiError.toErrorMap());
    }
    return UserResponse.fromJson(response.body).toUser();
  }

  @override
  Future<User> update(User user) async {
    var response = await _userApi.updateUser(UserRequest(
      email: user.email,
      firstName: user.firstName,
      lastName: user.lastName,
      phoneNumber: user.phoneNumber,
      country: user.country,
      phoneNumberPrefix: user.phoneNumberPrefix,
      password: null,
      avatarUrl: user.avatarUrl,
    ));

    if (!response.isSuccessful) {
      final apiError = ApiValidationErrorResponse.fromJson(json.decode(response.error));
      throw UserUpdateException(apiError.toErrorMap());
    }
    return UserResponse.fromJson(response.body).toUser();
  }
}
