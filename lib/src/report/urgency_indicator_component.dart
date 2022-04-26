import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';

@Component(selector: 'urgency-indicator', templateUrl: 'urgency_indicator_component.html', styleUrls: [
  'urgency_indicator_component.css'
], directives: [
  coreDirectives,
])
class UrgencyIndicatorComponent {
  @Input()
  int urgencyLevel;

  final MessagesModel messages;

  UrgencyIndicatorComponent(this.messages);

  String get urgencyMessage {
    switch (urgencyLevel) {
      case 1:
        return messages.assessmentReportMessages.treatedAtHome;
      case 2:
        return messages.assessmentReportMessages.vetCheckRecommended;
      case 3:
        return messages.assessmentReportMessages.urgent;
      default:
        return '';
    }
  }

  bool get isUrgent {
    return urgencyLevel == 3;
  }

  List get emptyScale {
    switch (urgencyLevel) {
      case 1:
        return [2, 3];
      case 2:
        return [3];
      case 3:
        return [];
      default:
        return [1, 2, 3];
    }
  }

  List get filledScale {
    switch (urgencyLevel) {
      case 1:
        return [1];
      case 2:
        return [1, 2];
      case 3:
        return [1, 2, 3];
      default:
        return [];
    }
  }
}
