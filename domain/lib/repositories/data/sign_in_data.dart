import 'package:common_barkibu_dart/models/user.dart';

class SignInData {
  final User user;
  final String accessToken;

  SignInData(this.user, this.accessToken);
}
