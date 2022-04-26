import 'package:chopper/chopper.dart';

part 'presigned_url_api.chopper.dart';

abstract class PresignedUrlApi {
  Future<Response> getUrl(String fileExtension);
}

@ChopperApi(baseUrl: 'presigned_url')
abstract class PresignedUrlApiAmazonImpl extends ChopperService implements PresignedUrlApi {
  static PresignedUrlApi create([ChopperClient client]) => _$PresignedUrlApiAmazonImpl(client);

  @Get(path: '/{fileExtension}')
  @override
  Future<Response> getUrl(@Path() String fileExtension);
}
