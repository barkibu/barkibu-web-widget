import 'dart:html';
import 'package:common_barkibu_dart/services/navigation_service.dart';

class BrowserNavigationService implements NavigationService {
  @override
  void launchUrl(String url) {
    window.open(url, '_blank');
  }
}
