import 'package:common_barkibu_dart/models/user_properties.dart';
import 'package:common_barkibu_dart/models/pet_properties.dart';
import 'package:common_barkibu_dart/services/analytics/event_analytics_service.dart';
import 'package:common_barkibu_dart/services/analytics/screen_analytics_service.dart';

abstract class AnalyticsService {
  void setUserProperties(Map<String, dynamic> properties);

  void logScreen(String name);

  void logEvent(String name, {Map<String, dynamic> parameters});

  void trackUserProperties(UserProperties properties) {
    setUserProperties({
      'dogs': properties.dogsCount.toString(),
      'cats': properties.catsCount.toString(),
      'created_at': properties.createdAt,
      'total_consultations': properties.consultationsCount.toString(),
      'pet_parent_id': properties.userKBKey,
      'email': properties.email,
      'phone': properties.phone,
      'pets': properties.pets.map((PetProperties petProperties) {
        return {
          'id': petProperties.id.toString(),
          'kb_key': petProperties.kbKey,
          'name': petProperties.name,
          'species': petProperties.species,
          'current_plan': petProperties.currentPlan,
          'current_plan_started': petProperties.currentPlanStarted,
          'current_plan_ends': petProperties.currentPlanEnds
        };
      }).toList(),
    });
  }

  ScreenAnalyticsService get screen => ScreenAnalyticsService();

  EventAnalyticsService get event => EventAnalyticsService();
}
