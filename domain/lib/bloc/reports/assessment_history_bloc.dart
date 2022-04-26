import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/bloc/reports/assessment_history_event.dart';
import 'package:common_barkibu_dart/bloc/reports/assessment_history_state.dart';
import 'package:common_barkibu_dart/domain/pet/get_pet_features_use_case.dart';

export 'package:common_barkibu_dart/bloc/reports/assessment_history_event.dart';
export 'package:common_barkibu_dart/bloc/reports/assessment_history_state.dart';

class AssessmentHistoryBloc extends Bloc<AssessmentHistoryEvent, AssessmentHistoryState> {
  final GetPetAssessmentsUseCase _getPetAssessmentsUseCase;
  final GetPetFeaturesUseCase _getPetFeaturesUseCase;
  AssessmentHistoryBloc(this._getPetAssessmentsUseCase, this._getPetFeaturesUseCase);

  @override
  AssessmentHistoryState get initialState => AssessmentHistoryInitial();

  @override
  Stream<AssessmentHistoryState> mapEventToState(AssessmentHistoryEvent event) async* {
    if (event is AssessmentHistoryRequested) {
      yield AssessmentHistoryLoadInProgress();
      try {
        final askAVetAssessments = await _getPetAssessmentsUseCase.getPetAskAVetAssessments(event.petId);
        final aivetAssessments = await _getPetAssessmentsUseCase.getPetAivetAssessments(event.petId);
        final petFeatures = await _getPetFeaturesUseCase.getFeatures(event.petId);
        yield AssessmentHistoryLoadSuccess(
            Assessment.sortedByDate(askAVetAssessments), Assessment.sortedByDate(aivetAssessments), petFeatures);
      } catch (e) {
        yield AssessmentHistoryLoadFailure();
      }
    }
  }
}
