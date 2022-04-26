import 'package:pageloader/html.dart';
import 'package:test/test.dart';
import 'assessment_report_card_po.dart';
part 'assessment_report_po.g.dart';

@PageObject()
@CheckTag('assessment-report')
abstract class AssessmentReportPO {
  AssessmentReportPO();
  factory AssessmentReportPO.create(PageLoaderElement context) = $AssessmentReportPO.create;

  @ByCss('.next-step-title')
  PageLoaderElement get _nextStepTitle;

  @ByCss('.next-step-content')
  PageLoaderElement get _nextStepContent;

  @ByCss('.symptoms-list assessment-card')
  List<AssessmentReportCardPO> get _symptomCards;

  @ByCss('.conditions-list assessment-card')
  List<AssessmentReportCardPO> get _conditionCards;

  @ByCss('widget-button a')
  @WithInnerText('Export')
  PageLoaderElement get _exportLink;

  @ByCss('widget-button button')
  @WithInnerText('Export')
  PageLoaderElement get _exportButton;

  bool hasUrgentConditionNextStep(String petName) {
    return _nextStepTitle.innerText == 'Immediate Vet Attention Recommended' &&
        _nextStepContent.innerText ==
            'Based on the symptoms you have highlighted I recommend '
                'that you get in touch with a Vet as there may be some urgent issues '
                'that need to be looked at for $petName.';
  }

  bool hasUrgentSymptomsNextStep(String petName) {
    return _nextStepTitle.innerText == 'Immediate Vet Attention Recommended' &&
        _nextStepContent.innerText ==
            'The symptoms described could be dangerous for $petName, '
                'I recommend that you go urgently with Snoopy to a veterinary clinic';
  }

  Matcher isSymptomIndexed(int index) {
    return predicate((Map<String, dynamic> symptom) {
      return hasSymptomInfo(symptom, index);
    }, 'symptoms contains ${_symptomCards[index]} at index $index');
  }

  bool hasSymptomInfo(Map<String, dynamic> symptom, int index) {
    final card = _symptomCards[index];
    return card.hasName(symptom['name']) &&
        card.hasDescription(symptom['article']) &&
        card.hasUrgencyLevel(symptom['urgency']);
  }

  Matcher isConditionIndexed(int index) {
    return predicate((Map<String, dynamic> condition) {
      return hasConditionInfo(condition, index);
    }, 'conditions contains ${_conditionCards[index]} at $index');
  }

  bool hasConditionInfo(Map<String, dynamic> condition, int index) {
    final card = _conditionCards[index];
    return card.hasName(condition['name']) &&
        card.hasDescription(condition['article']) &&
        card.hasUrgencyLevel(condition['urgency']);
  }

  void openSymptomInformation(int index) async {
    await _symptomCards[index].showMoreInfo();
  }

  void openConditionInformation(int index) async {
    await _conditionCards[index].showMoreInfo();
  }

  String get exportUrl => _exportLink.attributes['href'];

  void clickExportButton() async {
    await _exportButton.click();
  }
}
