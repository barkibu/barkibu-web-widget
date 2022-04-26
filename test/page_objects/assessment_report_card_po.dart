import 'package:pageloader/html.dart';
part 'assessment_report_card_po.g.dart';

@PageObject()
@CheckTag('assessment-card')
abstract class AssessmentReportCardPO {
  AssessmentReportCardPO();
  factory AssessmentReportCardPO.create(PageLoaderElement context) = $AssessmentReportCardPO.create;

  @ByCss('.name')
  PageLoaderElement get _name;

  @ByCss('.description')
  PageLoaderElement get _description;

  @ByCss('.urgency-message')
  PageLoaderElement get _urgencyMessage;

  @ByCss('info button')
  PageLoaderElement get _learnMore;

  bool hasName(String name) {
    return _name.innerText == name;
  }

  bool hasDescription(String description) {
    return _description.innerText == description;
  }

  bool hasUrgencyLevel(String urgency) {
    var expectedMessage;
    if (urgency == 'high') {
      expectedMessage = 'Seek urgent veterinary attention';
    } else if (urgency == 'medium') {
      expectedMessage = 'Contact your veterinarian for advice';
    } else {
      expectedMessage =
          'It may resolve naturally, contact your veterinarian if the symptoms persist or worsen over time';
    }
    return _urgencyMessage.innerText == expectedMessage;
  }

  void showMoreInfo() async {
    await _learnMore.click();
  }

  @override
  String toString() {
    return '{name: ${_name.innerText}, description: ${_description.innerText}), urgencyMessage: ${_urgencyMessage.innerText}';
  }
}
