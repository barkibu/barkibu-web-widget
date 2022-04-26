import 'package:angular/angular.dart';

@Component(selector: 'index', template: '<span>{{index}}</span>', styleUrls: ['index_component.css'])
class IndexComponent {
  @Input()
  int index;
}
