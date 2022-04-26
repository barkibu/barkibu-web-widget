import 'package:angular/angular.dart';

@Component(
  selector: 'export-icon',
  templateUrl: 'export_icon.html',
  styleUrls: ['export_icon.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class ExportIcon {
  @Input()
  String title;
}
