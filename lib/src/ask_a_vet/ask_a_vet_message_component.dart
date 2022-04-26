import 'dart:async';

import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/navigation/spinner_component.dart';
import 'package:web_widget/src/icons/icon_component.dart';
import 'package:web_widget/src/current_theme.dart';
import 'package:web_widget/src/widget_configuration.dart';

@Component(
    selector: 'ask-a-vet-message',
    templateUrl: 'ask_a_vet_message_component.html',
    directives: [coreDirectives, SpinnerComponent, IconComponent],
    styleUrls: ['ask_a_vet_message_component.css'])
class AskAVetMessageComponent extends CurrentTheme implements OnDestroy {
  final WidgetConfiguration config;
  final _mediaLoadedController = StreamController();
  final List<String> supportedImageExtensions = ['jpg', 'png', 'gif'];
  final List<String> supportedVideoExtensions = ['mp4'];

  @Output()
  Stream get onMediaLoaded => _mediaLoadedController.stream;

  bool get isImageMediaType {
    return supportedImageExtensions.contains(fileType) ? true : false;
  }

  bool get isVideoMediaType {
    return supportedVideoExtensions.contains(fileType) ? true : false;
  }

  bool get isAnotherType {
    return !isImageMediaType && !isVideoMediaType ? true : false;
  }

  @override
  void ngOnDestroy() {
    _mediaLoadedController.close();
  }

  @Input()
  SimpleChatMessage viewModel;

  @Input()
  bool showMessageSource;

  @Input()
  bool isMyMessage;

  @Input()
  bool isPending;

  final MessagesModel messages;

  AskAVetMessageComponent(this.messages, this.config) : super(config);

  String messageCssClass() {
    return isMyMessage ? 'sent' : 'received';
  }

  String get appName => config.appName;

  bool get hasMediaAttachment => isPendingMediaMessage || isSentMediaMessage;
  bool get isPendingMediaMessage => viewModel is SendingChatMediaMessage;
  bool get isSentMediaMessage => viewModel is TwilioMessage && mediaUrl != null;

  String get mediaUrl => (viewModel as TwilioMessage).mediaFileUrl;

  String get fileType {
    return fileName.split('.').last;
  }

  String get fileName {
    return (viewModel as TwilioMessage).attributes['tmp_id'].toString();
  }

  void notifyMediaLoaded() => _mediaLoadedController.add(null);
}
