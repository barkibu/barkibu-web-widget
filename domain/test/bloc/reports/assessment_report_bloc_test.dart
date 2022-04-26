import 'dart:typed_data';

import 'package:common_barkibu_dart/bloc/bloc.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/domain/pet/get_pet_assessment_report_use_case.dart';
import 'package:common_barkibu_dart/models/pet.dart';
import 'package:common_barkibu_dart/viewmodels/pet_health/assessment_report_view_model.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockGetPetAssessmentReportUseCase extends Mock implements GetPetAssessmentReportUseCase {}

void main() {
  GetPetAssessmentReportUseCase getPetAssessmentReportUseCase;
  AssessmentReportBloc assessmentReportBloc;
  AssessmentReportViewModel assessmentReportViewModel;

  setUp(() {
    getPetAssessmentReportUseCase = MockGetPetAssessmentReportUseCase();
    assessmentReportBloc = AssessmentReportBloc(getPetAssessmentReportUseCase);
    assessmentReportViewModel = AssessmentReportViewModel.fromAssessment(
        pet: Pet(id: 0, name: 'pet'),
        assessment: Assessment(
          consultationId: '1234',
          symptoms: [],
          conditions: [],
          urgency: Urgency.low,
        ));
  });

  tearDown(() async {
    await assessmentReportBloc?.close();
  });

  group('AssessmentReportBloc', () {
    test('Initial state is correct', () async {
      expect(assessmentReportBloc.initialState, isA<AssessmentReportInitial>());
    });
  });

  group('AssessmentReportExportUrlRequested', () {
    final shortLivedUrl = 'https://aws_storage.com/report/xyz?token=chuuuut';
    setUp(() {
      when(getPetAssessmentReportUseCase.getPetAssessmentPDFShortLivedUrl(any, any))
          .thenAnswer((_) => Future.value(shortLivedUrl));
    });

    test('generates a url for direct download of the report', () async {
      assessmentReportBloc.add(AssessmentReportExportUrlRequested(assessmentReportViewModel));

      await expectLater(
        assessmentReportBloc,
        emitsInOrder([
          isA<AssessmentReportInitial>(),
          isA<AssessmentReportLoading>(),
          allOf(
              isA<AssessmentReportExportUrlSuccess>(),
              predicate((AssessmentReportExportUrlSuccess state) => state.reportUrl == shortLivedUrl,
                  'Report Url is provided to the state')),
        ]),
      );

      verify(getPetAssessmentReportUseCase.getPetAssessmentPDFShortLivedUrl(any, any)).called(1);
    });
  });

  group('AssessmentReportExportPressed event', () {
    setUp(() {
      when(getPetAssessmentReportUseCase.getPetAssessmentPDF(any, any))
          .thenAnswer((_) => Future.value(AssessmentPDF(Uint8List.fromList([1, 2, 3, 4, 5, 6]))));
    });

    test('generate an assessment report', () async {
      assessmentReportBloc.add(AssessmentReportExportPressed(
        assessmentReportTitle: 'title',
        assessmentReportViewModel: assessmentReportViewModel,
      ));

      await expectLater(
        assessmentReportBloc,
        emitsInOrder([
          isA<AssessmentReportInitial>(),
          isA<AssessmentReportLoading>(),
          isA<AssessmentReportFileSuccess>(),
        ]),
      );

      verify(getPetAssessmentReportUseCase.getPetAssessmentPDF(any, any)).called(1);
    });

    test('generate an assessment report second time reuse previous file', () async {
      assessmentReportBloc.add(AssessmentReportExportPressed(
        assessmentReportTitle: 'title',
        assessmentReportViewModel: assessmentReportViewModel,
      ));

      assessmentReportBloc.add(AssessmentReportExportPressed(
        assessmentReportTitle: 'title',
        assessmentReportViewModel: assessmentReportViewModel,
      ));

      await expectLater(
        assessmentReportBloc,
        emitsInOrder([
          isA<AssessmentReportInitial>(),
          isA<AssessmentReportLoading>(),
          isA<AssessmentReportFileSuccess>(),
          isA<AssessmentReportLoading>(),
          isA<AssessmentReportFileSuccess>(),
        ]),
      );

      verify(getPetAssessmentReportUseCase.getPetAssessmentPDF(any, any)).called(1);
    });
  });
}
