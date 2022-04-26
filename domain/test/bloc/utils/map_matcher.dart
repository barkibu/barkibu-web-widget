import 'package:test/test.dart';

Matcher mapContains(Map<String, dynamic> expected) {
  return predicate((map) {
    if (map is! Map) {
      return false;
    }
    var expectationPassed = true;
    expected.forEach((key, value) {
      if (value is Matcher) {
        if (!value.matches(map[key], {})) {
          expectationPassed = false;
        }
      } else if (map[key] != value) {
        expectationPassed = false;
      }
    });
    return expectationPassed;
  }, 'Message does not include: ${expected}');
}
