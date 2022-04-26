import 'package:json_annotation/json_annotation.dart';
part 'email.g.dart';

@JsonSerializable()
class EmailRequest {
  final subject;
  final body;

  EmailRequest({this.subject, this.body});

  factory EmailRequest.fromJson(Map<String, dynamic> json) => _$EmailRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EmailRequestToJson(this);
}
