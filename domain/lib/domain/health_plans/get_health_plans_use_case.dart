import 'package:common_barkibu_dart/models/health_plan.dart';
import 'package:common_barkibu_dart/repositories/pet/pet_repository.dart';

abstract class GetHealthPlansUseCase {
  Future<List<HealthPlan>> getHealthPlans(int petId);
}

class GetHealthPlansUseCaseImpl implements GetHealthPlansUseCase {
  final PetRepository _petRepository;

  GetHealthPlansUseCaseImpl(this._petRepository);

  @override
  Future<List<HealthPlan>> getHealthPlans(int petId) async => await _petRepository.getHealthPlans(petId);
}
