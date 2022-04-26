import 'package:common_barkibu_dart/datasources/valueobjects/food_recommendations/food_recommendations.dart';
import 'package:common_barkibu_dart/models/nutribot_consultation.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/nutribot_consultations/nutribot_consultation_pet.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nutribot_consultations.g.dart';

@JsonSerializable()
class NutribotConsultationResponse {
  final dynamic createdAt;
  final dynamic pet;
  final List<FoodRecommendationResponse> foodRecommendations;

  const NutribotConsultationResponse({
    this.createdAt,
    this.pet,
    this.foodRecommendations,
  });

  factory NutribotConsultationResponse.fromJson(Map<String, dynamic> json) =>
      _$NutribotConsultationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NutribotConsultationResponseToJson(this);

  NutribotConsultation toNutribotConsultation() => NutribotConsultation(
        createdAt: DateTime.parse(createdAt),
        pet: NutribotConsultationPetResponse.fromJson(pet).toPet(),
        foodRecommendations: foodRecommendations.map((food) => food.toFoodRecommended()).toList(),
      );
}

class NutribotConsultationsResponse {
  static List<NutribotConsultationResponse> fromJson(List<dynamic> json) =>
      json?.map((dynamic consultation) => NutribotConsultationResponse.fromJson(consultation))?.toList() ?? [];
}
