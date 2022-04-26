import 'package:common_barkibu_dart/datasources/pet/pet_datasource.dart';
import 'package:common_barkibu_dart/models/aivet.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/api_mocks.dart';
import '../../../mocks/model_mocks.dart';
import '../../../mocks/response_mocks.dart';

void main() {
  group('PetDatasource (unit)', () {
    test('returns an anamnesis result when request was successful', () async {
      final mockApi = MockPetApi();
      final mockResponse = MockAnamnesisResponse();
      final dataSource = PetDatasourceImpl(mockApi);

      when(mockApi.getAnamnesis(any, any, any)).thenAnswer((_) async => mockResponse);

      var anamnesis = await dataSource.anamnesis(
          pet: MockPet(), symptoms: [MockSymptom()], locale: 'irrelevant', consultationId: null);

      expect(anamnesis is Anamnesis, true);
    });

    group('findSymptoms()', () {
      test('returns SypmtpomFound results when request was successful', () async {
        final mockApi = MockPetApi();
        final mockResponse = MockSymptomsFoundResponse();
        final dataSource = PetDatasourceImpl(mockApi);
        final petId = 1;
        final query = 'cough';
        final locale = 'en';

        when(mockApi.findSymptoms(petId, query, locale)).thenAnswer((_) async => mockResponse);

        var symptomsFound = await dataSource.findSymptoms(petId: petId, query: query, locale: locale);

        expect(symptomsFound is List<SymptomFound>, true);
        expect(symptomsFound.length, mockResponse.body.length);
      });
    });

    group('assessments()', () {
      test('returns Assessments results when request was successful', () async {
        final mockApi = MockPetApi();
        final mockResponse = MockAssessmentsResponse();
        final dataSource = PetDatasourceImpl(mockApi);
        final filter = 'filter';
        final petId = 1;

        when(mockApi.getAssessments(petId, filter)).thenAnswer((_) async => mockResponse);

        var assessments = await dataSource.getAssessments(petId, filter);

        expect(assessments, isA<List<Assessment>>());
        expect(assessments.length, mockResponse.body.length);
      });
    });
  });
}
