// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$PetApiImpl extends PetApiImpl {
  _$PetApiImpl([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PetApiImpl;

  @override
  Future<Response<dynamic>> createPet(PetRequest pet) {
    final $url = 'pets';
    final $body = pet;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updatePet(int id, PetRequest pet) {
    final $url = 'pets/$id';
    final $body = pet;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updatePetWithFoodPreferences(
      int id, PetWithFoodPreferencesRequest pet) {
    final $url = 'pets/$id';
    final $body = pet;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getPets() {
    final $url = 'pets';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getPet(int id) {
    final $url = 'pets/$id';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getPetFeatures(int id) {
    final $url = 'pets/$id/feature_flags';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deletePet(int id) {
    final $url = 'pets/$id';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAnamnesis(
      int petId, AnamnesisRequest anamnesisRequest, String locale) {
    final $url = 'pets/$petId/anamnesis';
    final $params = <String, dynamic>{'locale': locale};
    final $body = anamnesisRequest;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> findSymptoms(
      int petId, String query, String locale) {
    final $url = 'pets/$petId/search/symptoms';
    final $params = <String, dynamic>{'query': query, 'locale': locale};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAssessments(int petId, String filter) {
    final $url = 'pets/$petId/assessments';
    final $params = <String, dynamic>{'filter': filter};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAssessmentPDF(int petId, String consultationId) {
    final $url = 'pets/$petId/reports/$consultationId';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getHealthPlans(int petId) {
    final $url = 'pets/$petId/available_plans';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getCounters(int petId) {
    final $url = 'pets/$petId/counters';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getInteractions(int petId) {
    final $url = 'pets/$petId/interactions';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> batchCreatePreventionEvents(
      int petId, PreventionEventBatchRequest events) {
    final $url = 'pets/$petId/prevention_events/batch';
    final $body = events;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
