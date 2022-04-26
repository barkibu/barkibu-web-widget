import 'package:common_barkibu_dart/models/models.dart';

abstract class AssessmentHistoryState {}

class AssessmentHistoryInitial extends AssessmentHistoryState {}

class AssessmentHistoryLoadInProgress extends AssessmentHistoryState {}

class AssessmentHistoryLoadSuccess extends AssessmentHistoryState {
  final List<Assessment> askAVetAssessments;
  final List<Assessment> aivetAssessments;
  final Features features;

  List<Assessment> get assessments => Assessment.sortedByDate([...askAVetAssessments, ...aivetAssessments]);
  Features get featuresBloc => features;

  AssessmentHistoryLoadSuccess(this.askAVetAssessments, this.aivetAssessments, this.features);
}

class AssessmentHistoryLoadFailure extends AssessmentHistoryState {}
