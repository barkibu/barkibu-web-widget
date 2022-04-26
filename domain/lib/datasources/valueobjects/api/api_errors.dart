import 'package:built_value/built_value.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_errors.g.dart';

@JsonSerializable()
class ApiValidationErrorResponse {
  @nullable
  final String status;
  final String title;
  final Map<String, List<String>> detail;

  ApiValidationErrorResponse(
    this.status,
    this.title,
    this.detail,
  );

  factory ApiValidationErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiValidationErrorResponseFromJson(_extractErrors(json));

  static Map<String, dynamic> _extractErrors(Map<String, dynamic> json) {
    if (json.containsKey('errors') && json['errors'] is Iterable && json['errors'].length > 0) {
      return json['errors'][0];
    }
    return {'detail': json};
  }

  Map<String, List<String>> toErrorMap() => detail;
}

@JsonSerializable()
class ApiErrorResponse {
  final String error;

  ApiErrorResponse(this.error);

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) => _$ApiErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorResponseToJson(this);
}
