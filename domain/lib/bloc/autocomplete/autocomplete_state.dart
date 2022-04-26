import 'package:built_value/built_value.dart';

part 'autocomplete_state.g.dart';

abstract class AutoCompleteState {}

abstract class AutoCompleteInitial
    implements Built<AutoCompleteInitial, AutoCompleteInitialBuilder>, AutoCompleteState {
  List<Object> get items;
  static void _initializeBuilder(AutoCompleteInitialBuilder builder) => builder..items = [];
  AutoCompleteInitial._();
  factory AutoCompleteInitial([void Function(AutoCompleteInitialBuilder) updates]) = _$AutoCompleteInitial;
}

abstract class AutoCompleteLoadInProgress
    implements Built<AutoCompleteLoadInProgress, AutoCompleteLoadInProgressBuilder>, AutoCompleteState {
  List<Object> get items;
  static void _initializeBuilder(AutoCompleteLoadInProgressBuilder builder) => builder..items = [];
  AutoCompleteLoadInProgress._();
  factory AutoCompleteLoadInProgress([void Function(AutoCompleteLoadInProgressBuilder) updates]) =
      _$AutoCompleteLoadInProgress;
}

abstract class AutoCompleteLoadSuccess
    implements Built<AutoCompleteLoadSuccess, AutoCompleteLoadSuccessBuilder>, AutoCompleteState {
  List<Object> get items;
  static void _initializeBuilder(AutoCompleteLoadSuccessBuilder builder) => builder..items = [];
  AutoCompleteLoadSuccess._();
  factory AutoCompleteLoadSuccess([void Function(AutoCompleteLoadSuccessBuilder) updates]) = _$AutoCompleteLoadSuccess;
}

abstract class AutoCompleteLoadFailure
    implements Built<AutoCompleteLoadFailure, AutoCompleteLoadFailureBuilder>, AutoCompleteState {
  List<Object> get items;
  static void _initializeBuilder(AutoCompleteLoadFailureBuilder builder) => builder..items = [];
  AutoCompleteLoadFailure._();
  factory AutoCompleteLoadFailure([void Function(AutoCompleteLoadFailureBuilder) updates]) = _$AutoCompleteLoadFailure;
}
