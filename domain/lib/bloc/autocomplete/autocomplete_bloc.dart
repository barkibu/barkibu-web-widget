import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/bloc/autocomplete/autocomplete_event.dart';
import 'package:common_barkibu_dart/bloc/autocomplete/autocomplete_state.dart';
import 'package:common_barkibu_dart/domain/pet/get_breeds_use_case.dart';
import 'package:common_barkibu_dart/models/breed.dart';

class AutoCompleteBloc extends Bloc<AutoCompleteEvent, AutoCompleteState> {
  final AutoCompletionUseCase _autoCompletionUseCase;

  AutoCompleteState currentState;

  AutoCompleteBloc(
    this._autoCompletionUseCase,
  );

  @override
  AutoCompleteState get initialState => AutoCompleteInitial();

  @override
  Stream<AutoCompleteState> mapEventToState(AutoCompleteEvent event) async* {
    if (event is AutoCompleteRequested) {
      yield AutoCompleteLoadInProgress();
      final items = await _autoCompletionUseCase.search(event.query, event.params);
      if (items.isNotEmpty) {
        yield AutoCompleteLoadSuccess((b) => b..items = items);
      } else {
        yield AutoCompleteLoadFailure();
      }
    }
  }
}

class AutoCompleteBreedsBloc extends AutoCompleteBloc {
  @override
  final AutoCompletionUseCase<Breed> _autoCompletionUseCase;

  AutoCompleteBreedsBloc(this._autoCompletionUseCase) : super(_autoCompletionUseCase);
}
