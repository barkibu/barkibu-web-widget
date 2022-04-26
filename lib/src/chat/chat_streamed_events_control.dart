import 'dart:async';
import 'package:angular/angular.dart';

class ChatStreamedEventsControls<T> implements OnDestroy {
  final controlEventsController = StreamController<T>();

  @Output()
  Stream<T> get controlEvents => controlEventsController.stream;

  @override
  void ngOnDestroy() {
    controlEventsController.close();
  }
}
