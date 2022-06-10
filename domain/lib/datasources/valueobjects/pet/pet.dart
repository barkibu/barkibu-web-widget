import 'package:common_barkibu_dart/configuration.dart';
import 'package:common_barkibu_dart/models/health_plan.dart';
import 'package:common_barkibu_dart/models/interaction.dart';
import 'package:common_barkibu_dart/models/pet.dart';
import 'package:common_barkibu_dart/models/pet_counter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:common_barkibu_dart/service_locator.dart';
part 'pet.g.dart';

@JsonSerializable()
class PetRequest {
  final String species;
  final String gender;
  final bool neutered;
  final String breed;
  final String breedUuid;
  final bool mixedBreed;
  final String size;
  final String name;
  final String birthdate;
  final String avatarUrl;
  final String chipNumber;

  PetRequest({
    this.species,
    this.gender,
    this.neutered,
    this.breed,
    this.breedUuid,
    this.mixedBreed,
    this.size,
    this.name,
    this.birthdate,
    this.avatarUrl,
    this.chipNumber,
  });

  factory PetRequest.fromJson(Map<String, dynamic> json) => _$PetRequestFromJson(json['pet']);

  Map<String, dynamic> toJson() => <String, dynamic>{'pet': _$PetRequestToJson(this)};
}

@JsonSerializable()
class PetWithFoodPreferencesRequest {
  final String species;
  final String gender;
  final bool neutered;
  final String breed;
  final bool mixedBreed;
  final String size;
  final String name;
  final String birthdate;
  final FoodPreferencesRequest foodPreferences;
  final String chipNumber;
  PetWithFoodPreferencesRequest({
    this.species,
    this.gender,
    this.neutered,
    this.breed,
    this.mixedBreed,
    this.size,
    this.name,
    this.birthdate,
    this.foodPreferences,
    this.chipNumber,
  });

  factory PetWithFoodPreferencesRequest.fromJson(Map<String, dynamic> json) =>
      _$PetWithFoodPreferencesRequestFromJson(json);

  Map<String, dynamic> toJson() => <String, dynamic>{'pet': _$PetWithFoodPreferencesRequestToJson(this)};
}

@JsonSerializable()
class FoodPreferencesRequest {
  final bool needsWeightManagementFood;
  final bool isOutdoor;
  final bool hasHipJointIssues;
  final bool hasDullCoatOrDrySkin;
  final String preferedFoodType;
  final List<String> foodSensitivities;

  FoodPreferencesRequest({
    this.needsWeightManagementFood,
    this.isOutdoor,
    this.hasHipJointIssues,
    this.hasDullCoatOrDrySkin,
    this.preferedFoodType,
    this.foodSensitivities,
  });

  factory FoodPreferencesRequest.fromJson(Map<String, dynamic> json) => _$FoodPreferencesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FoodPreferencesRequestToJson(this);
}

@JsonSerializable()
class PetResponse {
  final int id;
  final String kbKey;
  final String species;
  final String gender;
  final bool neutered;
  final String breed;
  final String breedUuid;
  final bool mixedBreed;
  final String size;
  final String name;
  final String birthdate;
  final String chipNumber;

  const PetResponse(
    this.id,
    this.kbKey,
    this.species,
    this.gender,
    this.neutered,
    this.breed,
    this.breedUuid,
    this.mixedBreed,
    this.size,
    this.name,
    this.birthdate,
    this.chipNumber,
  );

  factory PetResponse.fromJson(Map<String, dynamic> json) => _$PetResponseFromJson(json['pet']);

  Map<String, dynamic> toJson() => <String, dynamic>{'pet': _$PetResponseToJson(this)};

  Pet toPet() => Pet(
        id: id,
        kbKey: kbKey,
        species: species,
        sex: gender,
        neutered: neutered,
        breed: breed,
        breedUuid: breedUuid,
        mixedBreed: mixedBreed,
        size: size,
        name: name,
        birthdate: birthdate,
        avatarUrl: '${ServiceLocator.container<Configuration>().backendUrl}/pets/${id}/avatar',
        chipNumber: chipNumber,
      );
}

class PetsResponse {
  static List<PetResponse> fromJson(List<dynamic> json) =>
      json?.map((dynamic pet) => PetResponse.fromJson(pet))?.toList() ?? [];
}


@JsonSerializable()
class PriceResponse {
  final int amountInCents;
  final String currency;
  final bool from;

  PriceResponse({
    this.amountInCents,
    this.currency,
    this.from,
  });

  factory PriceResponse.fromJson(Map<String, dynamic> json) => _$PriceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PriceResponseToJson(this);

  Price toPrice() => Price(amountInCents: amountInCents, currency: currency, from: from);
}

@JsonSerializable()
class BenefitsResponse {
  static List<BenefitResponse> fromJson(List<dynamic> json) =>
      json?.map((dynamic benefit) => BenefitResponse.fromJson(benefit))?.toList() ?? [];
}

@JsonSerializable()
class BenefitResponse {
  final String benefit;
  final bool included;
  final String detailedInfo;

  BenefitResponse({
    this.benefit,
    this.included,
    this.detailedInfo,
  });

  factory BenefitResponse.fromJson(Map<String, dynamic> json) => _$BenefitResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BenefitResponseToJson(this);

  Benefit toBenefit() => Benefit(
        benefit: benefit,
        included: included,
        detailedInfo: detailedInfo,
      );
}

@JsonSerializable()
class PetCountersResponse {
  static List<PetCounterResponse> fromJson(List<dynamic> json) =>
      json?.map((dynamic healthPlan) => PetCounterResponse.fromJson(healthPlan))?.toList() ?? [];
}

@JsonSerializable()
class PetCounterResponse {
  final int count;
  final PetCounterType type;

  PetCounterResponse({this.count, this.type});

  factory PetCounterResponse.fromJson(Map<String, dynamic> json) => _$PetCounterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PetCounterResponseToJson(this);

  PetCounter toPetCounter() => PetCounter(
        count: count,
        type: type,
      );
}

@JsonSerializable()
class PetInteractionsResponse {
  static List<PetInteractionResponse> fromJson(List<dynamic> json) =>
      json?.map((dynamic interaction) => PetInteractionResponse.fromJson(interaction))?.toList() ?? [];
}

@JsonSerializable()
class PetInteractionResponse {
  final int id;
  final InteractionType type;
  final DateTime createdAt;

  PetInteractionResponse({this.id, this.type, this.createdAt});

  factory PetInteractionResponse.fromJson(Map<String, dynamic> json) => _$PetInteractionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PetInteractionResponseToJson(this);

  Interaction toInteraction() => Interaction(
        id: id,
        type: type,
        createdAt: createdAt,
      );
}
