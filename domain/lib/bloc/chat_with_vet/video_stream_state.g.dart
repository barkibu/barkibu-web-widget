// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_stream_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VideoStreamRoomRequestFailure extends VideoStreamRoomRequestFailure {
  @override
  final String reason;
  @override
  final RoomAccess roomAccess;

  factory _$VideoStreamRoomRequestFailure(
          [void Function(VideoStreamRoomRequestFailureBuilder) updates]) =>
      (new VideoStreamRoomRequestFailureBuilder()..update(updates)).build();

  _$VideoStreamRoomRequestFailure._({this.reason, this.roomAccess})
      : super._() {
    if (reason == null) {
      throw new BuiltValueNullFieldError(
          'VideoStreamRoomRequestFailure', 'reason');
    }
  }

  @override
  VideoStreamRoomRequestFailure rebuild(
          void Function(VideoStreamRoomRequestFailureBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoStreamRoomRequestFailureBuilder toBuilder() =>
      new VideoStreamRoomRequestFailureBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoStreamRoomRequestFailure &&
        reason == other.reason &&
        roomAccess == other.roomAccess;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, reason.hashCode), roomAccess.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VideoStreamRoomRequestFailure')
          ..add('reason', reason)
          ..add('roomAccess', roomAccess))
        .toString();
  }
}

class VideoStreamRoomRequestFailureBuilder
    implements
        Builder<VideoStreamRoomRequestFailure,
            VideoStreamRoomRequestFailureBuilder> {
  _$VideoStreamRoomRequestFailure _$v;

  String _reason;
  String get reason => _$this._reason;
  set reason(String reason) => _$this._reason = reason;

  RoomAccess _roomAccess;
  RoomAccess get roomAccess => _$this._roomAccess;
  set roomAccess(RoomAccess roomAccess) => _$this._roomAccess = roomAccess;

  VideoStreamRoomRequestFailureBuilder();

  VideoStreamRoomRequestFailureBuilder get _$this {
    if (_$v != null) {
      _reason = _$v.reason;
      _roomAccess = _$v.roomAccess;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoStreamRoomRequestFailure other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VideoStreamRoomRequestFailure;
  }

  @override
  void update(void Function(VideoStreamRoomRequestFailureBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VideoStreamRoomRequestFailure build() {
    final _$result = _$v ??
        new _$VideoStreamRoomRequestFailure._(
            reason: reason, roomAccess: roomAccess);
    replace(_$result);
    return _$result;
  }
}

class _$VideoStreamRoomRequestSuccess extends VideoStreamRoomRequestSuccess {
  @override
  final RoomAccess roomAccess;

  factory _$VideoStreamRoomRequestSuccess(
          [void Function(VideoStreamRoomRequestSuccessBuilder) updates]) =>
      (new VideoStreamRoomRequestSuccessBuilder()..update(updates)).build();

  _$VideoStreamRoomRequestSuccess._({this.roomAccess}) : super._();

  @override
  VideoStreamRoomRequestSuccess rebuild(
          void Function(VideoStreamRoomRequestSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoStreamRoomRequestSuccessBuilder toBuilder() =>
      new VideoStreamRoomRequestSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoStreamRoomRequestSuccess &&
        roomAccess == other.roomAccess;
  }

  @override
  int get hashCode {
    return $jf($jc(0, roomAccess.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VideoStreamRoomRequestSuccess')
          ..add('roomAccess', roomAccess))
        .toString();
  }
}

class VideoStreamRoomRequestSuccessBuilder
    implements
        Builder<VideoStreamRoomRequestSuccess,
            VideoStreamRoomRequestSuccessBuilder> {
  _$VideoStreamRoomRequestSuccess _$v;

  RoomAccess _roomAccess;
  RoomAccess get roomAccess => _$this._roomAccess;
  set roomAccess(RoomAccess roomAccess) => _$this._roomAccess = roomAccess;

  VideoStreamRoomRequestSuccessBuilder();

  VideoStreamRoomRequestSuccessBuilder get _$this {
    if (_$v != null) {
      _roomAccess = _$v.roomAccess;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoStreamRoomRequestSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VideoStreamRoomRequestSuccess;
  }

  @override
  void update(void Function(VideoStreamRoomRequestSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VideoStreamRoomRequestSuccess build() {
    final _$result =
        _$v ?? new _$VideoStreamRoomRequestSuccess._(roomAccess: roomAccess);
    replace(_$result);
    return _$result;
  }
}

class _$VideoStreamCallRequestInProgress
    extends VideoStreamCallRequestInProgress {
  @override
  final RoomAccess roomAccess;

  factory _$VideoStreamCallRequestInProgress(
          [void Function(VideoStreamCallRequestInProgressBuilder) updates]) =>
      (new VideoStreamCallRequestInProgressBuilder()..update(updates)).build();

  _$VideoStreamCallRequestInProgress._({this.roomAccess}) : super._();

  @override
  VideoStreamCallRequestInProgress rebuild(
          void Function(VideoStreamCallRequestInProgressBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoStreamCallRequestInProgressBuilder toBuilder() =>
      new VideoStreamCallRequestInProgressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoStreamCallRequestInProgress &&
        roomAccess == other.roomAccess;
  }

  @override
  int get hashCode {
    return $jf($jc(0, roomAccess.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VideoStreamCallRequestInProgress')
          ..add('roomAccess', roomAccess))
        .toString();
  }
}

class VideoStreamCallRequestInProgressBuilder
    implements
        Builder<VideoStreamCallRequestInProgress,
            VideoStreamCallRequestInProgressBuilder> {
  _$VideoStreamCallRequestInProgress _$v;

  RoomAccess _roomAccess;
  RoomAccess get roomAccess => _$this._roomAccess;
  set roomAccess(RoomAccess roomAccess) => _$this._roomAccess = roomAccess;

  VideoStreamCallRequestInProgressBuilder();

  VideoStreamCallRequestInProgressBuilder get _$this {
    if (_$v != null) {
      _roomAccess = _$v.roomAccess;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoStreamCallRequestInProgress other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VideoStreamCallRequestInProgress;
  }

  @override
  void update(void Function(VideoStreamCallRequestInProgressBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VideoStreamCallRequestInProgress build() {
    final _$result =
        _$v ?? new _$VideoStreamCallRequestInProgress._(roomAccess: roomAccess);
    replace(_$result);
    return _$result;
  }
}

class _$VideoStreamCallRequestSuccess extends VideoStreamCallRequestSuccess {
  @override
  final RoomAccess roomAccess;

  factory _$VideoStreamCallRequestSuccess(
          [void Function(VideoStreamCallRequestSuccessBuilder) updates]) =>
      (new VideoStreamCallRequestSuccessBuilder()..update(updates)).build();

  _$VideoStreamCallRequestSuccess._({this.roomAccess}) : super._();

  @override
  VideoStreamCallRequestSuccess rebuild(
          void Function(VideoStreamCallRequestSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoStreamCallRequestSuccessBuilder toBuilder() =>
      new VideoStreamCallRequestSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoStreamCallRequestSuccess &&
        roomAccess == other.roomAccess;
  }

  @override
  int get hashCode {
    return $jf($jc(0, roomAccess.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VideoStreamCallRequestSuccess')
          ..add('roomAccess', roomAccess))
        .toString();
  }
}

class VideoStreamCallRequestSuccessBuilder
    implements
        Builder<VideoStreamCallRequestSuccess,
            VideoStreamCallRequestSuccessBuilder> {
  _$VideoStreamCallRequestSuccess _$v;

  RoomAccess _roomAccess;
  RoomAccess get roomAccess => _$this._roomAccess;
  set roomAccess(RoomAccess roomAccess) => _$this._roomAccess = roomAccess;

  VideoStreamCallRequestSuccessBuilder();

  VideoStreamCallRequestSuccessBuilder get _$this {
    if (_$v != null) {
      _roomAccess = _$v.roomAccess;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoStreamCallRequestSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VideoStreamCallRequestSuccess;
  }

  @override
  void update(void Function(VideoStreamCallRequestSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VideoStreamCallRequestSuccess build() {
    final _$result =
        _$v ?? new _$VideoStreamCallRequestSuccess._(roomAccess: roomAccess);
    replace(_$result);
    return _$result;
  }
}

class _$VideoStreamCallRequestFailure extends VideoStreamCallRequestFailure {
  @override
  final RoomAccess roomAccess;

  factory _$VideoStreamCallRequestFailure(
          [void Function(VideoStreamCallRequestFailureBuilder) updates]) =>
      (new VideoStreamCallRequestFailureBuilder()..update(updates)).build();

  _$VideoStreamCallRequestFailure._({this.roomAccess}) : super._();

  @override
  VideoStreamCallRequestFailure rebuild(
          void Function(VideoStreamCallRequestFailureBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoStreamCallRequestFailureBuilder toBuilder() =>
      new VideoStreamCallRequestFailureBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoStreamCallRequestFailure &&
        roomAccess == other.roomAccess;
  }

  @override
  int get hashCode {
    return $jf($jc(0, roomAccess.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VideoStreamCallRequestFailure')
          ..add('roomAccess', roomAccess))
        .toString();
  }
}

class VideoStreamCallRequestFailureBuilder
    implements
        Builder<VideoStreamCallRequestFailure,
            VideoStreamCallRequestFailureBuilder> {
  _$VideoStreamCallRequestFailure _$v;

  RoomAccess _roomAccess;
  RoomAccess get roomAccess => _$this._roomAccess;
  set roomAccess(RoomAccess roomAccess) => _$this._roomAccess = roomAccess;

  VideoStreamCallRequestFailureBuilder();

  VideoStreamCallRequestFailureBuilder get _$this {
    if (_$v != null) {
      _roomAccess = _$v.roomAccess;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoStreamCallRequestFailure other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VideoStreamCallRequestFailure;
  }

  @override
  void update(void Function(VideoStreamCallRequestFailureBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VideoStreamCallRequestFailure build() {
    final _$result =
        _$v ?? new _$VideoStreamCallRequestFailure._(roomAccess: roomAccess);
    replace(_$result);
    return _$result;
  }
}

class _$VideoStreamTerminateSuccess extends VideoStreamTerminateSuccess {
  @override
  final RoomAccess roomAccess;

  factory _$VideoStreamTerminateSuccess(
          [void Function(VideoStreamTerminateSuccessBuilder) updates]) =>
      (new VideoStreamTerminateSuccessBuilder()..update(updates)).build();

  _$VideoStreamTerminateSuccess._({this.roomAccess}) : super._();

  @override
  VideoStreamTerminateSuccess rebuild(
          void Function(VideoStreamTerminateSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoStreamTerminateSuccessBuilder toBuilder() =>
      new VideoStreamTerminateSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoStreamTerminateSuccess &&
        roomAccess == other.roomAccess;
  }

  @override
  int get hashCode {
    return $jf($jc(0, roomAccess.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VideoStreamTerminateSuccess')
          ..add('roomAccess', roomAccess))
        .toString();
  }
}

class VideoStreamTerminateSuccessBuilder
    implements
        Builder<VideoStreamTerminateSuccess,
            VideoStreamTerminateSuccessBuilder> {
  _$VideoStreamTerminateSuccess _$v;

  RoomAccess _roomAccess;
  RoomAccess get roomAccess => _$this._roomAccess;
  set roomAccess(RoomAccess roomAccess) => _$this._roomAccess = roomAccess;

  VideoStreamTerminateSuccessBuilder();

  VideoStreamTerminateSuccessBuilder get _$this {
    if (_$v != null) {
      _roomAccess = _$v.roomAccess;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoStreamTerminateSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VideoStreamTerminateSuccess;
  }

  @override
  void update(void Function(VideoStreamTerminateSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VideoStreamTerminateSuccess build() {
    final _$result =
        _$v ?? new _$VideoStreamTerminateSuccess._(roomAccess: roomAccess);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
