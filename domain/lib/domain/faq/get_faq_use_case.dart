import 'dart:convert';

import 'package:common_barkibu_dart/models/faq.dart';
import 'package:common_barkibu_dart/services/locale_service.dart';

import '../../service_locator.dart';

abstract class GetFaqUseCase {
  Future<List<Faq>> getFaq(String filter);
}

class GetFaqUseCaseImpl implements GetFaqUseCase {
  @override
  Future<List<Faq>> getFaq(String filter) async {
    final faqListJsonString = ServiceLocator.container<LocaleService>()
        .messagesModel()
        .faqMessages
        .faqs
        .replaceAll("'", '\"')
        .replaceAll('\n', '\\n');
    final faqObjsJson = jsonDecode(faqListJsonString)['faqs'] as List;
    final faqList = faqObjsJson.map((json) => Faq.fromJson(json)).toList();
    faqList.sort((a, b) => a.order.compareTo(b.order));
    return faqList.where((f) => f.section == filter).toList();
  }
}
