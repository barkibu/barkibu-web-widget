import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/report/assessment_next_step_component.dart';
import 'package:web_widget/src/report/assessment_card_component.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/icons/icon_component.dart';
import 'package:web_widget/src/widget_configuration.dart';
import 'package:web_widget/src/widget_window/parent_window_service.dart';

AssessmentReportBloc reportBlocFactory() => ServiceLocator.container<AssessmentReportBloc>();

@Component(
    selector: 'assessment-report-ask-a-vet',
    templateUrl: 'assessment_report_ask_a_vet_component.html',
    styleUrls: [
      'assessment_report_ask_a_vet_component.css'
    ],
    directives: [
      coreDirectives,
      AssessmentNextStepComponent,
      AssessmentCardComponent,
      WidgetButtonComponent,
      IconComponent,
    ],
    providers: [
      FactoryProvider(AssessmentReportBloc, reportBlocFactory)
    ],
    pipes: [
      DatePipe
    ])
class AssessmentReportAskAVetComponent implements OnInit, OnDestroy {
  static const cutoff = 120;
  final AssessmentReportBloc reportBloc;
  final WidgetConfiguration _config;
  final ParentWindowService _parentWindow;
  List<Symptom> symptoms;
  List<Condition> conditions;

  @Input()
  String reportExportLink;

  @Input('assessmentReport')
  AssessmentReportViewModel assessment;

  @Input()
  String assessmentTitle;

  final MessagesModel messages;

  AssessmentReportAskAVetComponent(this.reportBloc, this.messages, this._config, this._parentWindow);

  @override
  void ngOnInit() {
    symptoms = _orderedSymptoms;
    conditions = _orderedConditions;
  }

  @override
  void ngOnDestroy() {
    reportBloc.close();
  }

  List<Symptom> get _orderedSymptoms {
    if (_config.aivetUrgencyOrderEnabled) {
      return List.from(assessment.symptoms)..sort((a, b) => symptomUrgencyLevel(b).compareTo(symptomUrgencyLevel(a)));
    } else {
      return assessment.symptoms;
    }
  }

  List<Condition> get _orderedConditions {
    if (_config.aivetUrgencyOrderEnabled) {
      return List.from(assessment.conditions)
        ..sort((a, b) => conditionUrgencyLevel(b).compareTo(conditionUrgencyLevel(a)));
    } else {
      return assessment.conditions;
    }
  }

  bool get isConditionsEmpty => assessment.conditions.isEmpty;
  String conditionName(Condition condition) => condition.name;
  String conditionDescription(Condition condition) => condition.article;
  String conditionShortDescription(Condition condition) => _cutoff(condition.article);
  int conditionUrgencyLevel(Condition condition) => condition.urgency.asNumber();
  String get firstSymptom => assessment.symptoms.first.name;
  String symptomName(Symptom symptom) => symptom.name;
  String symptomDescription(Symptom symptom) => symptom.article;
  String symptomShortDescription(Symptom symptom) => _cutoff(symptom.article);
  int symptomUrgencyLevel(Symptom symptom) => symptom.urgency.asNumber();

  String _cutoff(String text) {
    if (text != null && text.isNotEmpty) {
      return (text.length <= cutoff) ? text : '${text.substring(0, cutoff)}...';
    } else {
      return null;
    }
  }

  String get dateFormat => _config.assessmentDateFormat;
  bool get isLinkGenerating => reportExportLink == null;
  bool get isExportReportExternalEvent => _config.externalLinksEventsEnabled;
  void notifyExportReportRequested() => _parentWindow.notifyExportReportRequested(reportExportLink);
}
