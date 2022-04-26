import 'package:chopper/chopper.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/aivet/anamnesis.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/pet/pet.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/prevention_event/prevention_event.dart';

part 'pet_api.chopper.dart';

abstract class PetApi {
  Future<Response> createPet(PetRequest pet);

  Future<Response> updatePet(int id, PetRequest pet);

  Future<Response> updatePetWithFoodPreferences(int id, PetWithFoodPreferencesRequest pet);

  Future<Response> getPets();

  Future<Response> getPet(int id);

  Future<Response> getPetFeatures(int id);

  Future<Response> deletePet(int id);

  Future<Response> getAnamnesis(int petId, AnamnesisRequest anamnesisRequest, String locale);

  Future<Response> findSymptoms(int petId, String query, String locale);

  Future<Response> getAssessments(int petId, String filter);

  Future<Response> getAssessmentPDF(int petId, String consultationId);

  Future<Response> getHealthPlans(int petId);

  Future<Response> getCounters(int petId);

  Future<Response> getInteractions(int petId);

  Future<Response> batchCreatePreventionEvents(int petId, PreventionEventBatchRequest events);
}

@ChopperApi(baseUrl: 'pets')
abstract class PetApiImpl extends ChopperService implements PetApi {
  static PetApi create([ChopperClient client]) => _$PetApiImpl(client);

  @Post()
  @override
  Future<Response> createPet(@Body() PetRequest pet);

  @Put(path: '/{id}')
  @override
  Future<Response> updatePet(@Path() int id, @Body() PetRequest pet);

  @Put(path: '/{id}')
  @override
  Future<Response> updatePetWithFoodPreferences(@Path() int id, @Body() PetWithFoodPreferencesRequest pet);

  @Get()
  @override
  Future<Response> getPets();

  @Get(path: '/{id}')
  @override
  Future<Response> getPet(@Path() int id);

  @Get(path: '/{id}/feature_flags')
  @override
  Future<Response> getPetFeatures(@Path() int id);

  @Delete(path: '/{id}')
  @override
  Future<Response> deletePet(@Path() int id);

  @Post(path: '/{petId}/anamnesis')
  @override
  Future<Response> getAnamnesis(@Path() int petId, @Body() AnamnesisRequest anamnesisRequest, @Query() String locale);

  @Get(path: '/{petId}/search/symptoms')
  @override
  Future<Response> findSymptoms(@Path() int petId, @Query() String query, @Query() String locale);

  @Get(path: '/{petId}/assessments')
  @override
  Future<Response> getAssessments(@Path() int petId, @Query() String filter);

  @Get(path: '/{petId}/reports/{consultationId}')
  @override
  Future<Response> getAssessmentPDF(@Path() int petId, @Path() String consultationId);

  @Get(path: '/{petId}/available_plans')
  @override
  Future<Response> getHealthPlans(@Path() int petId);

  @Get(path: '/{petId}/counters')
  @override
  Future<Response> getCounters(@Path() int petId);

  @Get(path: '/{petId}/interactions')
  @override
  Future<Response> getInteractions(@Path() int petId);

  @Post(path: '/{petId}/prevention_events/batch')
  @override
  Future<Response> batchCreatePreventionEvents(@Path() int petId, @Body() PreventionEventBatchRequest events);
}
