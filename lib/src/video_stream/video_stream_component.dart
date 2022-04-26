import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:common_barkibu_dart/bloc/bloc.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:web_widget/src/bloc/chat/video_control_bloc.dart';
import 'package:web_widget/src/bloc/chat/video_control_event.dart';
import 'package:web_widget/src/bloc/chat/video_control_state.dart';
import 'package:web_widget/src/card/card_component.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/navigation/modal_component.dart';
import 'package:web_widget/src/navigation/spinner_component.dart';
import 'package:web_widget/src/widget_configuration.dart';

@Component(
  selector: 'video-stream',
  templateUrl: 'video_stream_component.html',
  styleUrls: ['video_stream_component.css'],
  providers: [],
  directives: [
    coreDirectives,
    layoutDirectives,
    CardComponent,
    SpinnerComponent,
    ModalComponent,
  ],
  pipes: [BlocPipe],
)
class VideoStreamComponent {
  final MessagesModel messages;
  final WidgetConfiguration config;
  final AnalyticsService analyticsService = ServiceLocator.container<AnalyticsService>();

  VideoControlBloc videoControlBloc;
  StreamSubscription _videoStreamBlocSubscription;

  @Input()
  VideoStreamBloc videoStreamBloc;

  VideoControlState videoControlState;
  VideoStreamState videoStreamState;

  VideoStreamComponent(this.messages, this.config);

  bool get isVideoStreamActive => videoControlState is! VideoControlInitial && videoControlState != null;
  bool get streamConnected => videoControlState is VideoControlConnected;
  bool get streamTerminated =>
      videoControlState is VideoControlTerminated || videoStreamState is VideoStreamCallRequestFailure;
  DivElement get videoStreamContainer => querySelector('#video-stream-container');

  void startVideoStream() async {
    logAskAVetVideoStartCall();
    await videoControlBloc?.close();
    videoControlBloc = VideoControlBloc(videoStreamBloc, videoStreamContainer);
    videoControlBloc.listen(videoControlBlocListener);
    _videoStreamBlocSubscription = videoStreamBloc.listen(videoStreamBlocListener);

    videoControlBloc.add(VideoControlStarted());
  }

  void videoControlBlocListener(VideoControlState state) {
    videoControlState = state;
  }

  void videoStreamBlocListener(VideoStreamState state) {
    videoStreamState = state;
  }

  void endCall() {
    logAskAVetVideoEndCall();
    videoControlBloc.add(VideoControlStreamTerminated());
  }

  void close() async {
    await _videoStreamBlocSubscription?.cancel();
    videoControlBloc.add(VideoControlClosed());
  }

  bool get isVideoSupported => config.isVideoSupported;

  void logAskAVetVideoStartCall() => analyticsService.event.askAVet.logAskAVetVideoStartCall();

  void logAskAVetVideoEndCall() => analyticsService.event.askAVet.logAskAVetVideoEndCall();
}
