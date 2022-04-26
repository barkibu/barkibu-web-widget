import 'dart:async';
import 'package:angular/angular.dart';

@Component(selector: 'widget-tab', templateUrl: 'tab_component.html', directives: [
  coreDirectives,
])
class TabComponent {
  @HostBinding('attr.role')
  static const hostRole = 'tabpanel';
  final tabActivateEvents = StreamController();

  bool active = false;

  @Input()
  String label;

  @Output()
  Stream get onActivate => tabActivateEvents.stream;

  void activate() {
    tabActivateEvents.add(null);
    active = true;
  }

  void deactivate() {
    active = false;
  }
}
