import 'package:common_barkibu_dart/datasources/api/presigned_url_api.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/presigned_url.dart';
import 'package:common_barkibu_dart/models/presigned_url.dart';

abstract class PresignedUrlDatasource {
  Future<PresignedUrl> getUrl(String fileExtension);
}

class PresignedUrlAmazonDatasourceImpl implements PresignedUrlDatasource {
  final PresignedUrlApi _presignedUrlApi;

  PresignedUrlAmazonDatasourceImpl(this._presignedUrlApi);

  @override
  Future<PresignedUrl> getUrl(String fileExtension) async {
    var response = await _presignedUrlApi.getUrl(fileExtension);

    return response.isSuccessful ? PresignedUrlResponse.fromJson(response.body).toPresignedUrl() : null;
  }
}
