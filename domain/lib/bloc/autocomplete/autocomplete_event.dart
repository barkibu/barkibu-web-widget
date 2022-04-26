import 'package:built_value/built_value.dart';

part 'autocomplete_event.g.dart';

abstract class AutoCompleteEvent {
  const AutoCompleteEvent();
}

abstract class AutoCompleteRequested
    implements Built<AutoCompleteRequested, AutoCompleteRequestedBuilder>, AutoCompleteEvent {
  String get query;
  Map<String, dynamic> get params;

  AutoCompleteRequested._();
  factory AutoCompleteRequested([void Function(AutoCompleteRequestedBuilder) updates]) = _$AutoCompleteRequested;
}
