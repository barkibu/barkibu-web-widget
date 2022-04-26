import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:web_widget/src/report/urgency_indicator_component.dart';
import 'package:web_widget/src/report/index_component.dart';
import 'package:web_widget/src/report/info_component.dart';
import 'package:web_widget/src/bloc/chat/info_bloc.dart';

@Component(
    selector: 'assessment-card',
    templateUrl: 'assessment_card_component.html',
    styleUrls: ['assessment_card_component.css'],
    directives: [coreDirectives, UrgencyIndicatorComponent, IndexComponent, InfoComponent])
class AssessmentCardComponent {
  final InfoBloc infoBloc;
  final MessagesModel messages;

  @Input()
  String name;

  @Input()
  String shortDescription;

  @Input()
  String description;

  @Input()
  int urgencyLevel;

  @Input()
  int index;

  AssessmentCardComponent(this.infoBloc, this.messages);

  bool get hasInformation => description != null && description.isNotEmpty;

  void showConditionInfo() {
    infoBloc.add(SymptomInfoOpened(name: name, description: description));
  }
}
