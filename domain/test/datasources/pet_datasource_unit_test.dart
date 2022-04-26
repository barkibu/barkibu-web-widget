import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/datasources/pet/pet_datasource.dart';
import 'package:common_barkibu_dart/models/aivet.dart';
import 'package:common_barkibu_dart/models/features.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../mocks/api_mocks.dart';
import '../mocks/model_mocks.dart';
import '../mocks/response_mocks.dart';

void main() {
  group('PetDatasource (unit)', () {
    test('returns an anamnesis result when request was successful', () async {
      final mockApi = MockPetApi();
      final mockResponse = MockAnamnesisResponse();
      final dataSource = PetDatasourceImpl(mockApi);

      when(mockApi.getAnamnesis(any, any, any)).thenAnswer((_) async => mockResponse);

      var anamnesis = await dataSource.anamnesis(
          consultationId: 'irrelevant', pet: MockPet(), symptoms: [MockSymptom()], locale: 'irrelevant');

      expect(anamnesis is Anamnesis, true);
    });

    test('returns an file when generate assessment report was successful', () async {
      final mockApi = MockPetApi();
      final mockResponse = MockAssessmentReportFileResponse();
      final dataSource = PetDatasourceImpl(mockApi);

      when(mockApi.getAssessmentPDF(any, any)).thenAnswer((_) async => mockResponse);

      var assessment = await dataSource.getAssessmentPDF(0, 'abc123');

      expect(assessment, isA<AssessmentPDF>());
      expect(assessment.file, mockResponse.bodyBytes);
    });

    test('returns a features object when requested', () async {
      final mockApi = MockPetApi();
      final mockResponse = MockFeatureResponse();
      final dataSource = PetDatasourceImpl(mockApi);

      when(mockApi.getPetFeatures(any)).thenAnswer((_) async => mockResponse);
      var features = await dataSource.getFeatures(0);

      expect(features, isA<Features>());
      expect(features.telehealth, true);
    });
  });
}
