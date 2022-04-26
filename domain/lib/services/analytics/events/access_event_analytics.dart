import 'package:common_barkibu_dart/common_barkibu_dart.dart';

enum EventAccessType { Signup, Signin }

class AnalyticsTags {
  static const String APP_INITIALIZATION_DIRECT = 'Direct';
  static const String APP_INITIALIZATION_PUSH = 'Push Notification';
}

class AccessEventAnalytics {
  final AnalyticsService _analytics;

  AccessEventAnalytics(this._analytics);

  void logFirstOpen() => _analytics.logEvent('access-opens_app_1st_time');

  void logOpen(String source) => _analytics.logEvent('access-opens_app', parameters: {'source': source});

  void logClose(EventAccessType type) =>
      _analytics.logEvent('access-close_screen', parameters: {'type': type.toString().split('.').last});

  void logSignInSuccess() => _analytics.logEvent('access-successful_login');

  void logClickContactUs(EventAccessType type) =>
      _analytics.logEvent('access-contact_us', parameters: {'type': type.toString().split('.').last});

  void logClickSignIn() => _analytics.logEvent('access-clicks_login');

  void logClickSendCode(EventAccessType type) =>
      _analytics.logEvent('access-clicks_send_code', parameters: {'type': type.toString().split('.').last});

  void logClickCountryCode(EventAccessType type) =>
      _analytics.logEvent('access-views_country_code', parameters: {'type': type.toString().split('.').last});

  void logClickResendCode(EventAccessType type) =>
      _analytics.logEvent('access-resend_code', parameters: {'type': type.toString().split('.').last});

  void logSignInError() => _analytics.logEvent('access-login_error');

  void logOut() => _analytics.logEvent('access-logout');

  void logSignUpCreate() => _analytics.logEvent('access-clicks_create_account');

  void logSignUpCompleted() => _analytics.logEvent('access-account_created');

  void logOnboardingPetName(String name) =>
      _analytics.logEvent('access_mod_2-pet_name', parameters: {'pet_name': name});

  void logOnboardingPetSpecies(String species) =>
      _analytics.logEvent('access_mod_2-pet_species', parameters: {'species': species});

  void logOnboardingPetAge(String age) => _analytics.logEvent('access_mod_2-pet_age', parameters: {'age': age});

  void logOnboardingPetAgeMoreInfo() => _analytics.logEvent('access_mod_2-pet_age_more_info');

  void logOnboardingPetSex(String sex) => _analytics.logEvent('access_mod_2-pet_sex', parameters: {'sex': sex});

  void logOnboardingPetBreed(String breed) =>
      _analytics.logEvent('access_mod_2-pet_breed', parameters: {'breed': breed});

  void logOnboardingPetNeutered(bool neutered) =>
      _analytics.logEvent('access_mod_2-pet_neutered', parameters: {'neutered': _analytics.event.yesNo(neutered)});

  void logOnboardingPetGoodHealth(bool health) => _analytics
      .logEvent('access_mod_3-good_health', parameters: {'status': health ? 'good_health' : 'health_problem'});

  void logOnboardingPetOnlineVetNeeds(String answer) =>
      _analytics.logEvent('access_mod_3-online_vet_needs', parameters: {'answer': answer});

  void logOnboardingPreventionEvent(PreventionEventType eventType, String date) =>
      _analytics.logEvent('access_mod_4-prevention_event',
          parameters: {'type': eventType.toString().split('.').last, 'date': date});
}
