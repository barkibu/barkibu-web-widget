import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:web_widget/src/routes.dart';

@Component(
  selector: 'go-back',
  templateUrl: 'go_back_component.html',
  styleUrls: ['go_back_component.css'],
  directives: [coreDirectives, routerDirectives],
  exports: [RoutePaths],
)
class GoBackComponent implements OnDestroy {
  final MessagesModel messages;
  final buttonEventsController = StreamController();
  final Router _router;

  @Input()
  bool navigate = true;

  @Input()
  bool useBlackArrow = false;

  @Input()
  String path;

  @Input()
  String title;

  @Input()
  String subtitle;

  @Output()
  Stream get buttonEvents => buttonEventsController.stream;

  String get referer => _router.current != null ? _router.current.queryParameters['referer'] : null;

  GoBackComponent(this.messages, this._router);

  void goBackButtonClicked() {
    buttonEventsController.add(null);
  }

  @override
  void ngOnDestroy() {
    buttonEventsController.close();
  }
}
