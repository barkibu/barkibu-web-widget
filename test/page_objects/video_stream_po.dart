import 'package:pageloader/html.dart';

part 'video_stream_po.g.dart';

@PageObject()
@CheckTag('video-stream')
abstract class VideoStreamPO {
  VideoStreamPO();
  factory VideoStreamPO.create(PageLoaderElement context) = $VideoStreamPO.create;
  factory VideoStreamPO.lookup(PageLoaderSource context) = $VideoStreamPO.lookup;

  @ById('video-stream-button')
  PageLoaderElement get _startVideoStreamButton;

  @ById('video-stream-modal')
  PageLoaderElement get _videoStreamModal;

  @ById('modal_title')
  PageLoaderElement get _modalTitle;

  @ById('modal_description')
  PageLoaderElement get _modalDescription;

  @ById('video-stream-container')
  PageLoaderElement get _videoStreamContainer;

  void requestVideoStream() async {
    await _startVideoStreamButton.click();
  }

  List<String> modalClasses() {
    return _videoStreamModal.classes;
  }

  String modalTitle() {
    return _modalTitle.innerText;
  }

  String streamStatus() {
    return _modalDescription.innerText;
  }

  bool streamContains(String stringyfiedTag) {
    return _videoStreamContainer.toString().contains(stringyfiedTag);
  }
}
