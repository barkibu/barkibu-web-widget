import 'dart:typed_data';
import 'package:common_barkibu_dart/datasources/valueobjects/prevention_event/prevention_event.dart';
import 'package:meta/meta.dart';

import 'package:common_barkibu_dart/datasources/api/pet_api.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/aivet/anamnesis.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/aivet/assessment.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/features/features.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/pet/pet.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/search/search_symptoms.dart';
import 'package:common_barkibu_dart/models/models.dart';

class PetDatasourceError extends Error {
  final dynamic error;

  PetDatasourceError(this.error);
}

abstract class PetDatasource {
  Future<Pet> create(Pet pet);

  Future<bool> update(Pet pet);

  Future<bool> updateFoodPreferences(Pet pet, FoodPreferences foodPreferences);

  Future<List<Pet>> getPets();

  Future<Pet> getPet(int id);

  Future<Features> getFeatures(int id);

  Future<bool> delete(int id);

  Future<Anamnesis> anamnesis({String consultationId, Pet pet, List<Symptom> symptoms, String locale});

  Future<List<SymptomFound>> findSymptoms({int petId, String query, String locale});

  Future<List<Assessment>> getAssessments(int petId, String filter);

  Future<AssessmentPDF> getAssessmentPDF(int petId, String consultationId);

  Future<List<PetCounter>> getCounters(int petId);

  Future<List<Interaction>> getInteractions(int petId);

  Future<List<PreventionEvent>> createPreventionEvents(int petId, List<PreventionEvent> preventionEvents);
}

class PetDatasourceImpl implements PetDatasource {
  final PetApi _petApi;

  PetDatasourceImpl(this._petApi);

  @override
  Future<Pet> create(Pet pet) async {
    var response = await _petApi.createPet(PetRequest(
      birthdate: pet.birthdate,
      gender: pet.sex,
      breed: pet.breed,
      breedUuid: pet.breedUuid,
      mixedBreed: pet.mixedBreed,
      name: pet.name,
      neutered: pet.neutered,
      size: pet.size,
      species: pet.species,
      avatarUrl: pet.avatarUrl,
    ));

    return response.isSuccessful ? PetResponse.fromJson(response.body).toPet() : null;
  }

  @override
  Future<bool> update(Pet pet) async {
    var response = await _petApi.updatePet(
        pet.id,
        PetRequest(
          birthdate: pet.birthdate,
          gender: pet.sex,
          breed: pet.breed,
          breedUuid: pet.breedUuid,
          mixedBreed: pet.mixedBreed,
          name: pet.name,
          neutered: pet.neutered,
          size: pet.size,
          species: pet.species,
          avatarUrl: pet.avatarUrl,
          chipNumber: pet.chipNumber,
        ));

    return response.isSuccessful;
  }

  @override
  Future<bool> updateFoodPreferences(Pet pet, FoodPreferences foodPreferences) async {
    var response = await _petApi.updatePetWithFoodPreferences(
        pet.id,
        PetWithFoodPreferencesRequest(
          birthdate: pet.birthdate,
          gender: pet.sex,
          breed: pet.breed,
          mixedBreed: pet.mixedBreed,
          name: pet.name,
          neutered: pet.neutered,
          size: pet.size,
          species: pet.species,
          foodPreferences: FoodPreferencesRequest(
            needsWeightManagementFood: foodPreferences.needsWeightManagementFood,
            isOutdoor: foodPreferences.isOutdoor,
            hasHipJointIssues: foodPreferences.hasHipJointIssues,
            hasDullCoatOrDrySkin: foodPreferences.hasDullCoatOrDrySkin,
            preferedFoodType: foodPreferences.preferedFoodType,
            foodSensitivities: foodPreferences.foodSensitivities,
          ),
        ));

    return response.isSuccessful;
  }

  @override
  Future<List<Pet>> getPets() async {
    var response = await _petApi.getPets();

    return response.isSuccessful
        ? PetsResponse.fromJson(response.body).map((PetResponse pet) => pet.toPet()).toList()
        : [];
  }

  @override
  Future<Pet> getPet(int id) async {
    var response = await _petApi.getPet(id);

    return response.isSuccessful ? PetResponse.fromJson(response.body).toPet() : null;
  }

  @override
  Future<Features> getFeatures(int id) async {
    var response = await _petApi.getPetFeatures(id);
    return response.isSuccessful ? FeaturesResponse.fromJson(response.body).toFeatures() : null;
  }

  @override
  Future<bool> delete(int id) async {
    var response = await _petApi.deletePet(id);

    return response.isSuccessful;
  }

  @override
  Future<Anamnesis> anamnesis({
    @required String consultationId,
    @required Pet pet,
    @required List<Symptom> symptoms,
    @required String locale,
  }) async {
    var response = await _petApi.getAnamnesis(
      pet.id,
      AnamnesisRequest(
          consultationId,
          symptoms
              .map((symptom) =>
                  SymptomRequest(symptom.key, symptom.presence, symptom.duration?.key, symptom.frequency?.key))
              .toList()),
      locale,
    );

    return response.isSuccessful ? AnamnesisResponse.fromJson(response.body).toAnamnesis() : null;
  }

  @override
  Future<List<SymptomFound>> findSymptoms({
    @required int petId,
    @required String query,
    @required String locale,
  }) async {
    var response = await _petApi.findSymptoms(petId, query, locale);

    if (response.isSuccessful) {
      return SearchSymptomsResponse.fromJson(response.body)
          .map((SearchSymptomResponse symptom) => symptom.toSymptomFound())
          .toList();
    }
    return [];
  }

  @override
  Future<List<Assessment>> getAssessments(int petId, String filter) async {
    var response = await _petApi.getAssessments(petId, filter);

    if (response.isSuccessful) {
      return response.body
          .map<Assessment>((assessment) => AssessmentResponse.fromJson(assessment).toAssessment())
          .toList();
    }
    throw PetDatasourceError(response.error);
  }

  @override
  Future<AssessmentPDF> getAssessmentPDF(int petId, String consultationId) async {
    final response = await _petApi.getAssessmentPDF(petId, consultationId);

    return AssessmentPDF(response.isSuccessful ? response.bodyBytes : Uint8List(0));
  }

  @override
  Future<List<PetCounter>> getCounters(int petId) async {
    final response = await _petApi.getCounters(petId);

    if (response.isSuccessful) {
      return PetCountersResponse.fromJson(response.body)
          .map((PetCounterResponse counter) => counter.toPetCounter())
          .toList();
    }
    throw PetDatasourceError(response.error);
  }

  @override
  Future<List<Interaction>> getInteractions(int petId) async {
    final response = await _petApi.getInteractions(petId);

    if (response.isSuccessful) {
      return PetInteractionsResponse.fromJson(response.body['interactions'])
          .map((PetInteractionResponse interaction) => interaction.toInteraction())
          .toList();
    }
    throw PetDatasourceError(response.error);
  }

  @override
  Future<List<PreventionEvent>> createPreventionEvents(int petId, List<PreventionEvent> preventionEvents) async {
    final response = await _petApi.batchCreatePreventionEvents(
        petId,
        PreventionEventBatchRequest(
            preventionEvents.map((event) => PreventionEventRequest.fromJson(event.toJson())).toList()));

    if (response.isSuccessful) {
      return PreventionEventsResponse.fromJson(response.body['preventionEvents'])
          .map((PreventionEventResponse event) => event.toPreventionEvent())
          .toList();
    }
    throw PetDatasourceError(response.error);
  }
}
