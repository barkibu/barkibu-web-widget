import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/messages/messages_model.dart';
import 'package:web_widget/src/icons/icon_component.dart';

@Component(selector: 'info', template: '''
  <button><widget-icon iconType="info" [title]="altText"></widget-icon></button>
  ''', styleUrls: ['info_component.css'], directives: [IconComponent])
class InfoComponent {
  String altText;

  InfoComponent(MessagesModel messages) {
    altText = messages.chatMessages.botMessages.showResultsAction;
  }
}
