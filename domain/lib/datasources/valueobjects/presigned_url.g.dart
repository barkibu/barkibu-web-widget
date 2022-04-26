// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presigned_url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PresignedUrlResponse _$PresignedUrlResponseFromJson(Map<String, dynamic> json) {
  return PresignedUrlResponse(
    url: json['url'] as String,
    fields: json['fields'] == null
        ? null
        : UrlFieldsResponse.fromJson(json['fields'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PresignedUrlResponseToJson(
        PresignedUrlResponse instance) =>
    <String, dynamic>{
      'url': instance.url,
      'fields': instance.fields,
    };

UrlFieldsResponse _$UrlFieldsResponseFromJson(Map<String, dynamic> json) {
  return UrlFieldsResponse(
    key: json['key'] as String,
    acl: json['acl'] as String,
    successActionStatus: json['successActionStatus'] as String,
    policy: json['policy'] as String,
    xAmzCredential: json['xAmzCredential'] as String,
    xAmzAlgorithm: json['xAmzAlgorithm'] as String,
    xAmzDate: json['xAmzDate'] as String,
    xAmzSignature: json['xAmzSignature'] as String,
  );
}

Map<String, dynamic> _$UrlFieldsResponseToJson(UrlFieldsResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'acl': instance.acl,
      'successActionStatus': instance.successActionStatus,
      'policy': instance.policy,
      'xAmzCredential': instance.xAmzCredential,
      'xAmzAlgorithm': instance.xAmzAlgorithm,
      'xAmzDate': instance.xAmzDate,
      'xAmzSignature': instance.xAmzSignature,
    };
