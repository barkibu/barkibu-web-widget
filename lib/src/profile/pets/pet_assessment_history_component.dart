import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/chat/chat_component.dart';
import 'package:web_widget/src/report/assessment_report_screen_component.dart';

import 'package:web_widget/src/route_paths.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/layout/pet_title_component.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/navigation/spinner_overlay_component.dart';
import 'package:web_widget/src/icons/icon_component.dart';
import 'package:web_widget/src/widget_configuration.dart';

AssessmentHistoryBloc historyBlocFactory() => ServiceLocator.container<AssessmentHistoryBloc>();
PetProfileBloc petProfileBlocFactory() => ServiceLocator.container<PetProfileBloc>();

@Component(selector: 'pet-assessment-history', templateUrl: 'pet_assessment_history_component.html', styleUrls: [
  'pet_assessment_history_component.css'
], directives: [
  coreDirectives,
  layoutDirectives,
  routerDirectives,
  GoBackComponent,
  SpinnerOverlayComponent,
  AssessmentReportScreenComponent,
  IconComponent,
  PetTitleComponent
], providers: [
  FactoryProvider(AssessmentHistoryBloc, historyBlocFactory),
  FactoryProvider(PetProfileBloc, petProfileBlocFactory),
], exports: [
  RoutePaths
], pipes: [
  DatePipe
])
class PetAssessmentHistoryComponent implements OnActivate, OnDestroy {
  final AssessmentHistoryBloc historyBloc;
  final PetProfileBloc petProfileBloc;
  final MessagesModel messages;
  final Router router;
  final WidgetConfiguration _config;
  final AnalyticsService _analyticsService;
  List<Assessment> assessments;
  List<AssessmentReportViewModel> assessmentReports;
  Pet pet;
  AssessmentIdentificationViewModel selectedReport;
  AssessmentFilter assessmentType;

  int petId;

  PetAssessmentHistoryComponent(
      this.petProfileBloc, this.historyBloc, this.messages, this.router, this._config, this._analyticsService) {
    historyBloc.listen(historyBlocListener);
    petProfileBloc.listen(petProfileBlocListener);
  }

  @override
  void onActivate(_, RouterState current) async {
    petId = int.parse(current.parameters['id']);
    if (current.queryParameters['filter'] == ChatComponent.askAVetFlow) {
      _analyticsService.screen.logMyHistoryAskAVetDates();
      assessmentType = AssessmentFilter.askAVet;
    } else {
      _analyticsService.screen.logMyHistoryVirtualVetDates();
      assessmentType = AssessmentFilter.completed;
    }
    historyBloc.add(AssessmentHistoryRequested(petId));
    petProfileBloc.add(PetProfileStarted((b) => b.petId = petId));
  }

  @override
  void ngOnDestroy() {
    historyBloc.close();
  }

  void historyBlocListener(AssessmentHistoryState state) {
    if (state is AssessmentHistoryLoadSuccess) {
      if (isAskAVetHistory) {
        assessments = state.askAVetAssessments;
      } else {
        assessments = state.aivetAssessments;
      }
      _buildAssessmentReports();
    }
  }

  void petProfileBlocListener(PetProfileState state) async {
    if (state is PetProfileLoadSuccess) {
      pet = state.pets.first;
      _buildAssessmentReports();
    }
  }

  void _buildAssessmentReports() {
    if (pet == null || assessments == null) {
      return;
    }
    assessmentReports = assessments.map((assessment) {
      return AssessmentReportViewModel.fromAssessment(pet: pet, assessment: assessment);
    }).toList();
  }

  String firstSymptom(AssessmentReportViewModel report) {
    return report.symptoms.first.name;
  }

  String get petProfilePath {
    return RoutePaths.petProfile.toUrl(parameters: {'id': petId.toString()});
  }

  bool get isReportSelected => selectedReport != null;
  bool get isAskAVetHistory => assessmentType == AssessmentFilter.askAVet;
  String get dateFormat => _config.assessmentDateFormat;

  void selectReport(AssessmentReportViewModel report) {
    if (isAskAVetHistory) {
      _analyticsService.screen.logMyHistoryAskAVetDetails();
    } else {
      _analyticsService.screen.logMyHistoryVirtualVetDetails();
    }
    selectedReport = AssessmentIdentificationViewModel(pet, report.consultationId);
    ;
  }

  void clearSelectedReport() {
    if (isAskAVetHistory) {
      _analyticsService.screen.logMyHistoryAskAVetDates();
    } else {
      _analyticsService.screen.logMyHistoryVirtualVetDates();
    }
    selectedReport = null;
  }
}
