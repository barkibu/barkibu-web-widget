import 'package:common_barkibu_dart/datasources/api/token_api.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/token/token.dart';

class TokenDatasourceError extends Error {
  final dynamic error;

  TokenDatasourceError(this.error);
}

abstract class TokenDatasource {
  Future<String> create();
}

class TokenDatasourceImpl implements TokenDatasource {
  final TokenApi _tokenApi;

  TokenDatasourceImpl(this._tokenApi);

  @override
  Future<String> create() async {
    var response = await _tokenApi.createToken();

    return response.isSuccessful ? TokenResponse.fromJson(response.body).token : null;
  }
}
