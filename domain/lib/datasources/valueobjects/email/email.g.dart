// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailRequest _$EmailRequestFromJson(Map<String, dynamic> json) {
  return EmailRequest(
    subject: json['subject'],
    body: json['body'],
  );
}

Map<String, dynamic> _$EmailRequestToJson(EmailRequest instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'body': instance.body,
    };
