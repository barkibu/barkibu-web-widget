import 'package:common_barkibu_dart/bloc/insurance/insurance.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks/service_mocks.dart';

void main() {
  MockAnalyticsService mockAnalyticsService;
  InsuranceBloc insuranceBloc;

  setUp(() {
    mockAnalyticsService = MockAnalyticsService();
    insuranceBloc = InsuranceBloc(mockAnalyticsService);
  });

  tearDown(() async {
    await insuranceBloc?.close();
  });

  group('InsuranceBloc', () {
    test('InsuranceViewRequested launches logInsuranceView on analytics', () async {
      insuranceBloc.add(InsuranceViewRequested());
      await insuranceBloc.close();
      verify(mockAnalyticsService.event.insurance.logInsuranceView());
    });

    test('InsuranceQuoteRequested launches logInsuranceQuote on analytics', () async {
      insuranceBloc.add(InsuranceQuoteRequested());
      await insuranceBloc.close();
      verify(mockAnalyticsService.event.insurance.logInsuranceQuote());
    });

    test('InsuranceClaimRequested launches logInsuranceClaim on analytics', () async {
      insuranceBloc.add(InsuranceClaimRequested());
      await insuranceBloc.close();
      verify(mockAnalyticsService.event.insurance.logInsuranceClaim());
    });

    test('InsuranceBarkibuInformationRequested launches logInsuranceBarkibuInformation on analytics', () async {
      insuranceBloc.add(InsuranceBarkibuInformationRequested());
      await insuranceBloc.close();
      verify(mockAnalyticsService.event.insurance.logInsuranceBarkibuInformation());
    });
  });
}
