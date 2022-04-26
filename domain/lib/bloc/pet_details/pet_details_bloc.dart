import 'package:bloc/bloc.dart';

import 'package:common_barkibu_dart/bloc/pet_details/pet_details_event.dart';
import 'package:common_barkibu_dart/bloc/pet_details/pet_details_state.dart';
import 'package:common_barkibu_dart/domain/pet/get_pet_counters_use_case.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/services/monitoring_service.dart';

class PetDetailsBloc extends Bloc<PetDetailsEvent, PetDetailsState> {
  final GetPetCountersUseCase _getPetCountersUseCase;

  PetDetailsBloc(this._getPetCountersUseCase);

  @override
  PetDetailsState get initialState => PetDetailsInitial();

  @override
  Stream<PetDetailsState> mapEventToState(PetDetailsEvent event) async* {
    if (event is PetDetailsStarted) {
      final petId = event.petId;
      yield PetDetailsLoadInProgress((b) => b..petId = petId);
      try {
        final counters = await _getPetCountersUseCase.getPetCounters(petId);
        yield PetDetailsLoadSuccess((b) => b
          ..petId = petId
          ..counters = counters);
      } catch (e) {
        ServiceLocator.container<MonitoringService>().capture(event: e, severityLevel: SeverityLevel.ERROR);
      }
    }
  }
}
