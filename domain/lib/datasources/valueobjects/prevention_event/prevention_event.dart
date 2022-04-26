import 'package:common_barkibu_dart/models/prevention_event/prevention_event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prevention_event.g.dart';

@JsonSerializable()
class PreventionEventRequest {
  final String eventType;
  final String date;
  final bool accurate;

  PreventionEventRequest(this.eventType, this.date, [this.accurate = false]);

  factory PreventionEventRequest.fromJson(Map<String, dynamic> json) => _$PreventionEventRequestFromJson(json);

  Map<String, dynamic> toJson() => <String, dynamic>{'preventionEvent': _$PreventionEventRequestToJson(this)};
}

@JsonSerializable()
class PreventionEventBatchRequest {
  final List<PreventionEventRequest> preventionEvents;

  PreventionEventBatchRequest(this.preventionEvents);

  factory PreventionEventBatchRequest.fromJson(Map<String, dynamic> json) =>
      _$PreventionEventBatchRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PreventionEventBatchRequestToJson(this);
}

@JsonSerializable()
class PreventionEventResponse {
  final int id;
  final int petId;
  final String date;
  final PreventionEventType eventType;
  final bool accurate;

  const PreventionEventResponse(this.id, this.petId, this.date, this.eventType, this.accurate);

  factory PreventionEventResponse.fromJson(Map<String, dynamic> json) =>
      _$PreventionEventResponseFromJson(json['preventionEvent']);

  Map<String, dynamic> toJson() => <String, dynamic>{'preventionEvent': _$PreventionEventResponseToJson(this)};

  PreventionEvent toPreventionEvent() => PreventionEvent(
        id: id,
        accurate: accurate,
        eventType: eventType,
        date: date,
        petId: petId,
      );
}

class PreventionEventsResponse {
  static List<PreventionEventResponse> fromJson(List<dynamic> json) =>
      json?.map((dynamic response) => PreventionEventResponse.fromJson(response))?.toList() ?? [];
}
