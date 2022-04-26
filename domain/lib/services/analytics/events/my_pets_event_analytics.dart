import 'package:common_barkibu_dart/common_barkibu_dart.dart';

class MyPetsEventAnalytics {
  final AnalyticsService _analytics;

  MyPetsEventAnalytics(this._analytics);

  void logMyPetsAddsPet() => _analytics.logEvent('my_pets-adds_pet');

  void logMyPetsPetEdit() => _analytics.logEvent('my_pets-pet_edit');
}
