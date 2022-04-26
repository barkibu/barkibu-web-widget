import 'package:common_barkibu_dart/common_barkibu_dart.dart';

class PetsEventAnalytics {
  final AnalyticsService _analytics;

  PetsEventAnalytics(this._analytics);

  void logClicksPetProfile() => _analytics.logEvent('pets-clicks_pet_profile');

  void logClicksPetProfileDetails() => _analytics.logEvent('pets-clicks_pet_profile_details');

  void logClicksPetClinicalHistory() => _analytics.logEvent('pets-clicks_pet_clinical_history');

  void logClicksPetHealthPlan() => _analytics.logEvent('pets-clicks_pet_health_plan');

  void logOpenPetAgeHint(String fromScreen) =>
      _analytics.logEvent('pets-opens_pet_age_hint', parameters: {'source': fromScreen});

  void logShowsPetAgeHint(String fromScreen) =>
      _analytics.logEvent('pets-shows_pet_age_hint', parameters: {'source': fromScreen});

  void logSelectsPetAge(String date, String fromScreen) {
    var yearsOld = Birthdate.getYearsOld(date);
    var monthOld = Birthdate.getMonthOld(date);
    var daysOld = Birthdate.getDaysOld(date);

    _analytics.logEvent('pets-selects_pet_age',
        parameters: {'age': '${yearsOld}y, ${monthOld}m, ${daysOld}d', 'source': fromScreen});
  }
}
