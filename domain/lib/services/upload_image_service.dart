import 'package:common_barkibu_dart/datasources/presigned_url/presigned_url_datasource.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

abstract class UploadImageService {
  Future<String> upload(dynamic image);
}

class UploadImageServiceImpl extends UploadImageService {
  final PresignedUrlDatasource _presignedUrlDatasource;

  UploadImageServiceImpl(this._presignedUrlDatasource);

  @override
  Future<String> upload(dynamic image) async {
    try {
      final format = image.uri.path.split('.').last;
      final presignedUrl = await _presignedUrlDatasource.getUrl(format);

      final length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      final multipartFile = http.MultipartFile('file', stream, length, filename: path.basename(image.path));

      final uri = Uri.parse(presignedUrl.url);
      var req = http.MultipartRequest('POST', uri);

      req.fields['key'] = presignedUrl.fields.key;
      req.fields['acl'] = presignedUrl.fields.acl;
      req.fields['Policy'] = presignedUrl.fields.policy;
      req.fields['X-Amz-Credential'] = presignedUrl.fields.credential;
      req.fields['X-Amz-Algorithm'] = presignedUrl.fields.algorithm;
      req.fields['X-Amz-Date'] = presignedUrl.fields.date;
      req.fields['X-Amz-Signature'] = presignedUrl.fields.signature;
      req.fields['success_action_status'] = presignedUrl.fields.successActionStatus;
      req.files.add(multipartFile);

      await req.send();

      return '${presignedUrl.url}/${presignedUrl.fields.key}';
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
