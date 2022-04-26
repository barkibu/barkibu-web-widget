import 'package:common_barkibu_dart/datasources/clinic/clinic_datasource.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/mocks.dart';

void main() {
  group('ClinicRepository', () {
    final mockApi = MockClinicApi();
    final mockResponse = MockClinicsResponse();
    final dataSource = ClinicDatasourceImpl(mockApi);

    test('get clinics by address', () async {
      when(mockApi.getClinicsByAddress("address")).thenAnswer((_) async => mockResponse);

      final response = await dataSource.getClinicsByAddress("address");
      expect(response is List<Clinic>, true);
      expect(response.length, 2);
    });

    test('get clinics by coordinates', () async {
      when(mockApi.getClinicsByCoords("latitude", "longitude")).thenAnswer((_) async => mockResponse);

      final response = await dataSource.getClinicsByCoords("latitude", "longitude");
      expect(response is List<Clinic>, true);
      expect(response.length, 2);
    });
  });
}