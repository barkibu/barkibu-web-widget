import 'package:json_annotation/json_annotation.dart';

part 'faq.g.dart';

@JsonSerializable()
class Faq {
  String id;
  int order;
  String question;
  String answer;
  String section;

  Faq({
    this.id,
    this.order,
    this.question,
    this.answer,
    this.section,
  });

  Map<String, dynamic> toJson() => _$FaqToJson(this);

  factory Faq.fromJson(Map<String, dynamic> json) => _$FaqFromJson(json);
}
