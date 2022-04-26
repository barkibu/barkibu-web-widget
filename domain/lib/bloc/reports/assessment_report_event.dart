import 'package:common_barkibu_dart/viewmodels/pet_health/assessment_report_view_model.dart';

abstract class AssessmentReportEvent {
  const AssessmentReportEvent();
}

class AssessmentReportStarted extends AssessmentReportEvent {
  final String consultationId;

  AssessmentReportStarted(this.consultationId);
}

class AssessmentReportExportPressed extends AssessmentReportEvent {
  final AssessmentReportViewModel assessmentReportViewModel;
  final String assessmentReportTitle;

  AssessmentReportExportPressed({this.assessmentReportTitle, this.assessmentReportViewModel});
}

class AssessmentReportExportUrlRequested extends AssessmentReportEvent {
  final AssessmentReportViewModel assessmentReportViewModel;

  AssessmentReportExportUrlRequested(this.assessmentReportViewModel);
}

class AssessmentReportExportShareStarted extends AssessmentReportEvent {}

class AssessmentReportExportShareFinished extends AssessmentReportEvent {}
