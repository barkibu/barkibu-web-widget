import 'package:common_barkibu_dart/domain/faq/get_faq_use_case.dart';
import 'package:common_barkibu_dart/messages/faqMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/messages_model.dart';
import 'package:common_barkibu_dart/services/locale_service.dart';
import 'package:get_it/get_it.dart';
import 'package:test/test.dart';

import 'package:mockito/mockito.dart';

class MockMessagesModel extends Mock implements MessagesModel {}

class MockFaqMessages extends Mock implements FaqMessages {}

class MockLocaleService extends Mock implements LocaleService {
  MockMessagesModel mockMessagesModel;

  MockLocaleService(this.mockMessagesModel);

  @override
  MessagesModel messagesModel() {
    return mockMessagesModel;
  }
}

void main() {
  GetFaqUseCase getFaqUseCase;
  final mockMessagesModel = MockMessagesModel();
  final mockFaqMessages = MockFaqMessages();

  final service = GetIt.instance;

  setUp(() {
    service.registerSingleton<LocaleService>(MockLocaleService(mockMessagesModel));
    when(mockMessagesModel.faqMessages).thenAnswer((_) => mockFaqMessages);
    getFaqUseCase = GetFaqUseCaseImpl();
  });

  tearDown(() {
    if (service.isRegistered<LocaleService>()) {
      service.unregister<LocaleService>();
    }
  });
  group('FaqUseCase', () {
    test('faqs are retrieved', () async {
      when(mockFaqMessages.faqs).thenAnswer((_) => Faqs.oneOk);
      final faqList = await getFaqUseCase.getFaq('t');
      expect(faqList.length == 1, true);
    });

    test('faqs order is correct', () async {
      when(mockFaqMessages.faqs).thenAnswer((_) => Faqs.twoUnordered);
      final faqList = await getFaqUseCase.getFaq('t');
      expect(faqList.length == 2, true);
      expect(faqList[0].order == 0, true);
    });

    test('faqs are filtered', () async {
      when(mockFaqMessages.faqs).thenAnswer((_) => Faqs.twoSections);
      final faqList = await getFaqUseCase.getFaq('t');
      expect(faqList.length == 1, true);
      expect(faqList[0].section == 't', true);
    });
  });
}

class Faqs {
  static String oneOk = "{'faqs': [{'id': '0', 'order': 2, 'section': 't', 'question': 'w?', 'answer': 'b'}]}";
  static String twoUnordered =
      "{'faqs': [{'id': '0', 'order': 6, 'section': 't', 'question': 'w?', 'answer': 'b'},{'id': '0', 'order': 0, 'section': 't', 'question': 'w?', 'answer': 'b'}]}";
  static String twoSections =
      "{'faqs': [{'id': '0', 'order': 6, 'section': 't2', 'question': 'w?', 'answer': 'b'},{'id': '0', 'order': 0, 'section': 't', 'question': 'w?', 'answer': 'b'}]}";
}
