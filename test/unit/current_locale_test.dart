@TestOn('browser')

import 'package:test/test.dart';
import 'package:web_widget/src/i18n/current_locale.dart';

void main() {
  group('CurrentLocale.build()', () {
    test('returns a valid locale when no locale is provided', () {
      expect(['en', 'es', 'de'], contains(CurrentLocale.build()));
    });

    test('returns es locale when es-MX locale is provided', () {
      expect(CurrentLocale.build('es-MX'), 'es');
    });

    test('returns es locale when es locale is provided', () {
      expect(CurrentLocale.build('es'), 'es');
    });

    test('returns es locale when es locale is provided', () {
      expect(CurrentLocale.build('de'), 'de');
    });

    test('returns en locale when en-GB locale is provided', () {
      expect(CurrentLocale.build('en-GB'), 'en');
    });

    test('returns en locale when ru-RU locale is provided', () {
      expect(CurrentLocale.build('ru-RU'), 'en');
    });

    test('returns de locale when de-DE locale is provided', () {
      expect(CurrentLocale.build('de-DE'), 'de');
    });
  });
}
