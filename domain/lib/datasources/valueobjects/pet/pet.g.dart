// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetRequest _$PetRequestFromJson(Map<String, dynamic> json) {
  return PetRequest(
    species: json['species'] as String,
    gender: json['gender'] as String,
    neutered: json['neutered'] as bool,
    breed: json['breed'] as String,
    breedUuid: json['breedUuid'] as String,
    mixedBreed: json['mixedBreed'] as bool,
    size: json['size'] as String,
    name: json['name'] as String,
    birthdate: json['birthdate'] as String,
    avatarUrl: json['avatarUrl'] as String,
    chipNumber: json['chipNumber'] as String,
  );
}

Map<String, dynamic> _$PetRequestToJson(PetRequest instance) =>
    <String, dynamic>{
      'species': instance.species,
      'gender': instance.gender,
      'neutered': instance.neutered,
      'breed': instance.breed,
      'breedUuid': instance.breedUuid,
      'mixedBreed': instance.mixedBreed,
      'size': instance.size,
      'name': instance.name,
      'birthdate': instance.birthdate,
      'avatarUrl': instance.avatarUrl,
      'chipNumber': instance.chipNumber,
    };

PetWithFoodPreferencesRequest _$PetWithFoodPreferencesRequestFromJson(
    Map<String, dynamic> json) {
  return PetWithFoodPreferencesRequest(
    species: json['species'] as String,
    gender: json['gender'] as String,
    neutered: json['neutered'] as bool,
    breed: json['breed'] as String,
    mixedBreed: json['mixedBreed'] as bool,
    size: json['size'] as String,
    name: json['name'] as String,
    birthdate: json['birthdate'] as String,
    foodPreferences: json['foodPreferences'] == null
        ? null
        : FoodPreferencesRequest.fromJson(
            json['foodPreferences'] as Map<String, dynamic>),
    chipNumber: json['chipNumber'] as String,
  );
}

Map<String, dynamic> _$PetWithFoodPreferencesRequestToJson(
        PetWithFoodPreferencesRequest instance) =>
    <String, dynamic>{
      'species': instance.species,
      'gender': instance.gender,
      'neutered': instance.neutered,
      'breed': instance.breed,
      'mixedBreed': instance.mixedBreed,
      'size': instance.size,
      'name': instance.name,
      'birthdate': instance.birthdate,
      'foodPreferences': instance.foodPreferences,
      'chipNumber': instance.chipNumber,
    };

FoodPreferencesRequest _$FoodPreferencesRequestFromJson(
    Map<String, dynamic> json) {
  return FoodPreferencesRequest(
    needsWeightManagementFood: json['needsWeightManagementFood'] as bool,
    isOutdoor: json['isOutdoor'] as bool,
    hasHipJointIssues: json['hasHipJointIssues'] as bool,
    hasDullCoatOrDrySkin: json['hasDullCoatOrDrySkin'] as bool,
    preferedFoodType: json['preferedFoodType'] as String,
    foodSensitivities:
        (json['foodSensitivities'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$FoodPreferencesRequestToJson(
        FoodPreferencesRequest instance) =>
    <String, dynamic>{
      'needsWeightManagementFood': instance.needsWeightManagementFood,
      'isOutdoor': instance.isOutdoor,
      'hasHipJointIssues': instance.hasHipJointIssues,
      'hasDullCoatOrDrySkin': instance.hasDullCoatOrDrySkin,
      'preferedFoodType': instance.preferedFoodType,
      'foodSensitivities': instance.foodSensitivities,
    };

PetResponse _$PetResponseFromJson(Map<String, dynamic> json) {
  return PetResponse(
    json['id'] as int,
    json['kbKey'] as String,
    json['species'] as String,
    json['gender'] as String,
    json['neutered'] as bool,
    json['breed'] as String,
    json['breedUuid'] as String,
    json['mixedBreed'] as bool,
    json['size'] as String,
    json['name'] as String,
    json['birthdate'] as String,
    json['chipNumber'] as String,
  );
}

Map<String, dynamic> _$PetResponseToJson(PetResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kbKey': instance.kbKey,
      'species': instance.species,
      'gender': instance.gender,
      'neutered': instance.neutered,
      'breed': instance.breed,
      'breedUuid': instance.breedUuid,
      'mixedBreed': instance.mixedBreed,
      'size': instance.size,
      'name': instance.name,
      'birthdate': instance.birthdate,
      'chipNumber': instance.chipNumber,
    };

PriceResponse _$PriceResponseFromJson(Map<String, dynamic> json) {
  return PriceResponse(
    amountInCents: json['amountInCents'] as int,
    currency: json['currency'] as String,
    from: json['from'] as bool,
  );
}

Map<String, dynamic> _$PriceResponseToJson(PriceResponse instance) =>
    <String, dynamic>{
      'amountInCents': instance.amountInCents,
      'currency': instance.currency,
      'from': instance.from,
    };

BenefitsResponse _$BenefitsResponseFromJson(Map<String, dynamic> json) {
  return BenefitsResponse();
}

Map<String, dynamic> _$BenefitsResponseToJson(BenefitsResponse instance) =>
    <String, dynamic>{};

BenefitResponse _$BenefitResponseFromJson(Map<String, dynamic> json) {
  return BenefitResponse(
    benefit: json['benefit'] as String,
    included: json['included'] as bool,
    detailedInfo: json['detailedInfo'] as String,
  );
}

Map<String, dynamic> _$BenefitResponseToJson(BenefitResponse instance) =>
    <String, dynamic>{
      'benefit': instance.benefit,
      'included': instance.included,
      'detailedInfo': instance.detailedInfo,
    };

PetCountersResponse _$PetCountersResponseFromJson(Map<String, dynamic> json) {
  return PetCountersResponse();
}

Map<String, dynamic> _$PetCountersResponseToJson(
        PetCountersResponse instance) =>
    <String, dynamic>{};

PetCounterResponse _$PetCounterResponseFromJson(Map<String, dynamic> json) {
  return PetCounterResponse(
    count: json['count'] as int,
    type: _$enumDecodeNullable(_$PetCounterTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$PetCounterResponseToJson(PetCounterResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'type': _$PetCounterTypeEnumMap[instance.type],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$PetCounterTypeEnumMap = {
  PetCounterType.ASSESSMENT: 'ASSESSMENT',
  PetCounterType.VET_CONSULTATION: 'VET_CONSULTATION',
  PetCounterType.CLAIM: 'CLAIM',
};

PetInteractionsResponse _$PetInteractionsResponseFromJson(
    Map<String, dynamic> json) {
  return PetInteractionsResponse();
}

Map<String, dynamic> _$PetInteractionsResponseToJson(
        PetInteractionsResponse instance) =>
    <String, dynamic>{};

PetInteractionResponse _$PetInteractionResponseFromJson(
    Map<String, dynamic> json) {
  return PetInteractionResponse(
    id: json['id'] as int,
    type: _$enumDecodeNullable(_$InteractionTypeEnumMap, json['type']),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
  );
}

Map<String, dynamic> _$PetInteractionResponseToJson(
        PetInteractionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$InteractionTypeEnumMap[instance.type],
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$InteractionTypeEnumMap = {
  InteractionType.VOICE_INTERACTION: 'VoiceInteraction',
  InteractionType.CHAT_INTERACTION: 'ChatInteraction',
  InteractionType.EMAIL_INTERACTION: 'EmailInteraction',
};
