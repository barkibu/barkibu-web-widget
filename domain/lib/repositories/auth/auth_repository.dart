import 'package:common_barkibu_dart/datasources/auth/auth_datasource.dart';
import 'package:common_barkibu_dart/models/user.dart';
import 'package:common_barkibu_dart/viewmodels/auth/auth_data.dart';

abstract class AuthRepository {
  Future<dynamic> signIn(String email, String password);
  Future<dynamic> signInWithOTPToken(String otpToken);
  Future<void> setAccessToken(String accessToken);
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<User> getUser();
  Future<bool> sendEmail(String email);
  Future<bool> resetPassword(AuthData userData);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _authDatasource;

  AuthRepositoryImpl(this._authDatasource);

  @override
  Future<dynamic> signIn(String email, String password) async {
    return await _authDatasource.signIn(email, password);
  }

  @override
  Future<dynamic> signInWithOTPToken(String otpToken) async {
    return await _authDatasource.signInWithOTPToken(otpToken);
  }

  @override
  Future<void> setAccessToken(String accessToken) async {
    await _authDatasource.setAccessToken(accessToken);
  }

  @override
  Future<void> signOut() async {
    try {
      await _authDatasource.signOut();
    } finally {
      await _authDatasource.deleteAccessToken();
    }
  }

  @override
  Future<bool> isSignedIn() async {
    return (await _authDatasource.getAccessToken()) != null;
  }

  @override
  Future<User> getUser() async {
    return await _authDatasource.getUser();
  }

  @override
  Future<bool> sendEmail(String email) async {
    return await _authDatasource.sendEmail(email);
  }

  @override
  Future<bool> resetPassword(AuthData userData) async {
    return await _authDatasource.resetPassword(userData);
  }
}
