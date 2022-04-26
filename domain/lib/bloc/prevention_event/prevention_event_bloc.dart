import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/bloc/prevention_event/prevention_event_event.dart';
import 'package:common_barkibu_dart/bloc/prevention_event/prevention_event_state.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/domain/pet/create_pet_prevention_events_use_case.dart';

class PreventionEventBloc extends Bloc<PreventionEventEvent, PreventionEventState> {
  final CreatePetPreventionEventsUseCase createPetPreventionEventsUseCase;

  PreventionEventBloc(this.createPetPreventionEventsUseCase);

  @override
  PreventionEventState get initialState => PreventionEventInitial();

  @override
  Stream<PreventionEventState> mapEventToState(PreventionEventEvent event) async* {
    if (event is PreventionEventEventsAdded) {
      try {
        final events = await createPetPreventionEventsUseCase.createPreventionEvents(event.preventionEvents);
        yield PreventionEventAddSuccess((b) => b..events = events);
      } catch (e) {
        ServiceLocator.container.get<MonitoringService>().capture(event: e, severityLevel: SeverityLevel.ERROR);
        yield PreventionEventAddFailure();
      }
    }
  }
}
