import 'package:json_annotation/json_annotation.dart';

enum Urgency {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('unknown')
  unknown,
}

extension UrgencyExtension on Urgency {
  List<int> getLevelsAsNumbers() => Urgency.values.map((urgency) => urgency.asNumber()).toList();

  int asNumber() {
    switch (this) {
      case Urgency.low:
        return 1;
      case Urgency.medium:
        return 2;
      case Urgency.high:
        return 3;
      default:
        return 0;
    }
  }
}
