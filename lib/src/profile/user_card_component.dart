import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/models/user.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/card/card_component.dart';
import 'package:web_widget/src/route_paths.dart';

@Component(
    selector: 'user-card',
    templateUrl: 'user_card_component.html',
    styleUrls: ['user_card_component.css'],
    directives: [coreDirectives, WidgetButtonComponent, CardComponent],
    exports: [RoutePaths])
class UserCardComponent {
  @Input()
  User user;

  final MessagesModel messages;

  UserCardComponent(this.messages);

  String profileInitials() {
    final firstName = user.firstName ?? '';
    final lastName = user.lastName ?? '';

    if (firstName.isNotEmpty && lastName.isNotEmpty) {
      return firstName.substring(0, 1) + lastName.substring(0, 1);
    } else if (firstName.length > 1) {
      return firstName.substring(0, 2);
    } else {
      return firstName;
    }
  }
}
