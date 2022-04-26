// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiValidationErrorResponse _$ApiValidationErrorResponseFromJson(
    Map<String, dynamic> json) {
  return ApiValidationErrorResponse(
    json['status'] as String,
    json['title'] as String,
    (json['detail'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
  );
}

Map<String, dynamic> _$ApiValidationErrorResponseToJson(
        ApiValidationErrorResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'title': instance.title,
      'detail': instance.detail,
    };

ApiErrorResponse _$ApiErrorResponseFromJson(Map<String, dynamic> json) {
  return ApiErrorResponse(
    json['error'] as String,
  );
}

Map<String, dynamic> _$ApiErrorResponseToJson(ApiErrorResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
    };
