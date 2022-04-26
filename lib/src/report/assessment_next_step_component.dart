import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';

@Component(selector: 'assessment-next-step', templateUrl: 'assessment_next_step_component.html', styleUrls: [
  'assessment_next_step_component.css'
], directives: [
  coreDirectives,
])
class AssessmentNextStepComponent {
  @Input()
  AssessmentReportViewModel assessment;

  final MessagesModel messages;

  AssessmentNextStepComponent(this.messages);

  bool get isConditionsEmpty => assessment.conditions.isEmpty;
  bool get isUrgent => assessment.urgency == Urgency.high;

  String get nextStepTitle {
    return isUrgent
        ? messages.assessmentReportMessages.urgentTitle
        : (isConditionsEmpty ? messages.assessmentReportMessages.noConditionsTitle : null);
  }

  String get _nextStepContent {
    return isUrgent
        ? (assessment.hasUrgentConditions()
            ? messages.assessmentReportMessages.urgentBodyCondition
            : messages.assessmentReportMessages.urgentBodySymptom)
        : (isConditionsEmpty
            ? messages.assessmentReportMessages.noConditionsBody
            : messages.assessmentReportMessages.notUrgentBody);
  }

  // Using `replaceAll` instead of i18n params to be consistent with the app
  String get nextStepContent => _nextStepContent.replaceAll('{pet}', assessment.pet.name);
}
