import 'package:angular/angular.dart';

@Component(
  selector: 'thewildest-bot-icon',
  templateUrl: 'thewildest_bot_icon.html',
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class TheWildestBotIcon {
  @Input()
  String title;
}
