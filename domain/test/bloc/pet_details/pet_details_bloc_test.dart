import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/domain/pet/get_pet_counters_use_case.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks/mocks.dart';
import '../../service_locator.dart' as test_service_locator;

void main() {
  test_service_locator.ServiceLocator.setup();
  MockPetDatasource mockPetDatasource;
  GetPetCountersUseCase getPetCountersUseCase;
  PetDetailsBloc petDetailsBloc;

  setUp(() {
    mockPetDatasource = MockPetDatasource();
    getPetCountersUseCase = GetPetCountersUseCaseImpl(PetRepositoryImpl(mockPetDatasource));
    petDetailsBloc = PetDetailsBloc(getPetCountersUseCase);
  });

  tearDown(() {
    petDetailsBloc?.close();
  });

  group('PetDetailsBloc', () {
    final petId = 123;

    group('Adding PetDetailsStarted', () {
      final startedEvent = PetDetailsStarted(petId);
      final counters = [
        PetCounter(count: 4, type: PetCounterType.ASSESSMENT),
        PetCounter(count: 2, type: PetCounterType.VET_CONSULTATION),
      ];

      setUp(() {
        when(mockPetDatasource.getCounters(petId)).thenAnswer((_) async => counters);
      });

      test('fetches and emits a state with the Pet Counters', () async {
        petDetailsBloc.add(startedEvent);

        await expectLater(
            petDetailsBloc,
            emitsInOrder(
              [
                isA<PetDetailsInitial>(),
                allOf(isA<PetDetailsLoadInProgress>(), predicate((state) => state.petId == petId)),
                allOf(isA<PetDetailsLoadSuccess>(), predicate((state) => state.counters == counters)),
              ],
            ));
        verify(mockPetDatasource.getCounters(petId));
      });
    });
  });
}
