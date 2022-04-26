import 'package:common_barkibu_dart/models/food_recommended.dart';
import 'package:common_barkibu_dart/models/nutribot_consultation_pet.dart';

class NutribotConsultation {
  final DateTime createdAt;
  final NutribotConsultationPet pet;
  final List<FoodRecommended> foodRecommendations;

  const NutribotConsultation({
    this.createdAt,
    this.pet,
    this.foodRecommendations,
  });

  static List<NutribotConsultation> sortedByDate(List<NutribotConsultation> consultations) {
    return List.from(consultations)..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }
}
