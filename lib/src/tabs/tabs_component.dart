import 'package:angular/angular.dart';
import 'package:web_widget/src/tabs/tab_component.dart';

export 'package:web_widget/src/tabs/tab_component.dart';

/*
  Example usage:
  <widget-tabs>
    <widget-tab label="tab1">Tab 1</widget-tab>
    <widget-tab label="tab2">Tab 2</widget-tab>
    <widget-tab label="tab3">Tab 3</widget-tab>
  </widget-tabs>
*/

@Component(
    selector: 'widget-tabs',
    templateUrl: 'tabs_component.html',
    styleUrls: ['tabs_component.css'],
    directives: [coreDirectives, TabComponent])
class TabsComponent implements AfterContentInit {
  @ContentChildren(TabComponent)
  List<TabComponent> tabs;

  @Input()
  bool showTabButtons = true;

  int activeTabIndex = 0;
  List<String> tabLabels = [];

  @override
  void ngAfterContentInit() {
    // initial tab activation
    setTabLabels();
    activateTabIndex(activeTabIndex);
  }

  void activateTabIndex(tabIndex) {
    activeTabIndex = tabIndex;
    var currentTabIndex = 0;
    for (var tab in tabs) {
      (currentTabIndex == activeTabIndex) ? tab.activate() : tab.deactivate();
      currentTabIndex++;
    }
  }

  void setTabLabels() {
    tabLabels = tabs.map((tab) => tab.label).toList();
  }

  bool isActive(index) {
    return activeTabIndex == index;
  }
}
