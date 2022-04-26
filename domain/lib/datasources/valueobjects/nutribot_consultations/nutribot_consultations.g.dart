// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutribot_consultations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutribotConsultationResponse _$NutribotConsultationResponseFromJson(
    Map<String, dynamic> json) {
  return NutribotConsultationResponse(
    createdAt: json['createdAt'],
    pet: json['pet'],
    foodRecommendations: (json['foodRecommendations'] as List)
        ?.map((e) => e == null
            ? null
            : FoodRecommendationResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$NutribotConsultationResponseToJson(
        NutribotConsultationResponse instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'pet': instance.pet,
      'foodRecommendations': instance.foodRecommendations,
    };
