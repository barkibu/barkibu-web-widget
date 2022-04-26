import 'package:common_barkibu_dart/models/models.dart';

abstract class PreventionEventEvent {
  const PreventionEventEvent();
}

class PreventionEventEventsAdded extends PreventionEventEvent {
  final List<PreventionEvent> preventionEvents;

  PreventionEventEventsAdded(this.preventionEvents);
}
