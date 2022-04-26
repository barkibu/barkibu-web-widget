import 'package:common_barkibu_dart/repositories/aivet/aivet_repository.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import '../mocks/datasource_mocks.dart';
import '../mocks/model_mocks.dart';
import '../service_locator.dart' as test_service_locator;

void main() {
  test_service_locator.ServiceLocator.setup();
  group('AiVetRepository (unit)', () {
    final mockAiVetDataSource = MockAiVetDatasource();
    final mockPetDataSource = MockPetDatasource();
    final aivetRepository = AiVetRepositoryImpl(mockAiVetDataSource, mockPetDataSource);

    test('asks the datasource for anamnesis', () async {
      final pet = MockPet();
      final symptoms = [MockSymptom()];

      await aivetRepository.anamnesis('consultationId', pet, symptoms);
      verify(mockPetDataSource.anamnesis(consultationId: 'consultationId', pet: pet, symptoms: symptoms, locale: 'en'))
          .called(1);
    });
  });
}
