import 'package:common_barkibu_dart/bloc/faq/faq.dart';
import 'package:common_barkibu_dart/domain/faq/get_faq_use_case.dart';
import 'package:common_barkibu_dart/models/faq.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks/service_mocks.dart';

class MockGetFaqUseCase extends Mock implements GetFaqUseCase {}

void main() {
  MockAnalyticsService mockAnalyticsService;
  GetFaqUseCase getFaqUseCase;
  FaqBloc faqBloc;

  setUp(() {
    mockAnalyticsService = MockAnalyticsService();
    getFaqUseCase = MockGetFaqUseCase();
    faqBloc = FaqBloc(getFaqUseCase, mockAnalyticsService);
  });

  tearDown(() async {
    await faqBloc?.close();
  });

  group('FaqBloc', () {
    test('FaqViewRequested retrieved faq list success', () async {
      when(getFaqUseCase.getFaq(any)).thenAnswer((_) => Future.value([Faq()]));
      faqBloc.add(FaqViewRequested((b) => b.filter = ''));
      await faqBloc.close();
      verify(getFaqUseCase.getFaq(''));
      await expectLater(
          faqBloc,
          emitsInOrder([
            isA<FaqLoadSuccess>(),
          ]));
    });

    test('FaqContentExpanded launches logFaqExpanded on analytics', () async {
      faqBloc.add(FaqContentExpanded((b) {
        b.planName = 'Plan Name';
        b.faqId = 'Faq id';
      }));
      await faqBloc.close();
      verify(mockAnalyticsService.event.faq.logFaqExpanded('Plan Name', 'Faq id'));
    });
  });
}
