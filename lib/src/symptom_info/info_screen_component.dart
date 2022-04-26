import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/bloc/chat/info_bloc.dart';
import 'package:web_widget/src/bloc/chat/info_state.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/symptom_info/info_body_component.dart';

@Component(
  selector: 'info-screen',
  templateUrl: 'info_screen_component.html',
  styleUrls: ['info_screen_component.css'],
  directives: [
    coreDirectives,
    layoutDirectives,
    GoBackComponent,
    InfoBodyComponent,
  ],
)
class InfoScreenComponent {
  final MessagesModel messages;
  final InfoBloc _infoBloc;

  @Input()
  InfoSetSuccess infoState;

  InfoScreenComponent(this.messages, this._infoBloc);

  String get headerTitle {
    if (infoState is TermsAndConditionsSetSuccess) {
      return messages.homeMessages.termsOfService.termsOfService;
    } else {
      return messages.chatMessages.botMessages.showResultsAction;
    }
  }

  void clearSymptomInfo() {
    _infoBloc.add(SymptomInfoClosed());
  }
}
