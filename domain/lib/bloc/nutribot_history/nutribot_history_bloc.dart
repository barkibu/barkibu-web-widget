import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/bloc/nutribot_history/nutribot_history_event.dart';
import 'package:common_barkibu_dart/bloc/nutribot_history/nutribot_history_state.dart';
import 'package:common_barkibu_dart/domain/pet/nutribot_history_use_case.dart';
import 'package:common_barkibu_dart/models/nutribot_consultation.dart';

class NutribotHistoryBloc extends Bloc<NutribotHistoryEvent, NutribotHistoryState> {
  final NutribotHistoryUseCase _nutribotHistoryUseCase;

  NutribotHistoryBloc(this._nutribotHistoryUseCase);

  @override
  NutribotHistoryState get initialState => NutribotHistoryInitial();

  @override
  Stream<NutribotHistoryState> mapEventToState(NutribotHistoryEvent event) async* {
    if (event is NutribotHistoryRequested) {
      yield NutribotHistoryLoadInProgress();
      try {
        final nutribotConsultations = await _nutribotHistoryUseCase.getNutribotConsultations(event.petId);
        yield NutribotHistoryLoadSuccess(NutribotConsultation.sortedByDate(nutribotConsultations));
      } catch (e) {
        yield NutribotHistoryLoadFailure();
      }
    }
  }
}
