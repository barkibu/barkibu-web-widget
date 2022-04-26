import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/services/analytics_service.dart';

class ScreenAnalyticsService {
  final AnalyticsService _analytics = ServiceLocator.container<AnalyticsService>();

  void logOnboarding() => _analytics.logScreen('Onboarding');

  void logRegisterOrLogin() => _analytics.logScreen('Register or Login');
  void logLogIn() => _analytics.logScreen('LogIn');
  void logRegister() => _analytics.logScreen('Register');
  void logCreatePet() => _analytics.logScreen('Create Pet');
  void logSendResetPasswordEmail() => _analytics.logScreen('Send Reset Password Email');
  void logResetPassword() => _analytics.logScreen('Reset Password');

  void logMainMenu() => _analytics.logScreen('Main Menu');

  void logTermsAndConditions() => _analytics.logScreen('Terms and Conditions');
  void logPrivacy() => _analytics.logScreen('Privacy');

  void logMyAccount() => _analytics.logScreen('My Account');
  void logEditUser() => _analytics.logScreen('Edit User');
  void logEditPet() => _analytics.logScreen('Edit Pet');

  void logFoodRecommendationDetails() => _analytics.logScreen('Food Recommendation Details');

  void logAskAVetChat() => _analytics.logScreen('Ask a Vet Chat');
  void logVirtualVetChat() => _analytics.logScreen('Virtual Vet Chat');
  void logNutribotChat() => _analytics.logScreen('Nutribot Chat');

  void logMyPets() => _analytics.logScreen('My Pets');
  void logMyHistoryAskAVetDates() => _analytics.logScreen('My History Ask a Vet Dates');
  void logMyHistoryAskAVetDetails() => _analytics.logScreen('My History Ask a Vet Details');
  void logMyHistoryVirtualVetDates() => _analytics.logScreen('My History Virtual Vet Dates');
  void logMyHistoryVirtualVetDetails() => _analytics.logScreen('My History Virtual Vet Details');
  void logMyHistoryNutribotDates() => _analytics.logScreen('My History Nutribot Dates');
  void logMyHistoryNutribotDetails() => _analytics.logScreen('My History Nutribot Details');
  void logPetProfile() => _analytics.logScreen('Pet Profile');
}
