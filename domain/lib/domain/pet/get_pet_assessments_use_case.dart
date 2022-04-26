import 'package:common_barkibu_dart/models/models.dart';
import 'package:common_barkibu_dart/repositories/pet/pet_repository.dart';

abstract class GetPetAssessmentsUseCase {
  Future<List<Assessment>> getPetAivetAssessments(int id);
  Future<List<Assessment>> getPetAskAVetAssessments(int id);
}

class GetPetAssessmentsUseCaseImpl implements GetPetAssessmentsUseCase {
  final PetRepository _petRepository;

  GetPetAssessmentsUseCaseImpl(this._petRepository);

  @override
  Future<List<Assessment>> getPetAivetAssessments(int id) async =>
      await _petRepository.getAssessments(id, filter: AssessmentFilter.completed);

  @override
  Future<List<Assessment>> getPetAskAVetAssessments(int id) async =>
      await _petRepository.getAssessments(id, filter: AssessmentFilter.askAVet);
}
