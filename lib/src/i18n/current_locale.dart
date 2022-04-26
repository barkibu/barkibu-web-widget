import 'dart:html';

class CurrentLocale {
  static const knownLocales = ['es', 'en', 'de'];
  static const defaultLocale = 'en';

  static String build([String providedLocale]) {
    var currentLocaleCode = (providedLocale ?? window.navigator.language).substring(0, 2);
    if (CurrentLocale.knownLocales.contains(currentLocaleCode)) {
      return currentLocaleCode;
    } else {
      return defaultLocale;
    }
  }
}
