import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:common_barkibu_dart/datasources/auth/auth_datasource.dart';
import 'package:common_barkibu_dart/service_locator.dart';

class AuthInterceptor implements RequestInterceptor {
  AuthDatasource get _authDatasource => ServiceLocator.container<AuthDatasource>();

  @override
  FutureOr<Request> onRequest(Request request) async {
    var accessToken = await _authDatasource.getAccessToken();

    if (accessToken != null) {
      return applyHeader(request, 'authorization', 'Bearer $accessToken');
    } else {
      return request;
    }
  }
}
