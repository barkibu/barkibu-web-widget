import 'package:angular_router/angular_router.dart';
import 'package:mockito/mockito.dart';

class MockPlatformLocation extends Mock implements PlatformLocation {
  String _url;

  @override
  String get hash => '';
  @override
  String get pathname => _url ?? '';
  @override
  String get search => '';

  @override
  void pushState(state, String title, String url) => _url = url;
}

class MockRouter extends Mock implements Router {}
