import 'package:angular/angular.dart';

@Component(
  selector: 'vetinsight-bot-icon-iams',
  templateUrl: 'vetinsight_bot_icon_iams.html',
  styleUrls: ['vetinsight_bot_icon_iams.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class VetinsightBotIconIams {
  @Input()
  String title;
}
