import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:web_widget/src/bloc/chat/info_event.dart';
import 'package:web_widget/src/bloc/chat/info_state.dart';

export 'package:web_widget/src/bloc/chat/info_event.dart';
export 'package:web_widget/src/bloc/chat/info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  InfoBloc();

  @override
  InfoState get initialState => InfoEmpty();

  @override
  Stream<InfoState> mapEventToState(InfoEvent event) async* {
    if (event is SymptomInfoOpened) {
      yield SymptomInfoSetSuccess(header: event.header, name: event.name, description: event.description);
    } else if (event is AgeInfoOpened) {
      yield AgeInfoSetSuccess(header: event.header, species: event.species);
    } else if (event is TermsAndConditionsOpened) {
      yield TermsAndConditionsSetSuccess();
    } else if (event is SymptomInfoClosed) {
      yield initialState;
    }
  }
}
