import 'package:common_barkibu_dart/datasources/pet/pet_datasource.dart';
import 'package:common_barkibu_dart/models/features.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:common_barkibu_dart/models/pet.dart';
import 'package:common_barkibu_dart/models/consultation_options.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/services/locale_service.dart';

enum AssessmentFilter {
  askAVet,
  completed,
}

extension on AssessmentFilter {
  // ignore: missing_return
  String toQueryString() {
    switch (this) {
      case AssessmentFilter.askAVet:
        return 'ask_a_vet';
      case AssessmentFilter.completed:
        return 'completed';
    }
  }
}

abstract class PetRepository {
  Future<Pet> create(Pet pet);

  Future<bool> update(Pet pet);

  Future<List<Pet>> getPets();

  Future<Pet> getPet(int id);

  Future<Features> getFeatures(int id);

  Future<bool> delete(int id);

  Future<List<SymptomFound>> findSymptoms(int petId, String query);

  Future<List<Assessment>> getAssessments(int petId, {AssessmentFilter filter});

  Future<AssessmentPDF> getAssessmentPDF(int petId, String consultationId);

  Future<List<PetCounter>> getCounters(int petId);

  Future<List<Interaction>> getInteractions(int petId);

  Future<List<PreventionEvent>> createPreventionEvents(int petId, List<PreventionEvent> preventionEvents);
}

class PetRepositoryImpl implements PetRepository {
  final PetDatasource _petDatasource;

  PetRepositoryImpl(this._petDatasource);

  @override
  Future<Pet> create(Pet pet) => _petDatasource.create(pet);

  @override
  Future<bool> update(Pet pet) => _petDatasource.update(pet);

  @override
  Future<List<Pet>> getPets() => _petDatasource.getPets();

  @override
  Future<Pet> getPet(int id) => _petDatasource.getPet(id);

  @override
  Future<bool> delete(int id) => _petDatasource.delete(id);

  @override
  Future<List<SymptomFound>> findSymptoms(int petId, String query) {
    return _petDatasource.findSymptoms(
        petId: petId, query: query, locale: ServiceLocator.container<LocaleService>().currentLocale);
  }

  @override
  Future<List<Assessment>> getAssessments(int petId, {AssessmentFilter filter}) {
    return _petDatasource.getAssessments(petId, filter?.toQueryString());
  }

  @override
  Future<AssessmentPDF> getAssessmentPDF(int petId, String consultationId) {
    return _petDatasource.getAssessmentPDF(petId, consultationId);
  }

  @override
  Future<Features> getFeatures(int petId) {
    return _petDatasource.getFeatures(petId);
  }

  @override
  Future<List<PetCounter>> getCounters(int petId) {
    return _petDatasource.getCounters(petId);
  }

  @override
  Future<List<Interaction>> getInteractions(int petId) {
    return _petDatasource.getInteractions(petId);
  }

  @override
  Future<List<PreventionEvent>> createPreventionEvents(int petId, List<PreventionEvent> preventionEvents) {
    return _petDatasource.createPreventionEvents(petId, preventionEvents);
  }
}
