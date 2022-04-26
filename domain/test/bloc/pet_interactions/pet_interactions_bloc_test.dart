import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/domain/pet/get_pet_interactions_use_case.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks/mocks.dart';
import '../../service_locator.dart' as test_service_locator;

void main() {
  test_service_locator.ServiceLocator.setup();
  MockPetDatasource mockPetDatasource;
  GetPetInteractionsUseCase getPetInteractionsUseCase;
  PetInteractionsBloc petInteractionsBloc;

  setUp(() {
    mockPetDatasource = MockPetDatasource();
    getPetInteractionsUseCase = GetPetInteractionsUseCaseImpl(PetRepositoryImpl(mockPetDatasource));
    petInteractionsBloc = PetInteractionsBloc(getPetInteractionsUseCase);
  });

  tearDown(() {
    petInteractionsBloc?.close();
  });

  group('PetInteractionsBloc', () {
    final petId = 123;

    group('Adding PetInteractionsStarted', () {
      final startedEvent = PetInteractionsStarted(petId);
      final interactions = [
        Interaction(id: 1, type: InteractionType.CHAT_INTERACTION, createdAt: DateTime.now()),
        Interaction(id: 2, type: InteractionType.VOICE_INTERACTION, createdAt: DateTime.now()),
      ];

      setUp(() {
        when(mockPetDatasource.getInteractions(petId)).thenAnswer((_) async => interactions);
      });

      test('fetches and emit a state with the Pet Interactions', () async {
        petInteractionsBloc.add(startedEvent);

        await expectLater(
            petInteractionsBloc,
            emitsInOrder(
              [
                isA<PetInteractionsInitial>(),
                allOf(isA<PetInteractionsLoadInProgress>(), predicate((state) => state.petId == petId)),
                allOf(isA<PetInteractionsLoadSuccess>(), predicate((state) => state.interactions == interactions)),
              ],
            ));
        verify(mockPetDatasource.getInteractions(petId));
      });
    });
  });
}
