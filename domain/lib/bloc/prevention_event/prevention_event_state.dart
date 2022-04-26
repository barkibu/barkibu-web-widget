import 'package:built_value/built_value.dart';
import 'package:common_barkibu_dart/models/prevention_event/prevention_event.dart';

part 'prevention_event_state.g.dart';

abstract class PreventionEventState {
  List<PreventionEvent> get events;
}

abstract class PreventionEventInitial
    implements Built<PreventionEventInitial, PreventionEventInitialBuilder>, PreventionEventState {
  static void _initializeBuilder(PreventionEventInitialBuilder builder) => builder..events = [];

  PreventionEventInitial._();

  factory PreventionEventInitial([void Function(PreventionEventInitialBuilder) updates]) = _$PreventionEventInitial;
}

abstract class PreventionEventAddSuccess
    implements Built<PreventionEventAddSuccess, PreventionEventAddSuccessBuilder>, PreventionEventState {
  static void _initializeBuilder(PreventionEventAddSuccessBuilder builder) => builder..events = [];

  PreventionEventAddSuccess._();

  factory PreventionEventAddSuccess([void Function(PreventionEventAddSuccessBuilder) updates]) =
      _$PreventionEventAddSuccess;
}

class PreventionEventAddFailure extends PreventionEventState {
  @override
  List<PreventionEvent> get events => [];
}
