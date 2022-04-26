import 'dart:async';
import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:web_widget/src/navigation/modal_component.dart';
import 'package:web_widget/src/routes.dart';

import 'dart:html';

@Component(
    selector: 'confirmation-modal',
    templateUrl: 'confirmation_modal_component.html',
    styleUrls: ['confirmation_modal_component.css'],
    directives: [coreDirectives, ModalComponent],
    exports: [RoutePaths])
class ConfirmationModalComponent implements OnDestroy, OnInit {
  final MessagesModel messages;
  final Element element;
  final _confirmEventsController = StreamController();
  final _cancelEventsController = StreamController();

  @Input()
  String title;

  @Input()
  String description;

  @Input()
  String confirmText;
  String get modalConfirmText => confirmText ?? messages.sharedMessages.yes;

  @Input()
  String cancelText;
  String get modalCancelText => cancelText ?? messages.sharedMessages.no;

  @Output()
  Stream get onConfirmed => _confirmEventsController.stream;

  @Output()
  Stream get onCanceled => _cancelEventsController.stream;

  ConfirmationModalComponent(this.messages, this.element);

  void cancel() {
    _cancelEventsController.add(null);
  }

  void confirm() {
    _confirmEventsController.add(null);
  }

  @override
  void ngOnDestroy() {
    _confirmEventsController.close();
    _cancelEventsController.close();
  }

  @override
  void ngOnInit() {
    element.querySelector('.confirm').focus();
  }
}
