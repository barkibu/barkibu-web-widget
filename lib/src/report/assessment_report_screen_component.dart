import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/bloc/chat/info_bloc.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/navigation/spinner_overlay_component.dart';
import 'package:web_widget/src/report/assessment_report_ask_a_vet_component.dart';
import 'package:web_widget/src/report/assessment_report_component.dart';
import 'package:web_widget/src/symptom_info/has_info_screen.dart';
import 'package:web_widget/src/symptom_info/info_screen_component.dart';

AssessmentReportBloc reportBlocFactory() => ServiceLocator.container<AssessmentReportBloc>();

@Component(
  selector: 'assessment-report-screen',
  templateUrl: 'assessment_report_screen_component.html',
  styleUrls: ['assessment_report_screen_component.css'],
  directives: [
    coreDirectives,
    layoutDirectives,
    AssessmentReportComponent,
    AssessmentReportAskAVetComponent,
    GoBackComponent,
    InfoBloc,
    SpinnerOverlayComponent,
    InfoScreenComponent,
  ],
  providers: [FactoryProvider(AssessmentReportBloc, reportBlocFactory), ClassProvider(InfoBloc)],
)
class AssessmentReportScreenComponent extends HasInfoScreen implements OnInit, OnDestroy {
  final AssessmentReportBloc _reportBloc;
  AssessmentReportViewModel assessment;
  String reportExportLink;

  @Input()
  AssessmentIdentificationViewModel assessmentIdentification;

  @Input()
  bool askAVet = false;

  final MessagesModel messages;

  AssessmentReportScreenComponent(this._reportBloc, this.messages, InfoBloc infoBloc) {
    setInfoBloc(infoBloc);
  }

  @override
  void ngOnInit() {
    _reportBloc.listen(reportBlocListener);
    _reportBloc.add(AssessmentReportStarted(assessmentIdentification.consultationId));
  }

  @override
  void ngOnDestroy() {
    _reportBloc.close();
    closeSymtomInfoBloc();
  }

  bool get isAssessmentLoading => assessment == null;

  String get title {
    if (askAVet) {
      return messages.assessmentReportMessages.askAVetTitle;
    } else {
      return messages.assessmentReportMessages.title;
    }
  }

  void reportBlocListener(AssessmentReportState state) {
    if (state is AssessmentReportExportUrlSuccess) {
      reportExportLink = state.reportUrl;
    } else if (state is AssessmentReportLoadSuccessful) {
      assessment =
          AssessmentReportViewModel.fromAssessment(pet: assessmentIdentification.pet, assessment: state.assessment);
      _reportBloc.add(AssessmentReportExportUrlRequested(assessment));
    }
  }
}
