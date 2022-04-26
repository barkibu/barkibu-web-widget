import 'package:common_barkibu_dart/models/presigned_url.dart';
import 'package:json_annotation/json_annotation.dart';

part 'presigned_url.g.dart';

@JsonSerializable()
class PresignedUrlResponse {
  final String url;
  final UrlFieldsResponse fields;

  const PresignedUrlResponse({
    this.url,
    this.fields,
  });

  factory PresignedUrlResponse.fromJson(Map<String, dynamic> json) => _$PresignedUrlResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PresignedUrlResponseToJson(this);

  PresignedUrl toPresignedUrl() => PresignedUrl(
        url: url,
        fields: fields.toUrlFields(),
      );
}

@JsonSerializable()
class UrlFieldsResponse {
  final String key;
  final String acl;
  final String successActionStatus;
  final String policy;
  final String xAmzCredential;
  final String xAmzAlgorithm;
  final String xAmzDate;
  final String xAmzSignature;

  const UrlFieldsResponse({
    this.key,
    this.acl,
    this.successActionStatus,
    this.policy,
    this.xAmzCredential,
    this.xAmzAlgorithm,
    this.xAmzDate,
    this.xAmzSignature,
  });

  factory UrlFieldsResponse.fromJson(Map<String, dynamic> json) => _$UrlFieldsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UrlFieldsResponseToJson(this);

  UrlFields toUrlFields() => UrlFields(
        key: key,
        acl: acl,
        successActionStatus: successActionStatus,
        policy: policy,
        credential: xAmzCredential,
        algorithm: xAmzAlgorithm,
        date: xAmzDate,
        signature: xAmzSignature,
      );
}
