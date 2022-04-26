import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/bloc/pet_interactions/pet_interactions.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/domain/pet/get_pet_interactions_use_case.dart';

class PetInteractionsBloc extends Bloc<PetInteractionsEvent, PetInteractionsState> {
  final GetPetInteractionsUseCase _getPetInteractionsUseCase;

  PetInteractionsBloc(this._getPetInteractionsUseCase);

  @override
  PetInteractionsState get initialState => PetInteractionsInitial();

  @override
  Stream<PetInteractionsState> mapEventToState(PetInteractionsEvent event) async* {
    if (event is PetInteractionsStarted) {
      final petId = event.petId;
      yield PetInteractionsLoadInProgress((b) => b..petId = petId);
      try {
        final interactions = await _getPetInteractionsUseCase.getPetInteractions(petId);
        yield PetInteractionsLoadSuccess((b) => b
          ..interactions = interactions
          ..petId = petId);
      } catch (e) {
        ServiceLocator.container<MonitoringService>().capture(event: e, severityLevel: SeverityLevel.ERROR);
      }
    }
  }
}
