import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/domain/pet/get_pet_assessment_report_use_case.dart';

import 'assessment_report_event.dart';
import 'assessment_report_state.dart';

export 'assessment_report_event.dart';
export 'assessment_report_state.dart';

final _kTitlePattern = '{title}';
final _kPetNamePattern = '{petName}';
final _kTimePattern = '{time}';
final _kSpacePattern = ' ';
final _kDashPattern = '-';

final _kFileNamePattern = '$_kTitlePattern-$_kPetNamePattern-$_kTimePattern.pdf';
final _kFileNameMimeType = 'application/pdf';

class AssessmentReportBloc extends Bloc<AssessmentReportEvent, AssessmentReportState> {
  final GetPetAssessmentReportUseCase _getAssessmentReportUseCase;
  Uint8List fileData;

  AssessmentReportBloc(this._getAssessmentReportUseCase);

  @override
  AssessmentReportInitial get initialState => AssessmentReportInitial();

  @override
  Stream<AssessmentReportState> mapEventToState(AssessmentReportEvent event) async* {
    if (event is AssessmentReportStarted) {
      yield AssessmentReportLoading();
      final assessment = await _getAssessmentReportUseCase.getPetAssessment(event.consultationId);
      yield AssessmentReportLoadSuccessful((b) => b..assessment = assessment);
    } else if (event is AssessmentReportExportPressed) {
      yield* _mapExportEvent(event);
    } else if (event is AssessmentReportExportUrlRequested) {
      yield* _mapExportUrlEvent(event);
    } else if (event is AssessmentReportExportShareStarted) {
      yield AssessmentReportLoading((b) => b.assessment = state.assessment);
    } else if (event is AssessmentReportExportShareFinished) {
      yield AssessmentReportInitial((b) => b.assessment = state.assessment);
    }
  }

  Stream<AssessmentReportState> _mapExportEvent(AssessmentReportExportPressed event) async* {
    yield AssessmentReportLoading((b) => b.assessment = state.assessment);

    if (fileData == null) {
      final pet = event.assessmentReportViewModel.pet;
      final consultationId = event.assessmentReportViewModel.consultationId;
      final assessmentReport = await _getAssessmentReportUseCase.getPetAssessmentPDF(pet, consultationId);

      fileData = assessmentReport.file;
    }

    yield AssessmentReportFileSuccess((b) => b
      ..assessment = state.assessment
      ..file = fileData
      ..fileMimeType = _kFileNameMimeType
      ..filename = _generateFileName(event));
  }

  Stream<AssessmentReportState> _mapExportUrlEvent(AssessmentReportExportUrlRequested event) async* {
    yield AssessmentReportLoading((b) => b.assessment = state.assessment);

    final pet = event.assessmentReportViewModel.pet;
    final consultationId = event.assessmentReportViewModel.consultationId;
    final assessmentReportUrl = await _getAssessmentReportUseCase.getPetAssessmentPDFShortLivedUrl(pet, consultationId);

    yield AssessmentReportExportUrlSuccess((b) => b
      ..reportUrl = assessmentReportUrl
      ..assessment = state.assessment);
  }

  String _generateFileName(AssessmentReportExportPressed event) => _kFileNamePattern
      .replaceAll(_kTitlePattern, event.assessmentReportTitle)
      .replaceAll(_kPetNamePattern, event.assessmentReportViewModel.pet.name)
      .replaceAll(_kTimePattern, DateTime.now().millisecondsSinceEpoch.toString())
      .replaceAll(_kSpacePattern, _kDashPattern);
}
