import 'dart:async';

import 'package:common_barkibu_dart/bloc/bloc.dart';
import 'package:common_barkibu_dart/domain/domain.dart';
import 'package:common_barkibu_dart/models/room_access.dart';
import 'package:common_barkibu_dart/services/twilio/twilio_message.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import '../../service_locator.dart' as test_service_locator;

class MockVideoChatUseCase extends Mock implements VideoChatUseCase {}

class ArticulatedError extends Error {
  final String message;

  ArticulatedError(this.message);

  @override
  String toString() {
    return message;
  }
}

class VideoStreamBlocSpy extends VideoStreamBloc {
  final List<VideoStreamEvent> events = [];
  VideoStreamBlocSpy(VideoChatUseCase videoChatUseCase, void Function(String roomSid) requestStreamSharing)
      : super(videoChatUseCase, requestStreamSharing);

  @override
  void add(VideoStreamEvent event) {
    events.add(event);
    super.add(event);
  }
}

class StubRequestStreamSharing implements Function {
  List<String> calls = [];

  void call(String roomSid) {
    calls.add(roomSid);
  }
}

class ThrowingRequestStreamSharing extends StubRequestStreamSharing {
  final Error error;

  ThrowingRequestStreamSharing(String message) : error = ArticulatedError(message);

  @override
  void call(String roomSid) {
    throw error;
  }
}

void main() {
  test_service_locator.ServiceLocator.setup();
  VideoStreamBloc videoStreamBloc;
  VideoChatUseCase _videoChatUseCase;
  StubRequestStreamSharing _requestStreamSharing;

  final startEvent = VideoStreamRequested();

  void _setup({VideoChatUseCase videoChatUseCase, StubRequestStreamSharing requestStreamSharing}) {
    _videoChatUseCase = videoChatUseCase ?? MockVideoChatUseCase();
    _requestStreamSharing = requestStreamSharing ?? StubRequestStreamSharing();
    videoStreamBloc = VideoStreamBlocSpy(_videoChatUseCase, _requestStreamSharing);
  }

  setUp(() {
    _setup();
  });

  tearDown(() {
    videoStreamBloc?.close();
  });

  group('When VideoChatUseCase fails', () {
    final reason = 'This feature is temporarly unavailable';
    setUp(() {
      when(_videoChatUseCase.getRoomAccess()).thenThrow(ArticulatedError(reason));
    });

    test('VideoStreamRequested updates the state with the error', () async {
      scheduleMicrotask(() {
        videoStreamBloc.add(startEvent);
      });

      await expectLater(
          videoStreamBloc,
          emitsInOrder([
            isA<VideoStreamInitial>(),
            isA<VideoStreamRoomRequestInProgress>(),
            isA<VideoStreamRoomRequestFailure>(),
          ]));

      expect((videoStreamBloc.state as VideoStreamRoomRequestFailure).reason, reason);
    });
  });

  group('When VideoChatUseCase is successful', () {
    final roomAccess = RoomAccess(accessToken: 'ejyXXXX', roomSid: 'BarkiRoom');
    setUp(() {
      when(_videoChatUseCase.getRoomAccess()).thenAnswer((_) => Future.value(roomAccess));
    });

    test('VideoStreamRequested fetches the RoomAccess and update the state', () async {
      scheduleMicrotask(() {
        videoStreamBloc.add(startEvent);
      });

      await expectLater(
          videoStreamBloc,
          emitsInOrder([
            isA<VideoStreamInitial>(),
            isA<VideoStreamRoomRequestInProgress>(),
            isA<VideoStreamRoomRequestSuccess>(),
            isA<VideoStreamCallRequestInProgress>(),
          ]));

      verify(_videoChatUseCase.getRoomAccess()).called(1);
    });

    test('VideoStreamRequested calls StreamSharing request', () async {
      scheduleMicrotask(() {
        videoStreamBloc.add(startEvent);
      });

      await expectLater(videoStreamBloc, emitsThrough(isA<VideoStreamCallRequestInProgress>()));
      expect(_requestStreamSharing.calls, [roomAccess.roomSid]);
    });

    group('With failing StreamSharing request', () {
      final reason = 'The Channel with the Vet is closed 😿!';
      setUp(() {
        _setup(requestStreamSharing: ThrowingRequestStreamSharing(reason));
        when(_videoChatUseCase.getRoomAccess()).thenAnswer((_) => Future.value(roomAccess));
      });

      test('VideoStreamRequested updates the state with the error', () async {
        scheduleMicrotask(() {
          videoStreamBloc.add(startEvent);
        });

        await expectLater(
            videoStreamBloc,
            emitsInOrder([
              isA<VideoStreamInitial>(),
              isA<VideoStreamRoomRequestInProgress>(),
              isA<VideoStreamRoomRequestSuccess>(),
              isA<VideoStreamRoomRequestFailure>(),
            ]));

        expect((videoStreamBloc.state as VideoStreamRoomRequestFailure).reason, reason);
      });
    });

    test('VideoStreamDeclined updates the state', () async {
      scheduleMicrotask(() {
        videoStreamBloc.add(startEvent);
        videoStreamBloc.add(VideoStreamDeclined(roomAccess.roomSid));
      });

      await expectLater(
          videoStreamBloc,
          emitsInOrder([
            isA<VideoStreamInitial>(),
            isA<VideoStreamRoomRequestInProgress>(),
            isA<VideoStreamRoomRequestSuccess>(),
            isA<VideoStreamCallRequestInProgress>(),
            isA<VideoStreamCallRequestFailure>(),
          ]));
    });

    test('VideoStreamDeclined is ignored if bloc has no Room bound', () async {
      scheduleMicrotask(() {
        videoStreamBloc.add(VideoStreamDeclined(roomAccess.roomSid));
        videoStreamBloc.close();
      });
      final states = await videoStreamBloc.toList();
      expect(states, [isA<VideoStreamInitial>()]);
    });

    test('VideoStreamAccepted is ignored if bloc has no Room bound', () async {
      scheduleMicrotask(() {
        videoStreamBloc.add(VideoStreamAccepted(roomAccess.roomSid));
        videoStreamBloc.close();
      });
      final states = await videoStreamBloc.toList();
      expect(states, [isA<VideoStreamInitial>()]);
    });

    test('VideoStreamAccepted is ignored if bloc has another Room bound', () async {
      scheduleMicrotask(() {
        videoStreamBloc.add(startEvent);
        videoStreamBloc.add(VideoStreamAccepted('AnotherRoomSid (for instance from the chat loaded previously)'));
        videoStreamBloc.close();
      });
      final states = await videoStreamBloc.toList();
      expect(states, [
        isA<VideoStreamInitial>(),
        isA<VideoStreamRoomRequestInProgress>(),
        isA<VideoStreamRoomRequestSuccess>(),
        isA<VideoStreamCallRequestInProgress>(),
      ]);
    });

    test('VideoStreamAccepted updates the state', () async {
      scheduleMicrotask(() {
        videoStreamBloc.add(startEvent);
        videoStreamBloc.add(VideoStreamAccepted(roomAccess.roomSid));
      });

      await expectLater(
          videoStreamBloc,
          emitsInOrder([
            isA<VideoStreamInitial>(),
            isA<VideoStreamRoomRequestInProgress>(),
            isA<VideoStreamRoomRequestSuccess>(),
            isA<VideoStreamCallRequestInProgress>(),
            isA<VideoStreamCallRequestSuccess>(),
          ]));
    });

    test('VideoStreamTerminated updates the state', () async {
      scheduleMicrotask(() {
        videoStreamBloc.add(startEvent);
        videoStreamBloc.add(VideoStreamAccepted(roomAccess.roomSid));
        videoStreamBloc.add(VideoStreamTerminated(roomAccess.roomSid));
      });

      await expectLater(
          videoStreamBloc,
          emitsInOrder([
            isA<VideoStreamInitial>(),
            isA<VideoStreamRoomRequestInProgress>(),
            isA<VideoStreamRoomRequestSuccess>(),
            isA<VideoStreamCallRequestInProgress>(),
            isA<VideoStreamCallRequestSuccess>(),
            isA<VideoStreamTerminateSuccess>(),
          ]));
    });

    test('VideoStreamTerminated is ignored if bloc has no Room bound', () async {
      scheduleMicrotask(() {
        videoStreamBloc.add(VideoStreamTerminated(roomAccess.roomSid));
        videoStreamBloc.close();
      });
      final states = await videoStreamBloc.toList();
      expect(states, [isA<VideoStreamInitial>()]);
    });
  });

  group('.onMessage', () {
    final roomSid = 'BarkiRoom';
    TwilioMessageBuilder messageBuilder;

    setUp(() {
      messageBuilder = TwilioMessage((b) => b
        ..index = 1
        ..me = false
        ..sid = 'IM_XXX'
        ..author = 'Vet John'
        ..body = 'Video Request response'
        ..attributes = {videoSharingKey: true, videoSharingRoomSidKey: roomSid}).toBuilder();
    });

    test('non video sharing messages are ignored', () {
      final nonVideoRelatedMessageBuilder = messageBuilder..attributes[videoSharingKey] = false;

      final eventsProcessedBefore = (videoStreamBloc as VideoStreamBlocSpy).events.length;
      videoStreamBloc.onMessage(nonVideoRelatedMessageBuilder.build());
      final eventsProcessedAfter = (videoStreamBloc as VideoStreamBlocSpy).events.length;

      expect(eventsProcessedAfter - eventsProcessedBefore, 0, reason: 'No new events processed');
    });

    test('Acceptance video sharing messages triggers VideoStreamAccepted event', () {
      final acceptanceMessageBuilder = messageBuilder..attributes[videoSharingStatusKey] = 'ACCEPTED';
      videoStreamBloc.onMessage(acceptanceMessageBuilder.build());

      expect(
          (videoStreamBloc as VideoStreamBlocSpy).events,
          contains(allOf(
            isA<VideoStreamAccepted>(),
            predicate((VideoStreamAccepted event) => event.roomSid == roomSid),
          )));
    });

    test('Declination video sharing messages triggers VideoStreamDeclined event', () {
      final declinationMessageBuilder = messageBuilder..attributes[videoSharingStatusKey] = 'DECLINED';
      videoStreamBloc.onMessage(declinationMessageBuilder.build());

      expect(
          (videoStreamBloc as VideoStreamBlocSpy).events,
          contains(allOf(
            isA<VideoStreamDeclined>(),
            predicate((VideoStreamDeclined event) => event.roomSid == roomSid),
          )));
    });

    test('Termination video sharing messages triggers VideoStreamTerminated event', () {
      final terminationMessageBuilder = messageBuilder..attributes[videoSharingStatusKey] = 'TERMINATED';
      videoStreamBloc.onMessage(terminationMessageBuilder.build());
      expect(
          (videoStreamBloc as VideoStreamBlocSpy).events,
          contains(allOf(
            isA<VideoStreamTerminated>(),
            predicate((VideoStreamTerminated event) => event.roomSid == roomSid),
          )));
    });

    group('VideoChatRoomStatus Screamable extension', () {
      test('VideoChatRoomStatus.requested is screamable', () {
        expect(VideoChatRoomStatus.requested.toScreamyString(), 'REQUESTED');
      });
      test('VideoChatRoomStatus.accepted is screamable', () {
        expect(VideoChatRoomStatus.accepted.toScreamyString(), 'ACCEPTED');
      });
      test('VideoChatRoomStatus.declined is screamable', () {
        expect(VideoChatRoomStatus.declined.toScreamyString(), 'DECLINED');
      });
      test('VideoChatRoomStatus.terminated is screamable', () {
        expect(VideoChatRoomStatus.terminated.toScreamyString(), 'TERMINATED');
      });
    });
  });
}
