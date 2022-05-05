import 'package:common_barkibu_dart/messages/authMessages.i18n.dart';

class AuthMessages_tsc extends AuthMessages {
  const AuthMessages_tsc();

  @override
  Auth_homeAuthMessages get auth_home => Auth_homeAuthMessages_tsc(this);
}

class Auth_homeAuthMessages_tsc extends Auth_homeAuthMessages {
  const Auth_homeAuthMessages_tsc(AuthMessages_tsc parent) : super(parent);

  @override
  String welcome_title(String appName) => 'Get Expert Pet Health Advice';

  @override
  String sign_up(String brandName) => 'Sign up';

  @override
  String welcome_subtitle(String appName) =>
      'Sign up or sign in for free pet health and wellness guidance from our team of veterinary professionals';
}
