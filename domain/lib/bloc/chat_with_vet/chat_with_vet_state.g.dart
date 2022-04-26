// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_with_vet_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChatWithVetAvailabilityCheckInProgress>
    _$chatWithVetAvailabilityCheckInProgressSerializer =
    new _$ChatWithVetAvailabilityCheckInProgressSerializer();
Serializer<ChatWithVetAvailabilityCheckFailure>
    _$chatWithVetAvailabilityCheckFailureSerializer =
    new _$ChatWithVetAvailabilityCheckFailureSerializer();
Serializer<ChatWithVetAvailabilityCheckSuccess>
    _$chatWithVetAvailabilityCheckSuccessSerializer =
    new _$ChatWithVetAvailabilityCheckSuccessSerializer();
Serializer<ChatWithVetListenerBindInProgress>
    _$chatWithVetListenerBindInProgressSerializer =
    new _$ChatWithVetListenerBindInProgressSerializer();
Serializer<ChatWithVetListenerBindFailure>
    _$chatWithVetListenerBindFailureSerializer =
    new _$ChatWithVetListenerBindFailureSerializer();
Serializer<ChatWithVetConnectSuccess> _$chatWithVetConnectSuccessSerializer =
    new _$ChatWithVetConnectSuccessSerializer();
Serializer<ChatWithVetTerminateSuccess>
    _$chatWithVetTerminateSuccessSerializer =
    new _$ChatWithVetTerminateSuccessSerializer();

class _$ChatWithVetAvailabilityCheckInProgressSerializer
    implements StructuredSerializer<ChatWithVetAvailabilityCheckInProgress> {
  @override
  final Iterable<Type> types = const [
    ChatWithVetAvailabilityCheckInProgress,
    _$ChatWithVetAvailabilityCheckInProgress
  ];
  @override
  final String wireName = 'ChatWithVetAvailabilityCheckInProgress';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ChatWithVetAvailabilityCheckInProgress object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  ChatWithVetAvailabilityCheckInProgress deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new ChatWithVetAvailabilityCheckInProgressBuilder().build();
  }
}

class _$ChatWithVetAvailabilityCheckFailureSerializer
    implements StructuredSerializer<ChatWithVetAvailabilityCheckFailure> {
  @override
  final Iterable<Type> types = const [
    ChatWithVetAvailabilityCheckFailure,
    _$ChatWithVetAvailabilityCheckFailure
  ];
  @override
  final String wireName = 'ChatWithVetAvailabilityCheckFailure';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ChatWithVetAvailabilityCheckFailure object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'connectionStatus',
      serializers.serialize(object.connectionStatus,
          specifiedType: const FullType(TwilioConnectionStatus)),
    ];

    return result;
  }

  @override
  ChatWithVetAvailabilityCheckFailure deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatWithVetAvailabilityCheckFailureBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'connectionStatus':
          result.connectionStatus = serializers.deserialize(value,
                  specifiedType: const FullType(TwilioConnectionStatus))
              as TwilioConnectionStatus;
          break;
      }
    }

    return result.build();
  }
}

class _$ChatWithVetAvailabilityCheckSuccessSerializer
    implements StructuredSerializer<ChatWithVetAvailabilityCheckSuccess> {
  @override
  final Iterable<Type> types = const [
    ChatWithVetAvailabilityCheckSuccess,
    _$ChatWithVetAvailabilityCheckSuccess
  ];
  @override
  final String wireName = 'ChatWithVetAvailabilityCheckSuccess';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ChatWithVetAvailabilityCheckSuccess object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'channelSid',
      serializers.serialize(object.channelSid,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ChatWithVetAvailabilityCheckSuccess deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatWithVetAvailabilityCheckSuccessBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'channelSid':
          result.channelSid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ChatWithVetListenerBindInProgressSerializer
    implements StructuredSerializer<ChatWithVetListenerBindInProgress> {
  @override
  final Iterable<Type> types = const [
    ChatWithVetListenerBindInProgress,
    _$ChatWithVetListenerBindInProgress
  ];
  @override
  final String wireName = 'ChatWithVetListenerBindInProgress';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ChatWithVetListenerBindInProgress object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'channelSid',
      serializers.serialize(object.channelSid,
          specifiedType: const FullType(String)),
      'chatService',
      serializers.serialize(object.chatService,
          specifiedType: const FullType(TwilioChatService)),
    ];

    return result;
  }

  @override
  ChatWithVetListenerBindInProgress deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatWithVetListenerBindInProgressBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'channelSid':
          result.channelSid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'chatService':
          result.chatService = serializers.deserialize(value,
                  specifiedType: const FullType(TwilioChatService))
              as TwilioChatService;
          break;
      }
    }

    return result.build();
  }
}

class _$ChatWithVetListenerBindFailureSerializer
    implements StructuredSerializer<ChatWithVetListenerBindFailure> {
  @override
  final Iterable<Type> types = const [
    ChatWithVetListenerBindFailure,
    _$ChatWithVetListenerBindFailure
  ];
  @override
  final String wireName = 'ChatWithVetListenerBindFailure';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ChatWithVetListenerBindFailure object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(ChatWithVetFailureStatus)),
    ];
    if (object.details != null) {
      result
        ..add('details')
        ..add(serializers.serialize(object.details,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ChatWithVetListenerBindFailure deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatWithVetListenerBindFailureBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
                  specifiedType: const FullType(ChatWithVetFailureStatus))
              as ChatWithVetFailureStatus;
          break;
        case 'details':
          result.details = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ChatWithVetConnectSuccessSerializer
    implements StructuredSerializer<ChatWithVetConnectSuccess> {
  @override
  final Iterable<Type> types = const [
    ChatWithVetConnectSuccess,
    _$ChatWithVetConnectSuccess
  ];
  @override
  final String wireName = 'ChatWithVetConnectSuccess';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ChatWithVetConnectSuccess object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'channelSid',
      serializers.serialize(object.channelSid,
          specifiedType: const FullType(String)),
      'chatService',
      serializers.serialize(object.chatService,
          specifiedType: const FullType(TwilioChatService)),
      'members',
      serializers.serialize(object.members,
          specifiedType:
              const FullType(List, const [const FullType(TwilioMember)])),
      'messages',
      serializers.serialize(object.messages,
          specifiedType:
              const FullType(List, const [const FullType(TwilioMessage)])),
      'pendingMessages',
      serializers.serialize(object.pendingMessages,
          specifiedType:
              const FullType(List, const [const FullType(SimpleChatMessage)])),
      'typingMembers',
      serializers.serialize(object.typingMembers,
          specifiedType:
              const FullType(List, const [const FullType(TwilioMember)])),
    ];

    return result;
  }

  @override
  ChatWithVetConnectSuccess deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatWithVetConnectSuccessBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'channelSid':
          result.channelSid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'chatService':
          result.chatService = serializers.deserialize(value,
                  specifiedType: const FullType(TwilioChatService))
              as TwilioChatService;
          break;
        case 'members':
          result.members = serializers.deserialize(value,
                  specifiedType: const FullType(
                      List, const [const FullType(TwilioMember)]))
              as List<TwilioMember>;
          break;
        case 'messages':
          result.messages = serializers.deserialize(value,
                  specifiedType: const FullType(
                      List, const [const FullType(TwilioMessage)]))
              as List<TwilioMessage>;
          break;
        case 'pendingMessages':
          result.pendingMessages = serializers.deserialize(value,
                  specifiedType: const FullType(
                      List, const [const FullType(SimpleChatMessage)]))
              as List<SimpleChatMessage>;
          break;
        case 'typingMembers':
          result.typingMembers = serializers.deserialize(value,
                  specifiedType: const FullType(
                      List, const [const FullType(TwilioMember)]))
              as List<TwilioMember>;
          break;
      }
    }

    return result.build();
  }
}

class _$ChatWithVetTerminateSuccessSerializer
    implements StructuredSerializer<ChatWithVetTerminateSuccess> {
  @override
  final Iterable<Type> types = const [
    ChatWithVetTerminateSuccess,
    _$ChatWithVetTerminateSuccess
  ];
  @override
  final String wireName = 'ChatWithVetTerminateSuccess';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ChatWithVetTerminateSuccess object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'messages',
      serializers.serialize(object.messages,
          specifiedType:
              const FullType(List, const [const FullType(TwilioMessage)])),
      'afterTerminateMessages',
      serializers.serialize(object.afterTerminateMessages,
          specifiedType:
              const FullType(List, const [const FullType(ChatViewModel)])),
    ];
    if (object.channelSid != null) {
      result
        ..add('channelSid')
        ..add(serializers.serialize(object.channelSid,
            specifiedType: const FullType(String)));
    }
    if (object.afterTerminateInput != null) {
      result
        ..add('afterTerminateInput')
        ..add(serializers.serialize(object.afterTerminateInput,
            specifiedType: const FullType(ChatViewModel)));
    }
    return result;
  }

  @override
  ChatWithVetTerminateSuccess deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatWithVetTerminateSuccessBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'channelSid':
          result.channelSid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'messages':
          result.messages = serializers.deserialize(value,
                  specifiedType: const FullType(
                      List, const [const FullType(TwilioMessage)]))
              as List<TwilioMessage>;
          break;
        case 'afterTerminateMessages':
          result.afterTerminateMessages = serializers.deserialize(value,
                  specifiedType: const FullType(
                      List, const [const FullType(ChatViewModel)]))
              as List<ChatViewModel>;
          break;
        case 'afterTerminateInput':
          result.afterTerminateInput = serializers.deserialize(value,
              specifiedType: const FullType(ChatViewModel)) as ChatViewModel;
          break;
      }
    }

    return result.build();
  }
}

class _$ChatWithVetAvailabilityCheckInProgress
    extends ChatWithVetAvailabilityCheckInProgress {
  factory _$ChatWithVetAvailabilityCheckInProgress(
          [void Function(ChatWithVetAvailabilityCheckInProgressBuilder)
              updates]) =>
      (new ChatWithVetAvailabilityCheckInProgressBuilder()..update(updates))
          .build();

  _$ChatWithVetAvailabilityCheckInProgress._() : super._();

  @override
  ChatWithVetAvailabilityCheckInProgress rebuild(
          void Function(ChatWithVetAvailabilityCheckInProgressBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatWithVetAvailabilityCheckInProgressBuilder toBuilder() =>
      new ChatWithVetAvailabilityCheckInProgressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatWithVetAvailabilityCheckInProgress;
  }

  @override
  int get hashCode {
    return 573047309;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ChatWithVetAvailabilityCheckInProgress')
        .toString();
  }
}

class ChatWithVetAvailabilityCheckInProgressBuilder
    implements
        Builder<ChatWithVetAvailabilityCheckInProgress,
            ChatWithVetAvailabilityCheckInProgressBuilder> {
  _$ChatWithVetAvailabilityCheckInProgress _$v;

  ChatWithVetAvailabilityCheckInProgressBuilder();

  @override
  void replace(ChatWithVetAvailabilityCheckInProgress other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChatWithVetAvailabilityCheckInProgress;
  }

  @override
  void update(
      void Function(ChatWithVetAvailabilityCheckInProgressBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatWithVetAvailabilityCheckInProgress build() {
    final _$result = _$v ?? new _$ChatWithVetAvailabilityCheckInProgress._();
    replace(_$result);
    return _$result;
  }
}

class _$ChatWithVetAvailabilityCheckFailure
    extends ChatWithVetAvailabilityCheckFailure {
  @override
  final TwilioConnectionStatus connectionStatus;

  factory _$ChatWithVetAvailabilityCheckFailure(
          [void Function(ChatWithVetAvailabilityCheckFailureBuilder)
              updates]) =>
      (new ChatWithVetAvailabilityCheckFailureBuilder()..update(updates))
          .build();

  _$ChatWithVetAvailabilityCheckFailure._({this.connectionStatus}) : super._() {
    if (connectionStatus == null) {
      throw new BuiltValueNullFieldError(
          'ChatWithVetAvailabilityCheckFailure', 'connectionStatus');
    }
  }

  @override
  ChatWithVetAvailabilityCheckFailure rebuild(
          void Function(ChatWithVetAvailabilityCheckFailureBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatWithVetAvailabilityCheckFailureBuilder toBuilder() =>
      new ChatWithVetAvailabilityCheckFailureBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatWithVetAvailabilityCheckFailure &&
        connectionStatus == other.connectionStatus;
  }

  @override
  int get hashCode {
    return $jf($jc(0, connectionStatus.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatWithVetAvailabilityCheckFailure')
          ..add('connectionStatus', connectionStatus))
        .toString();
  }
}

class ChatWithVetAvailabilityCheckFailureBuilder
    implements
        Builder<ChatWithVetAvailabilityCheckFailure,
            ChatWithVetAvailabilityCheckFailureBuilder> {
  _$ChatWithVetAvailabilityCheckFailure _$v;

  TwilioConnectionStatus _connectionStatus;
  TwilioConnectionStatus get connectionStatus => _$this._connectionStatus;
  set connectionStatus(TwilioConnectionStatus connectionStatus) =>
      _$this._connectionStatus = connectionStatus;

  ChatWithVetAvailabilityCheckFailureBuilder();

  ChatWithVetAvailabilityCheckFailureBuilder get _$this {
    if (_$v != null) {
      _connectionStatus = _$v.connectionStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatWithVetAvailabilityCheckFailure other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChatWithVetAvailabilityCheckFailure;
  }

  @override
  void update(
      void Function(ChatWithVetAvailabilityCheckFailureBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatWithVetAvailabilityCheckFailure build() {
    final _$result = _$v ??
        new _$ChatWithVetAvailabilityCheckFailure._(
            connectionStatus: connectionStatus);
    replace(_$result);
    return _$result;
  }
}

class _$ChatWithVetAvailabilityCheckSuccess
    extends ChatWithVetAvailabilityCheckSuccess {
  @override
  final String channelSid;

  factory _$ChatWithVetAvailabilityCheckSuccess(
          [void Function(ChatWithVetAvailabilityCheckSuccessBuilder)
              updates]) =>
      (new ChatWithVetAvailabilityCheckSuccessBuilder()..update(updates))
          .build();

  _$ChatWithVetAvailabilityCheckSuccess._({this.channelSid}) : super._() {
    if (channelSid == null) {
      throw new BuiltValueNullFieldError(
          'ChatWithVetAvailabilityCheckSuccess', 'channelSid');
    }
  }

  @override
  ChatWithVetAvailabilityCheckSuccess rebuild(
          void Function(ChatWithVetAvailabilityCheckSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatWithVetAvailabilityCheckSuccessBuilder toBuilder() =>
      new ChatWithVetAvailabilityCheckSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatWithVetAvailabilityCheckSuccess &&
        channelSid == other.channelSid;
  }

  @override
  int get hashCode {
    return $jf($jc(0, channelSid.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatWithVetAvailabilityCheckSuccess')
          ..add('channelSid', channelSid))
        .toString();
  }
}

class ChatWithVetAvailabilityCheckSuccessBuilder
    implements
        Builder<ChatWithVetAvailabilityCheckSuccess,
            ChatWithVetAvailabilityCheckSuccessBuilder> {
  _$ChatWithVetAvailabilityCheckSuccess _$v;

  String _channelSid;
  String get channelSid => _$this._channelSid;
  set channelSid(String channelSid) => _$this._channelSid = channelSid;

  ChatWithVetAvailabilityCheckSuccessBuilder();

  ChatWithVetAvailabilityCheckSuccessBuilder get _$this {
    if (_$v != null) {
      _channelSid = _$v.channelSid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatWithVetAvailabilityCheckSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChatWithVetAvailabilityCheckSuccess;
  }

  @override
  void update(
      void Function(ChatWithVetAvailabilityCheckSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatWithVetAvailabilityCheckSuccess build() {
    final _$result = _$v ??
        new _$ChatWithVetAvailabilityCheckSuccess._(channelSid: channelSid);
    replace(_$result);
    return _$result;
  }
}

class _$ChatWithVetListenerBindInProgress
    extends ChatWithVetListenerBindInProgress {
  @override
  final String channelSid;
  @override
  final TwilioChatService chatService;

  factory _$ChatWithVetListenerBindInProgress(
          [void Function(ChatWithVetListenerBindInProgressBuilder) updates]) =>
      (new ChatWithVetListenerBindInProgressBuilder()..update(updates)).build();

  _$ChatWithVetListenerBindInProgress._({this.channelSid, this.chatService})
      : super._() {
    if (channelSid == null) {
      throw new BuiltValueNullFieldError(
          'ChatWithVetListenerBindInProgress', 'channelSid');
    }
    if (chatService == null) {
      throw new BuiltValueNullFieldError(
          'ChatWithVetListenerBindInProgress', 'chatService');
    }
  }

  @override
  ChatWithVetListenerBindInProgress rebuild(
          void Function(ChatWithVetListenerBindInProgressBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatWithVetListenerBindInProgressBuilder toBuilder() =>
      new ChatWithVetListenerBindInProgressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatWithVetListenerBindInProgress &&
        channelSid == other.channelSid &&
        chatService == other.chatService;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, channelSid.hashCode), chatService.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatWithVetListenerBindInProgress')
          ..add('channelSid', channelSid)
          ..add('chatService', chatService))
        .toString();
  }
}

class ChatWithVetListenerBindInProgressBuilder
    implements
        Builder<ChatWithVetListenerBindInProgress,
            ChatWithVetListenerBindInProgressBuilder> {
  _$ChatWithVetListenerBindInProgress _$v;

  String _channelSid;
  String get channelSid => _$this._channelSid;
  set channelSid(String channelSid) => _$this._channelSid = channelSid;

  TwilioChatService _chatService;
  TwilioChatService get chatService => _$this._chatService;
  set chatService(TwilioChatService chatService) =>
      _$this._chatService = chatService;

  ChatWithVetListenerBindInProgressBuilder();

  ChatWithVetListenerBindInProgressBuilder get _$this {
    if (_$v != null) {
      _channelSid = _$v.channelSid;
      _chatService = _$v.chatService;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatWithVetListenerBindInProgress other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChatWithVetListenerBindInProgress;
  }

  @override
  void update(void Function(ChatWithVetListenerBindInProgressBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatWithVetListenerBindInProgress build() {
    final _$result = _$v ??
        new _$ChatWithVetListenerBindInProgress._(
            channelSid: channelSid, chatService: chatService);
    replace(_$result);
    return _$result;
  }
}

class _$ChatWithVetListenerBindFailure extends ChatWithVetListenerBindFailure {
  @override
  final ChatWithVetFailureStatus status;
  @override
  final String details;

  factory _$ChatWithVetListenerBindFailure(
          [void Function(ChatWithVetListenerBindFailureBuilder) updates]) =>
      (new ChatWithVetListenerBindFailureBuilder()..update(updates)).build();

  _$ChatWithVetListenerBindFailure._({this.status, this.details}) : super._() {
    if (status == null) {
      throw new BuiltValueNullFieldError(
          'ChatWithVetListenerBindFailure', 'status');
    }
  }

  @override
  ChatWithVetListenerBindFailure rebuild(
          void Function(ChatWithVetListenerBindFailureBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatWithVetListenerBindFailureBuilder toBuilder() =>
      new ChatWithVetListenerBindFailureBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatWithVetListenerBindFailure &&
        status == other.status &&
        details == other.details;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, status.hashCode), details.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatWithVetListenerBindFailure')
          ..add('status', status)
          ..add('details', details))
        .toString();
  }
}

class ChatWithVetListenerBindFailureBuilder
    implements
        Builder<ChatWithVetListenerBindFailure,
            ChatWithVetListenerBindFailureBuilder> {
  _$ChatWithVetListenerBindFailure _$v;

  ChatWithVetFailureStatus _status;
  ChatWithVetFailureStatus get status => _$this._status;
  set status(ChatWithVetFailureStatus status) => _$this._status = status;

  String _details;
  String get details => _$this._details;
  set details(String details) => _$this._details = details;

  ChatWithVetListenerBindFailureBuilder();

  ChatWithVetListenerBindFailureBuilder get _$this {
    if (_$v != null) {
      _status = _$v.status;
      _details = _$v.details;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatWithVetListenerBindFailure other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChatWithVetListenerBindFailure;
  }

  @override
  void update(void Function(ChatWithVetListenerBindFailureBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatWithVetListenerBindFailure build() {
    final _$result = _$v ??
        new _$ChatWithVetListenerBindFailure._(
            status: status, details: details);
    replace(_$result);
    return _$result;
  }
}

class _$ChatWithVetConnectSuccess extends ChatWithVetConnectSuccess {
  @override
  final String channelSid;
  @override
  final TwilioChatService chatService;
  @override
  final List<TwilioMember> members;
  @override
  final List<TwilioMessage> messages;
  @override
  final List<SimpleChatMessage> pendingMessages;
  @override
  final List<TwilioMember> typingMembers;

  factory _$ChatWithVetConnectSuccess(
          [void Function(ChatWithVetConnectSuccessBuilder) updates]) =>
      (new ChatWithVetConnectSuccessBuilder()..update(updates)).build();

  _$ChatWithVetConnectSuccess._(
      {this.channelSid,
      this.chatService,
      this.members,
      this.messages,
      this.pendingMessages,
      this.typingMembers})
      : super._() {
    if (channelSid == null) {
      throw new BuiltValueNullFieldError(
          'ChatWithVetConnectSuccess', 'channelSid');
    }
    if (chatService == null) {
      throw new BuiltValueNullFieldError(
          'ChatWithVetConnectSuccess', 'chatService');
    }
    if (members == null) {
      throw new BuiltValueNullFieldError(
          'ChatWithVetConnectSuccess', 'members');
    }
    if (messages == null) {
      throw new BuiltValueNullFieldError(
          'ChatWithVetConnectSuccess', 'messages');
    }
    if (pendingMessages == null) {
      throw new BuiltValueNullFieldError(
          'ChatWithVetConnectSuccess', 'pendingMessages');
    }
    if (typingMembers == null) {
      throw new BuiltValueNullFieldError(
          'ChatWithVetConnectSuccess', 'typingMembers');
    }
  }

  @override
  ChatWithVetConnectSuccess rebuild(
          void Function(ChatWithVetConnectSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatWithVetConnectSuccessBuilder toBuilder() =>
      new ChatWithVetConnectSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatWithVetConnectSuccess &&
        channelSid == other.channelSid &&
        chatService == other.chatService &&
        members == other.members &&
        messages == other.messages &&
        pendingMessages == other.pendingMessages &&
        typingMembers == other.typingMembers;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, channelSid.hashCode), chatService.hashCode),
                    members.hashCode),
                messages.hashCode),
            pendingMessages.hashCode),
        typingMembers.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatWithVetConnectSuccess')
          ..add('channelSid', channelSid)
          ..add('chatService', chatService)
          ..add('members', members)
          ..add('messages', messages)
          ..add('pendingMessages', pendingMessages)
          ..add('typingMembers', typingMembers))
        .toString();
  }
}

class ChatWithVetConnectSuccessBuilder
    implements
        Builder<ChatWithVetConnectSuccess, ChatWithVetConnectSuccessBuilder> {
  _$ChatWithVetConnectSuccess _$v;

  String _channelSid;
  String get channelSid => _$this._channelSid;
  set channelSid(String channelSid) => _$this._channelSid = channelSid;

  TwilioChatService _chatService;
  TwilioChatService get chatService => _$this._chatService;
  set chatService(TwilioChatService chatService) =>
      _$this._chatService = chatService;

  List<TwilioMember> _members;
  List<TwilioMember> get members => _$this._members;
  set members(List<TwilioMember> members) => _$this._members = members;

  List<TwilioMessage> _messages;
  List<TwilioMessage> get messages => _$this._messages;
  set messages(List<TwilioMessage> messages) => _$this._messages = messages;

  List<SimpleChatMessage> _pendingMessages;
  List<SimpleChatMessage> get pendingMessages => _$this._pendingMessages;
  set pendingMessages(List<SimpleChatMessage> pendingMessages) =>
      _$this._pendingMessages = pendingMessages;

  List<TwilioMember> _typingMembers;
  List<TwilioMember> get typingMembers => _$this._typingMembers;
  set typingMembers(List<TwilioMember> typingMembers) =>
      _$this._typingMembers = typingMembers;

  ChatWithVetConnectSuccessBuilder() {
    ChatWithVetConnectSuccess._initializeBuilder(this);
  }

  ChatWithVetConnectSuccessBuilder get _$this {
    if (_$v != null) {
      _channelSid = _$v.channelSid;
      _chatService = _$v.chatService;
      _members = _$v.members;
      _messages = _$v.messages;
      _pendingMessages = _$v.pendingMessages;
      _typingMembers = _$v.typingMembers;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatWithVetConnectSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChatWithVetConnectSuccess;
  }

  @override
  void update(void Function(ChatWithVetConnectSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatWithVetConnectSuccess build() {
    final _$result = _$v ??
        new _$ChatWithVetConnectSuccess._(
            channelSid: channelSid,
            chatService: chatService,
            members: members,
            messages: messages,
            pendingMessages: pendingMessages,
            typingMembers: typingMembers);
    replace(_$result);
    return _$result;
  }
}

class _$ChatWithVetTerminateSuccess extends ChatWithVetTerminateSuccess {
  @override
  final String channelSid;
  @override
  final List<TwilioMessage> messages;
  @override
  final List<ChatViewModel> afterTerminateMessages;
  @override
  final ChatViewModel afterTerminateInput;

  factory _$ChatWithVetTerminateSuccess(
          [void Function(ChatWithVetTerminateSuccessBuilder) updates]) =>
      (new ChatWithVetTerminateSuccessBuilder()..update(updates)).build();

  _$ChatWithVetTerminateSuccess._(
      {this.channelSid,
      this.messages,
      this.afterTerminateMessages,
      this.afterTerminateInput})
      : super._() {
    if (messages == null) {
      throw new BuiltValueNullFieldError(
          'ChatWithVetTerminateSuccess', 'messages');
    }
    if (afterTerminateMessages == null) {
      throw new BuiltValueNullFieldError(
          'ChatWithVetTerminateSuccess', 'afterTerminateMessages');
    }
  }

  @override
  ChatWithVetTerminateSuccess rebuild(
          void Function(ChatWithVetTerminateSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatWithVetTerminateSuccessBuilder toBuilder() =>
      new ChatWithVetTerminateSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatWithVetTerminateSuccess &&
        channelSid == other.channelSid &&
        messages == other.messages &&
        afterTerminateMessages == other.afterTerminateMessages &&
        afterTerminateInput == other.afterTerminateInput;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, channelSid.hashCode), messages.hashCode),
            afterTerminateMessages.hashCode),
        afterTerminateInput.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatWithVetTerminateSuccess')
          ..add('channelSid', channelSid)
          ..add('messages', messages)
          ..add('afterTerminateMessages', afterTerminateMessages)
          ..add('afterTerminateInput', afterTerminateInput))
        .toString();
  }
}

class ChatWithVetTerminateSuccessBuilder
    implements
        Builder<ChatWithVetTerminateSuccess,
            ChatWithVetTerminateSuccessBuilder> {
  _$ChatWithVetTerminateSuccess _$v;

  String _channelSid;
  String get channelSid => _$this._channelSid;
  set channelSid(String channelSid) => _$this._channelSid = channelSid;

  List<TwilioMessage> _messages;
  List<TwilioMessage> get messages => _$this._messages;
  set messages(List<TwilioMessage> messages) => _$this._messages = messages;

  List<ChatViewModel> _afterTerminateMessages;
  List<ChatViewModel> get afterTerminateMessages =>
      _$this._afterTerminateMessages;
  set afterTerminateMessages(List<ChatViewModel> afterTerminateMessages) =>
      _$this._afterTerminateMessages = afterTerminateMessages;

  ChatViewModel _afterTerminateInput;
  ChatViewModel get afterTerminateInput => _$this._afterTerminateInput;
  set afterTerminateInput(ChatViewModel afterTerminateInput) =>
      _$this._afterTerminateInput = afterTerminateInput;

  ChatWithVetTerminateSuccessBuilder() {
    ChatWithVetTerminateSuccess._initializeBuilder(this);
  }

  ChatWithVetTerminateSuccessBuilder get _$this {
    if (_$v != null) {
      _channelSid = _$v.channelSid;
      _messages = _$v.messages;
      _afterTerminateMessages = _$v.afterTerminateMessages;
      _afterTerminateInput = _$v.afterTerminateInput;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatWithVetTerminateSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChatWithVetTerminateSuccess;
  }

  @override
  void update(void Function(ChatWithVetTerminateSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatWithVetTerminateSuccess build() {
    final _$result = _$v ??
        new _$ChatWithVetTerminateSuccess._(
            channelSid: channelSid,
            messages: messages,
            afterTerminateMessages: afterTerminateMessages,
            afterTerminateInput: afterTerminateInput);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
