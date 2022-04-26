import 'dart:typed_data';

import 'package:built_value/built_value.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/models/aivet/assessment.dart';

part 'assessment_report_state.g.dart';

abstract class AssessmentReportState {
  @nullable
  Assessment get assessment;
  const AssessmentReportState();
}

abstract class AssessmentReportLoadSuccessful
    implements Built<AssessmentReportLoadSuccessful, AssessmentReportLoadSuccessfulBuilder>, AssessmentReportState {
  AssessmentReportLoadSuccessful._();

  factory AssessmentReportLoadSuccessful([void Function(AssessmentReportLoadSuccessfulBuilder) updates]) =
      _$AssessmentReportLoadSuccessful;
}

abstract class AssessmentReportInitial
    implements Built<AssessmentReportInitial, AssessmentReportInitialBuilder>, AssessmentReportState {
  AssessmentReportInitial._();

  factory AssessmentReportInitial([void Function(AssessmentReportInitialBuilder) updates]) = _$AssessmentReportInitial;
}

abstract class AssessmentReportLoading
    implements Built<AssessmentReportLoading, AssessmentReportLoadingBuilder>, AssessmentReportState {
  AssessmentReportLoading._();

  factory AssessmentReportLoading([void Function(AssessmentReportLoadingBuilder) updates]) = _$AssessmentReportLoading;
}

abstract class AssessmentReportFileSuccess
    implements Built<AssessmentReportFileSuccess, AssessmentReportFileSuccessBuilder>, AssessmentReportState {
  Uint8List get file;

  String get filename;

  String get fileMimeType;

  AssessmentReportFileSuccess._();

  factory AssessmentReportFileSuccess([void Function(AssessmentReportFileSuccessBuilder) updates]) =
      _$AssessmentReportFileSuccess;
}

abstract class AssessmentReportExportUrlSuccess
    implements Built<AssessmentReportExportUrlSuccess, AssessmentReportExportUrlSuccessBuilder>, AssessmentReportState {
  String get reportUrl;

  AssessmentReportExportUrlSuccess._();

  factory AssessmentReportExportUrlSuccess([void Function(AssessmentReportExportUrlSuccessBuilder) updates]) =
      _$AssessmentReportExportUrlSuccess;
}
