import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';

/// Inject the locale defined as current to every backend requests
class LocaleInterceptor implements RequestInterceptor {
  LocaleInterceptor();

  @override
  FutureOr<Request> onRequest(Request request) async {
    if (!request.parameters.containsKey('locale')) {
      final locale = ServiceLocator.container<LocaleService>().currentLocale;
      final parametersReplacement = Map.from(request.parameters).cast<String, dynamic>();
      parametersReplacement.addAll({'locale': locale});
      return request.copyWith(parameters: parametersReplacement);
    }

    return request;
  }
}
