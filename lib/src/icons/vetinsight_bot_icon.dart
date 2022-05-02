import 'package:angular/angular.dart';

@Component(
  selector: 'vetinsight-bot-icon',
  templateUrl: 'vetinsight_bot_icon.html',
  styleUrls: ['vetinsight_bot_icon.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class VetinsightBotIcon {
  @Input()
  String title;
}
