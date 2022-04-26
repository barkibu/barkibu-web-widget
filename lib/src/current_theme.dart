import 'package:web_widget/src/widget_configuration.dart';

class CurrentTheme {
  String currentTheme;

  CurrentTheme(WidgetConfiguration config) {
    currentTheme = config.theme;
  }

  bool isThemeActive(String _theme) {
    return currentTheme == _theme;
  }
}
