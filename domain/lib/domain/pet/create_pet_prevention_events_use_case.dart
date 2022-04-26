import 'package:common_barkibu_dart/models/models.dart';
import 'package:common_barkibu_dart/repositories/pet/pet_repository.dart';

class PreventionEventMixedPetIdException implements Exception {}

abstract class CreatePetPreventionEventsUseCase {
  Future<List<PreventionEvent>> createPreventionEvents(List<PreventionEvent> preventionEvents);
}

class CreatePetPreventionEventsUseCaseImpl implements CreatePetPreventionEventsUseCase {
  final PetRepository _petRepository;

  CreatePetPreventionEventsUseCaseImpl(this._petRepository);

  @override
  Future<List<PreventionEvent>> createPreventionEvents(List<PreventionEvent> preventionEvents) {
    final petId = preventionEvents.elementAt(0)?.petId;
    if (!preventionEvents.every((event) => event.petId == petId)) {
      throw PreventionEventMixedPetIdException();
    }
    return _petRepository.createPreventionEvents(petId, preventionEvents);
  }
}
