import 'package:common_barkibu_dart/bloc/prevention_event/prevention_event_bloc.dart';
import 'package:common_barkibu_dart/bloc/prevention_event/prevention_event_event.dart';
import 'package:common_barkibu_dart/bloc/prevention_event/prevention_event_state.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/domain/pet/create_pet_prevention_events_use_case.dart';
import 'package:common_barkibu_dart/models/pet.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import '../../service_locator.dart' as test_service_locator;

import '../../mocks/mocks.dart';

void main() {
  test_service_locator.ServiceLocator.setup();
  PreventionEventBloc preventionEventBloc;
  CreatePetPreventionEventsUseCase mockCreatePetPreventionEventsUseCase;
  Pet mockPet;
  List<PreventionEvent> events;

  setUp(() {
    if (!test_service_locator.services.isRegistered<MonitoringService>()) {
      test_service_locator.services.registerSingleton<MonitoringService>(MockMonitoringService());
    }
    mockCreatePetPreventionEventsUseCase = MockCreatePetPreventionEventsUseCase();
    mockPet = MockPet();
    events = [
      PreventionEvent(
        petId: mockPet.id,
        eventType: PreventionEventType.DE_WORMING,
        date: '2020/05/09',
        accurate: true,
      )
    ];
    preventionEventBloc = PreventionEventBloc(mockCreatePetPreventionEventsUseCase);
  });

  group('PreventionEventBloc', () {
    test('initial state is correct', () {
      expect(preventionEventBloc.initialState, isA<PreventionEventInitial>());
    });

    group('PreventionEventEventsAdded', () {
      setUp(() {
        when(mockCreatePetPreventionEventsUseCase.createPreventionEvents(any)).thenAnswer((_) async => events);
      });

      test('bloc emits a PreventionEventAddSuccess', () {
        preventionEventBloc.add(PreventionEventEventsAdded(events));
        expectLater(
          preventionEventBloc,
          emitsThrough(isA<PreventionEventAddSuccess>()),
        );
      });

      test('calls use case', () async {
        preventionEventBloc.add(PreventionEventEventsAdded(events));
        await preventionEventBloc.close();
        verify(mockCreatePetPreventionEventsUseCase.createPreventionEvents(events));
      });

      test('logs error when use case fails', () async {
        when(mockCreatePetPreventionEventsUseCase.createPreventionEvents(any))
            .thenThrow(PreventionEventMixedPetIdException());

        preventionEventBloc.add(PreventionEventEventsAdded(events));
        await expectLater(
          preventionEventBloc,
          emitsThrough(isA<PreventionEventAddFailure>()),
        );
        verify(test_service_locator.services
            .get<MonitoringService>()
            .capture(event: anyNamed('event'), severityLevel: SeverityLevel.ERROR));
      });
    });
  });
}
