import 'package:common_barkibu_dart/datasources/token/token_datasource.dart';

abstract class TokenRepository {
  Future<String> create();
}

class TokenRepositoryImpl implements TokenRepository {
  final TokenDatasource _tokenDatasource;

  TokenRepositoryImpl(this._tokenDatasource);

  @override
  Future<String> create() => _tokenDatasource.create();
}
