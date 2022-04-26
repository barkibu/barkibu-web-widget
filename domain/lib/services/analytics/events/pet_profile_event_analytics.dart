import 'package:common_barkibu_dart/common_barkibu_dart.dart';

class PetProfileEventAnalytics {
  final AnalyticsService _analytics;

  PetProfileEventAnalytics(this._analytics);

  void logClicksConsultationCounter(int count) =>
      _analytics.logEvent('pet_profile-clicks_consultation_counter', parameters: {'count': count});

  void logClicksPhoneConsultationCounter(int count) =>
      _analytics.logEvent('pet_profile-clicks_phone_consultation_counter', parameters: {'count': count});

  void logClicksClaimCounter(int count) =>
      _analytics.logEvent('pet_profile-clicks_claim_counter', parameters: {'count': count});

  void logClicksAssessmentHint() => _analytics.logEvent('pet_profile-clicks_assessment_hint');

  void logClicksConsultationDetails(String consultationId) =>
      _analytics.logEvent('pet_profile-clicks_consultation_details', parameters: {'consultation_id': consultationId});

  void logClicksMyPlan() => _analytics.logEvent('pet_profile-clicks_my_plan');

  void logClicksFeedback() => _analytics.logEvent('pet_profile-clicks_feedback');

  void logClicksUploadPhoto() => _analytics.logEvent('pet_profile-clicks_upload_photo');

  void logPhotoUploaded() => _analytics.logEvent('pet_profile-photo_uploaded');
}
