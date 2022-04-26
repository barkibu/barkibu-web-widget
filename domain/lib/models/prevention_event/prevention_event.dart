import 'package:json_annotation/json_annotation.dart';

part 'prevention_event.g.dart';

enum PreventionEventType {
  @JsonValue('rabies')
  RABIES,
  @JsonValue('de_worming')
  DE_WORMING,
  @JsonValue('multivalent')
  MULTIVALENT
}

@JsonSerializable()
class PreventionEvent {
  final int id;
  final int petId;
  final String date;
  final PreventionEventType eventType;
  final bool accurate;

  const PreventionEvent({this.id, this.petId, this.date, this.eventType, this.accurate});

  Map<String, dynamic> toJson() => _$PreventionEventToJson(this);

  factory PreventionEvent.fromJson(Map<String, dynamic> json) => _$PreventionEventFromJson(json);
}
