import 'package:pageloader/html.dart';
import 'assessment_report_po.dart';
part 'pet_assessment_history_po.g.dart';

@PageObject()
@CheckTag('pet-assessment-history')
abstract class PetAssessmentHistoryPO {
  PetAssessmentHistoryPO();
  factory PetAssessmentHistoryPO.create(PageLoaderElement context) = $PetAssessmentHistoryPO.create;
  factory PetAssessmentHistoryPO.lookup(PageLoaderSource context) = $PetAssessmentHistoryPO.lookup;

  @ByTagName('li')
  List<PageLoaderElement> get _assessmentItems;

  @ByTagName('Button')
  List<PageLoaderElement> get _assessmentLinks;

  @ByCheckTag()
  AssessmentReportPO get report;

  bool hasAssessmentItem(String symptom) {
    assert(symptom != null && symptom.isNotEmpty);
    return _assessmentItems.any((item) => item.innerText.contains(symptom));
  }

  void openAssessmentReport(String symptom) async {
    assert(symptom != null && symptom.isNotEmpty);
    await _assessmentLinks.firstWhere((link) => link.innerText.contains(symptom)).click();
  }
}
