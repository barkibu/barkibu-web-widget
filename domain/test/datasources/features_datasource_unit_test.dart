import 'package:common_barkibu_dart/datasources/feature_flags/feature_flags_datasource.dart';
import 'package:common_barkibu_dart/models/features.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../mocks/api_mocks.dart';
import '../mocks/mocks.dart';

void main() {
  group('FeatureFlagsDatasource (unit)', () {
    test('returns a features object when requested', () async {
      final mockApi = MockFeatureFlagsApi();
      final mockResponse = MockFeatureResponse();
      final mockDatasource = FeatureFlagsDatasourceImpl(mockApi);

      when(mockApi.getFeatureFlagsUser()).thenAnswer((_) async => mockResponse);
      var features = await mockDatasource.getFeatureFlagsUser();

      expect(features is Features, true);
      expect(features.telehealth, true);
    });
  });
}
