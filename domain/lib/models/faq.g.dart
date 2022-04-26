// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Faq _$FaqFromJson(Map<String, dynamic> json) {
  return Faq(
    id: json['id'] as String,
    order: json['order'] as int,
    question: json['question'] as String,
    answer: json['answer'] as String,
    section: json['section'] as String,
  );
}

Map<String, dynamic> _$FaqToJson(Faq instance) => <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'question': instance.question,
      'answer': instance.answer,
      'section': instance.section,
    };
