// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_with_vet_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChatWithVetStarted> _$chatWithVetStartedSerializer =
    new _$ChatWithVetStartedSerializer();
Serializer<ChatWithVetMessageSent> _$chatWithVetMessageSentSerializer =
    new _$ChatWithVetMessageSentSerializer();
Serializer<ChatWithVetBotMessageSent> _$chatWithVetBotMessageSentSerializer =
    new _$ChatWithVetBotMessageSentSerializer();
Serializer<ChatWithVetMediaMessageSent>
    _$chatWithVetMediaMessageSentSerializer =
    new _$ChatWithVetMediaMessageSentSerializer();
Serializer<ChatWithVetMessageReceived> _$chatWithVetMessageReceivedSerializer =
    new _$ChatWithVetMessageReceivedSerializer();
Serializer<ChatWithVetMemberTyped> _$chatWithVetMemberTypedSerializer =
    new _$ChatWithVetMemberTypedSerializer();
Serializer<ChatWithVetMemberJoined> _$chatWithVetMemberJoinedSerializer =
    new _$ChatWithVetMemberJoinedSerializer();
Serializer<ChatWithVetMemberLeft> _$chatWithVetMemberLeftSerializer =
    new _$ChatWithVetMemberLeftSerializer();
Serializer<ChatWithVetFeedbackPressed> _$chatWithVetFeedbackPressedSerializer =
    new _$ChatWithVetFeedbackPressedSerializer();

class _$ChatWithVetStartedSerializer
    implements StructuredSerializer<ChatWithVetStarted> {
  @override
  final Iterable<Type> types = const [ChatWithVetStarted, _$ChatWithVetStarted];
  @override
  final String wireName = 'ChatWithVetStarted';

  @override
  Iterable<Object> serialize(Serializers serializers, ChatWithVetStarted object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.consultationId != null) {
      result
        ..add('consultationId')
        ..add(serializers.serialize(object.consultationId,
            specifiedType: const FullType(String)));
    }
    if (object.channelSid != null) {
      result
        ..add('channelSid')
        ..add(serializers.serialize(object.channelSid,
            specifiedType: const FullType(String)));
    }
    if (object.chatService != null) {
      result
        ..add('chatService')
        ..add(serializers.serialize(object.chatService,
            specifiedType: const FullType(TwilioChatService)));
    }
    return result;
  }

  @override
  ChatWithVetStarted deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatWithVetStartedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'consultationId':
          result.consultationId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
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

class _$ChatWithVetMessageSentSerializer
    implements StructuredSerializer<ChatWithVetMessageSent> {
  @override
  final Iterable<Type> types = const [
    ChatWithVetMessageSent,
    _$ChatWithVetMessageSent
  ];
  @override
  final String wireName = 'ChatWithVetMessageSent';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ChatWithVetMessageSent object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'messageBody',
      serializers.serialize(object.messageBody,
          specifiedType: const FullType(String)),
      'showMessage',
      serializers.serialize(object.showMessage,
          specifiedType: const FullType(bool)),
    ];
    if (object.attributes != null) {
      result
        ..add('attributes')
        ..add(serializers.serialize(object.attributes,
            specifiedType: const FullType(
                Map, const [const FullType(String), const FullType(dynamic)])));
    }
    return result;
  }

  @override
  ChatWithVetMessageSent deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatWithVetMessageSentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'messageBody':
          result.messageBody = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'showMessage':
          result.showMessage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'attributes':
          result.attributes = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>;
          break;
      }
    }

    return result.build();
  }
}

class _$ChatWithVetBotMessageSentSerializer
    implements StructuredSerializer<ChatWithVetBotMessageSent> {
  @override
  final Iterable<Type> types = const [
    ChatWithVetBotMessageSent,
    _$ChatWithVetBotMessageSent
  ];
  @override
  final String wireName = 'ChatWithVetBotMessageSent';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ChatWithVetBotMessageSent object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'messageBody',
      serializers.serialize(object.messageBody,
          specifiedType: const FullType(String)),
      'showMessage',
      serializers.serialize(object.showMessage,
          specifiedType: const FullType(bool)),
    ];
    if (object.attributes != null) {
      result
        ..add('attributes')
        ..add(serializers.serialize(object.attributes,
            specifiedType: const FullType(
                Map, const [const FullType(String), const FullType(dynamic)])));
    }
    return result;
  }

  @override
  ChatWithVetBotMessageSent deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatWithVetBotMessageSentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'messageBody':
          result.messageBody = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'showMessage':
          result.showMessage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'attributes':
          result.attributes = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>;
          break;
      }
    }

    return result.build();
  }
}

class _$ChatWithVetMediaMessageSentSerializer
    implements StructuredSerializer<ChatWithVetMediaMessageSent> {
  @override
  final Iterable<Type> types = const [
    ChatWithVetMediaMessageSent,
    _$ChatWithVetMediaMessageSent
  ];
  @override
  final String wireName = 'ChatWithVetMediaMessageSent';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ChatWithVetMediaMessageSent object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'mediaPath',
      serializers.serialize(object.mediaPath,
          specifiedType: const FullType(String)),
      'mimeType',
      serializers.serialize(object.mimeType,
          specifiedType: const FullType(String)),
    ];
    if (object.formData != null) {
      result
        ..add('formData')
        ..add(serializers.serialize(object.formData,
            specifiedType: const FullType(Object)));
    }
    if (object.attributes != null) {
      result
        ..add('attributes')
        ..add(serializers.serialize(object.attributes,
            specifiedType: const FullType(
                Map, const [const FullType(String), const FullType(dynamic)])));
    }
    return result;
  }

  @override
  ChatWithVetMediaMessageSent deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatWithVetMediaMessageSentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'mediaPath':
          result.mediaPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'formData':
          result.formData = serializers.deserialize(value,
              specifiedType: const FullType(Object));
          break;
        case 'mimeType':
          result.mimeType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'attributes':
          result.attributes = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>;
          break;
      }
    }

    return result.build();
  }
}

class _$ChatWithVetMessageReceivedSerializer
    implements StructuredSerializer<ChatWithVetMessageReceived> {
  @override
  final Iterable<Type> types = const [
    ChatWithVetMessageReceived,
    _$ChatWithVetMessageReceived
  ];
  @override
  final String wireName = 'ChatWithVetMessageReceived';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ChatWithVetMessageReceived object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(TwilioMessage)),
    ];

    return result;
  }

  @override
  ChatWithVetMessageReceived deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatWithVetMessageReceivedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'message':
          result.message.replace(serializers.deserialize(value,
              specifiedType: const FullType(TwilioMessage)) as TwilioMessage);
          break;
      }
    }

    return result.build();
  }
}

class _$ChatWithVetMemberTypedSerializer
    implements StructuredSerializer<ChatWithVetMemberTyped> {
  @override
  final Iterable<Type> types = const [
    ChatWithVetMemberTyped,
    _$ChatWithVetMemberTyped
  ];
  @override
  final String wireName = 'ChatWithVetMemberTyped';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ChatWithVetMemberTyped object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isTyping',
      serializers.serialize(object.isTyping,
          specifiedType: const FullType(bool)),
      'member',
      serializers.serialize(object.member,
          specifiedType: const FullType(TwilioMember)),
    ];

    return result;
  }

  @override
  ChatWithVetMemberTyped deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatWithVetMemberTypedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isTyping':
          result.isTyping = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'member':
          result.member.replace(serializers.deserialize(value,
              specifiedType: const FullType(TwilioMember)) as TwilioMember);
          break;
      }
    }

    return result.build();
  }
}

class _$ChatWithVetMemberJoinedSerializer
    implements StructuredSerializer<ChatWithVetMemberJoined> {
  @override
  final Iterable<Type> types = const [
    ChatWithVetMemberJoined,
    _$ChatWithVetMemberJoined
  ];
  @override
  final String wireName = 'ChatWithVetMemberJoined';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ChatWithVetMemberJoined object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'member',
      serializers.serialize(object.member,
          specifiedType: const FullType(TwilioMember)),
    ];

    return result;
  }

  @override
  ChatWithVetMemberJoined deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatWithVetMemberJoinedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'member':
          result.member.replace(serializers.deserialize(value,
              specifiedType: const FullType(TwilioMember)) as TwilioMember);
          break;
      }
    }

    return result.build();
  }
}

class _$ChatWithVetMemberLeftSerializer
    implements StructuredSerializer<ChatWithVetMemberLeft> {
  @override
  final Iterable<Type> types = const [
    ChatWithVetMemberLeft,
    _$ChatWithVetMemberLeft
  ];
  @override
  final String wireName = 'ChatWithVetMemberLeft';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ChatWithVetMemberLeft object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'member',
      serializers.serialize(object.member,
          specifiedType: const FullType(TwilioMember)),
    ];

    return result;
  }

  @override
  ChatWithVetMemberLeft deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatWithVetMemberLeftBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'member':
          result.member.replace(serializers.deserialize(value,
              specifiedType: const FullType(TwilioMember)) as TwilioMember);
          break;
      }
    }

    return result.build();
  }
}

class _$ChatWithVetFeedbackPressedSerializer
    implements StructuredSerializer<ChatWithVetFeedbackPressed> {
  @override
  final Iterable<Type> types = const [
    ChatWithVetFeedbackPressed,
    _$ChatWithVetFeedbackPressed
  ];
  @override
  final String wireName = 'ChatWithVetFeedbackPressed';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ChatWithVetFeedbackPressed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'answer',
      serializers.serialize(object.answer, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  ChatWithVetFeedbackPressed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatWithVetFeedbackPressedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'answer':
          result.answer = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$ChatWithVetStarted extends ChatWithVetStarted {
  @override
  final String consultationId;
  @override
  final String channelSid;
  @override
  final TwilioChatService chatService;

  factory _$ChatWithVetStarted(
          [void Function(ChatWithVetStartedBuilder) updates]) =>
      (new ChatWithVetStartedBuilder()..update(updates)).build();

  _$ChatWithVetStarted._(
      {this.consultationId, this.channelSid, this.chatService})
      : super._();

  @override
  ChatWithVetStarted rebuild(
          void Function(ChatWithVetStartedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatWithVetStartedBuilder toBuilder() =>
      new ChatWithVetStartedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatWithVetStarted &&
        consultationId == other.consultationId &&
        channelSid == other.channelSid &&
        chatService == other.chatService;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, consultationId.hashCode), channelSid.hashCode),
        chatService.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatWithVetStarted')
          ..add('consultationId', consultationId)
          ..add('channelSid', channelSid)
          ..add('chatService', chatService))
        .toString();
  }
}

class ChatWithVetStartedBuilder
    implements Builder<ChatWithVetStarted, ChatWithVetStartedBuilder> {
  _$ChatWithVetStarted _$v;

  String _consultationId;
  String get consultationId => _$this._consultationId;
  set consultationId(String consultationId) =>
      _$this._consultationId = consultationId;

  String _channelSid;
  String get channelSid => _$this._channelSid;
  set channelSid(String channelSid) => _$this._channelSid = channelSid;

  TwilioChatService _chatService;
  TwilioChatService get chatService => _$this._chatService;
  set chatService(TwilioChatService chatService) =>
      _$this._chatService = chatService;

  ChatWithVetStartedBuilder();

  ChatWithVetStartedBuilder get _$this {
    if (_$v != null) {
      _consultationId = _$v.consultationId;
      _channelSid = _$v.channelSid;
      _chatService = _$v.chatService;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatWithVetStarted other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChatWithVetStarted;
  }

  @override
  void update(void Function(ChatWithVetStartedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatWithVetStarted build() {
    final _$result = _$v ??
        new _$ChatWithVetStarted._(
            consultationId: consultationId,
            channelSid: channelSid,
            chatService: chatService);
    replace(_$result);
    return _$result;
  }
}

class _$ChatWithVetMessageSent extends ChatWithVetMessageSent {
  @override
  final String messageBody;
  @override
  final bool showMessage;
  @override
  final Map<String, dynamic> attributes;

  factory _$ChatWithVetMessageSent(
          [void Function(ChatWithVetMessageSentBuilder) updates]) =>
      (new ChatWithVetMessageSentBuilder()..update(updates)).build();

  _$ChatWithVetMessageSent._(
      {this.messageBody, this.showMessage, this.attributes})
      : super._() {
    if (messageBody == null) {
      throw new BuiltValueNullFieldError(
          'ChatWithVetMessageSent', 'messageBody');
    }
    if (showMessage == null) {
      throw new BuiltValueNullFieldError(
          'ChatWithVetMessageSent', 'showMessage');
    }
  }

  @override
  ChatWithVetMessageSent rebuild(
          void Function(ChatWithVetMessageSentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatWithVetMessageSentBuilder toBuilder() =>
      new ChatWithVetMessageSentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatWithVetMessageSent &&
        messageBody == other.messageBody &&
        showMessage == other.showMessage &&
        attributes == other.attributes;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, messageBody.hashCode), showMessage.hashCode),
        attributes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatWithVetMessageSent')
          ..add('messageBody', messageBody)
          ..add('showMessage', showMessage)
          ..add('attributes', attributes))
        .toString();
  }
}

class ChatWithVetMessageSentBuilder
    implements Builder<ChatWithVetMessageSent, ChatWithVetMessageSentBuilder> {
  _$ChatWithVetMessageSent _$v;

  String _messageBody;
  String get messageBody => _$this._messageBody;
  set messageBody(String messageBody) => _$this._messageBody = messageBody;

  bool _showMessage;
  bool get showMessage => _$this._showMessage;
  set showMessage(bool showMessage) => _$this._showMessage = showMessage;

  Map<String, dynamic> _attributes;
  Map<String, dynamic> get attributes => _$this._attributes;
  set attributes(Map<String, dynamic> attributes) =>
      _$this._attributes = attributes;

  ChatWithVetMessageSentBuilder() {
    ChatWithVetMessageSent._initializeBuilder(this);
  }

  ChatWithVetMessageSentBuilder get _$this {
    if (_$v != null) {
      _messageBody = _$v.messageBody;
      _showMessage = _$v.showMessage;
      _attributes = _$v.attributes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatWithVetMessageSent other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChatWithVetMessageSent;
  }

  @override
  void update(void Function(ChatWithVetMessageSentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatWithVetMessageSent build() {
    final _$result = _$v ??
        new _$ChatWithVetMessageSent._(
            messageBody: messageBody,
            showMessage: showMessage,
            attributes: attributes);
    replace(_$result);
    return _$result;
  }
}

class _$ChatWithVetBotMessageSent extends ChatWithVetBotMessageSent {
  @override
  final String messageBody;
  @override
  final bool showMessage;
  @override
  final Map<String, dynamic> attributes;

  factory _$ChatWithVetBotMessageSent(
          [void Function(ChatWithVetBotMessageSentBuilder) updates]) =>
      (new ChatWithVetBotMessageSentBuilder()..update(updates)).build();

  _$ChatWithVetBotMessageSent._(
      {this.messageBody, this.showMessage, this.attributes})
      : super._() {
    if (messageBody == null) {
      throw new BuiltValueNullFieldError(
          'ChatWithVetBotMessageSent', 'messageBody');
    }
    if (showMessage == null) {
      throw new BuiltValueNullFieldError(
          'ChatWithVetBotMessageSent', 'showMessage');
    }
  }

  @override
  ChatWithVetBotMessageSent rebuild(
          void Function(ChatWithVetBotMessageSentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatWithVetBotMessageSentBuilder toBuilder() =>
      new ChatWithVetBotMessageSentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatWithVetBotMessageSent &&
        messageBody == other.messageBody &&
        showMessage == other.showMessage &&
        attributes == other.attributes;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, messageBody.hashCode), showMessage.hashCode),
        attributes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatWithVetBotMessageSent')
          ..add('messageBody', messageBody)
          ..add('showMessage', showMessage)
          ..add('attributes', attributes))
        .toString();
  }
}

class ChatWithVetBotMessageSentBuilder
    implements
        Builder<ChatWithVetBotMessageSent, ChatWithVetBotMessageSentBuilder> {
  _$ChatWithVetBotMessageSent _$v;

  String _messageBody;
  String get messageBody => _$this._messageBody;
  set messageBody(String messageBody) => _$this._messageBody = messageBody;

  bool _showMessage;
  bool get showMessage => _$this._showMessage;
  set showMessage(bool showMessage) => _$this._showMessage = showMessage;

  Map<String, dynamic> _attributes;
  Map<String, dynamic> get attributes => _$this._attributes;
  set attributes(Map<String, dynamic> attributes) =>
      _$this._attributes = attributes;

  ChatWithVetBotMessageSentBuilder() {
    ChatWithVetBotMessageSent._initializeBuilder(this);
  }

  ChatWithVetBotMessageSentBuilder get _$this {
    if (_$v != null) {
      _messageBody = _$v.messageBody;
      _showMessage = _$v.showMessage;
      _attributes = _$v.attributes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatWithVetBotMessageSent other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChatWithVetBotMessageSent;
  }

  @override
  void update(void Function(ChatWithVetBotMessageSentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatWithVetBotMessageSent build() {
    ChatWithVetBotMessageSent._finalizeBuilder(this);
    final _$result = _$v ??
        new _$ChatWithVetBotMessageSent._(
            messageBody: messageBody,
            showMessage: showMessage,
            attributes: attributes);
    replace(_$result);
    return _$result;
  }
}

class _$ChatWithVetMediaMessageSent extends ChatWithVetMediaMessageSent {
  @override
  final String mediaPath;
  @override
  final Object formData;
  @override
  final String mimeType;
  @override
  final Map<String, dynamic> attributes;

  factory _$ChatWithVetMediaMessageSent(
          [void Function(ChatWithVetMediaMessageSentBuilder) updates]) =>
      (new ChatWithVetMediaMessageSentBuilder()..update(updates)).build();

  _$ChatWithVetMediaMessageSent._(
      {this.mediaPath, this.formData, this.mimeType, this.attributes})
      : super._() {
    if (mediaPath == null) {
      throw new BuiltValueNullFieldError(
          'ChatWithVetMediaMessageSent', 'mediaPath');
    }
    if (mimeType == null) {
      throw new BuiltValueNullFieldError(
          'ChatWithVetMediaMessageSent', 'mimeType');
    }
  }

  @override
  ChatWithVetMediaMessageSent rebuild(
          void Function(ChatWithVetMediaMessageSentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatWithVetMediaMessageSentBuilder toBuilder() =>
      new ChatWithVetMediaMessageSentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatWithVetMediaMessageSent &&
        mediaPath == other.mediaPath &&
        formData == other.formData &&
        mimeType == other.mimeType &&
        attributes == other.attributes;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, mediaPath.hashCode), formData.hashCode),
            mimeType.hashCode),
        attributes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatWithVetMediaMessageSent')
          ..add('mediaPath', mediaPath)
          ..add('formData', formData)
          ..add('mimeType', mimeType)
          ..add('attributes', attributes))
        .toString();
  }
}

class ChatWithVetMediaMessageSentBuilder
    implements
        Builder<ChatWithVetMediaMessageSent,
            ChatWithVetMediaMessageSentBuilder> {
  _$ChatWithVetMediaMessageSent _$v;

  String _mediaPath;
  String get mediaPath => _$this._mediaPath;
  set mediaPath(String mediaPath) => _$this._mediaPath = mediaPath;

  Object _formData;
  Object get formData => _$this._formData;
  set formData(Object formData) => _$this._formData = formData;

  String _mimeType;
  String get mimeType => _$this._mimeType;
  set mimeType(String mimeType) => _$this._mimeType = mimeType;

  Map<String, dynamic> _attributes;
  Map<String, dynamic> get attributes => _$this._attributes;
  set attributes(Map<String, dynamic> attributes) =>
      _$this._attributes = attributes;

  ChatWithVetMediaMessageSentBuilder();

  ChatWithVetMediaMessageSentBuilder get _$this {
    if (_$v != null) {
      _mediaPath = _$v.mediaPath;
      _formData = _$v.formData;
      _mimeType = _$v.mimeType;
      _attributes = _$v.attributes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatWithVetMediaMessageSent other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChatWithVetMediaMessageSent;
  }

  @override
  void update(void Function(ChatWithVetMediaMessageSentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatWithVetMediaMessageSent build() {
    final _$result = _$v ??
        new _$ChatWithVetMediaMessageSent._(
            mediaPath: mediaPath,
            formData: formData,
            mimeType: mimeType,
            attributes: attributes);
    replace(_$result);
    return _$result;
  }
}

class _$ChatWithVetMessageReceived extends ChatWithVetMessageReceived {
  @override
  final TwilioMessage message;

  factory _$ChatWithVetMessageReceived(
          [void Function(ChatWithVetMessageReceivedBuilder) updates]) =>
      (new ChatWithVetMessageReceivedBuilder()..update(updates)).build();

  _$ChatWithVetMessageReceived._({this.message}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError(
          'ChatWithVetMessageReceived', 'message');
    }
  }

  @override
  ChatWithVetMessageReceived rebuild(
          void Function(ChatWithVetMessageReceivedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatWithVetMessageReceivedBuilder toBuilder() =>
      new ChatWithVetMessageReceivedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatWithVetMessageReceived && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatWithVetMessageReceived')
          ..add('message', message))
        .toString();
  }
}

class ChatWithVetMessageReceivedBuilder
    implements
        Builder<ChatWithVetMessageReceived, ChatWithVetMessageReceivedBuilder> {
  _$ChatWithVetMessageReceived _$v;

  TwilioMessageBuilder _message;
  TwilioMessageBuilder get message =>
      _$this._message ??= new TwilioMessageBuilder();
  set message(TwilioMessageBuilder message) => _$this._message = message;

  ChatWithVetMessageReceivedBuilder();

  ChatWithVetMessageReceivedBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatWithVetMessageReceived other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChatWithVetMessageReceived;
  }

  @override
  void update(void Function(ChatWithVetMessageReceivedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatWithVetMessageReceived build() {
    _$ChatWithVetMessageReceived _$result;
    try {
      _$result =
          _$v ?? new _$ChatWithVetMessageReceived._(message: message.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'message';
        message.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ChatWithVetMessageReceived', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ChatWithVetMemberTyped extends ChatWithVetMemberTyped {
  @override
  final bool isTyping;
  @override
  final TwilioMember member;

  factory _$ChatWithVetMemberTyped(
          [void Function(ChatWithVetMemberTypedBuilder) updates]) =>
      (new ChatWithVetMemberTypedBuilder()..update(updates)).build();

  _$ChatWithVetMemberTyped._({this.isTyping, this.member}) : super._() {
    if (isTyping == null) {
      throw new BuiltValueNullFieldError('ChatWithVetMemberTyped', 'isTyping');
    }
    if (member == null) {
      throw new BuiltValueNullFieldError('ChatWithVetMemberTyped', 'member');
    }
  }

  @override
  ChatWithVetMemberTyped rebuild(
          void Function(ChatWithVetMemberTypedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatWithVetMemberTypedBuilder toBuilder() =>
      new ChatWithVetMemberTypedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatWithVetMemberTyped &&
        isTyping == other.isTyping &&
        member == other.member;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, isTyping.hashCode), member.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatWithVetMemberTyped')
          ..add('isTyping', isTyping)
          ..add('member', member))
        .toString();
  }
}

class ChatWithVetMemberTypedBuilder
    implements Builder<ChatWithVetMemberTyped, ChatWithVetMemberTypedBuilder> {
  _$ChatWithVetMemberTyped _$v;

  bool _isTyping;
  bool get isTyping => _$this._isTyping;
  set isTyping(bool isTyping) => _$this._isTyping = isTyping;

  TwilioMemberBuilder _member;
  TwilioMemberBuilder get member =>
      _$this._member ??= new TwilioMemberBuilder();
  set member(TwilioMemberBuilder member) => _$this._member = member;

  ChatWithVetMemberTypedBuilder();

  ChatWithVetMemberTypedBuilder get _$this {
    if (_$v != null) {
      _isTyping = _$v.isTyping;
      _member = _$v.member?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatWithVetMemberTyped other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChatWithVetMemberTyped;
  }

  @override
  void update(void Function(ChatWithVetMemberTypedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatWithVetMemberTyped build() {
    _$ChatWithVetMemberTyped _$result;
    try {
      _$result = _$v ??
          new _$ChatWithVetMemberTyped._(
              isTyping: isTyping, member: member.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'member';
        member.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ChatWithVetMemberTyped', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ChatWithVetMemberJoined extends ChatWithVetMemberJoined {
  @override
  final TwilioMember member;

  factory _$ChatWithVetMemberJoined(
          [void Function(ChatWithVetMemberJoinedBuilder) updates]) =>
      (new ChatWithVetMemberJoinedBuilder()..update(updates)).build();

  _$ChatWithVetMemberJoined._({this.member}) : super._() {
    if (member == null) {
      throw new BuiltValueNullFieldError('ChatWithVetMemberJoined', 'member');
    }
  }

  @override
  ChatWithVetMemberJoined rebuild(
          void Function(ChatWithVetMemberJoinedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatWithVetMemberJoinedBuilder toBuilder() =>
      new ChatWithVetMemberJoinedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatWithVetMemberJoined && member == other.member;
  }

  @override
  int get hashCode {
    return $jf($jc(0, member.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatWithVetMemberJoined')
          ..add('member', member))
        .toString();
  }
}

class ChatWithVetMemberJoinedBuilder
    implements
        Builder<ChatWithVetMemberJoined, ChatWithVetMemberJoinedBuilder> {
  _$ChatWithVetMemberJoined _$v;

  TwilioMemberBuilder _member;
  TwilioMemberBuilder get member =>
      _$this._member ??= new TwilioMemberBuilder();
  set member(TwilioMemberBuilder member) => _$this._member = member;

  ChatWithVetMemberJoinedBuilder();

  ChatWithVetMemberJoinedBuilder get _$this {
    if (_$v != null) {
      _member = _$v.member?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatWithVetMemberJoined other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChatWithVetMemberJoined;
  }

  @override
  void update(void Function(ChatWithVetMemberJoinedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatWithVetMemberJoined build() {
    _$ChatWithVetMemberJoined _$result;
    try {
      _$result = _$v ?? new _$ChatWithVetMemberJoined._(member: member.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'member';
        member.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ChatWithVetMemberJoined', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ChatWithVetMemberLeft extends ChatWithVetMemberLeft {
  @override
  final TwilioMember member;

  factory _$ChatWithVetMemberLeft(
          [void Function(ChatWithVetMemberLeftBuilder) updates]) =>
      (new ChatWithVetMemberLeftBuilder()..update(updates)).build();

  _$ChatWithVetMemberLeft._({this.member}) : super._() {
    if (member == null) {
      throw new BuiltValueNullFieldError('ChatWithVetMemberLeft', 'member');
    }
  }

  @override
  ChatWithVetMemberLeft rebuild(
          void Function(ChatWithVetMemberLeftBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatWithVetMemberLeftBuilder toBuilder() =>
      new ChatWithVetMemberLeftBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatWithVetMemberLeft && member == other.member;
  }

  @override
  int get hashCode {
    return $jf($jc(0, member.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatWithVetMemberLeft')
          ..add('member', member))
        .toString();
  }
}

class ChatWithVetMemberLeftBuilder
    implements Builder<ChatWithVetMemberLeft, ChatWithVetMemberLeftBuilder> {
  _$ChatWithVetMemberLeft _$v;

  TwilioMemberBuilder _member;
  TwilioMemberBuilder get member =>
      _$this._member ??= new TwilioMemberBuilder();
  set member(TwilioMemberBuilder member) => _$this._member = member;

  ChatWithVetMemberLeftBuilder();

  ChatWithVetMemberLeftBuilder get _$this {
    if (_$v != null) {
      _member = _$v.member?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatWithVetMemberLeft other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChatWithVetMemberLeft;
  }

  @override
  void update(void Function(ChatWithVetMemberLeftBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatWithVetMemberLeft build() {
    _$ChatWithVetMemberLeft _$result;
    try {
      _$result = _$v ?? new _$ChatWithVetMemberLeft._(member: member.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'member';
        member.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ChatWithVetMemberLeft', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ChatWithVetFeedbackPressed extends ChatWithVetFeedbackPressed {
  @override
  final bool answer;

  factory _$ChatWithVetFeedbackPressed(
          [void Function(ChatWithVetFeedbackPressedBuilder) updates]) =>
      (new ChatWithVetFeedbackPressedBuilder()..update(updates)).build();

  _$ChatWithVetFeedbackPressed._({this.answer}) : super._() {
    if (answer == null) {
      throw new BuiltValueNullFieldError(
          'ChatWithVetFeedbackPressed', 'answer');
    }
  }

  @override
  ChatWithVetFeedbackPressed rebuild(
          void Function(ChatWithVetFeedbackPressedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatWithVetFeedbackPressedBuilder toBuilder() =>
      new ChatWithVetFeedbackPressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatWithVetFeedbackPressed && answer == other.answer;
  }

  @override
  int get hashCode {
    return $jf($jc(0, answer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatWithVetFeedbackPressed')
          ..add('answer', answer))
        .toString();
  }
}

class ChatWithVetFeedbackPressedBuilder
    implements
        Builder<ChatWithVetFeedbackPressed, ChatWithVetFeedbackPressedBuilder> {
  _$ChatWithVetFeedbackPressed _$v;

  bool _answer;
  bool get answer => _$this._answer;
  set answer(bool answer) => _$this._answer = answer;

  ChatWithVetFeedbackPressedBuilder();

  ChatWithVetFeedbackPressedBuilder get _$this {
    if (_$v != null) {
      _answer = _$v.answer;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatWithVetFeedbackPressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChatWithVetFeedbackPressed;
  }

  @override
  void update(void Function(ChatWithVetFeedbackPressedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatWithVetFeedbackPressed build() {
    final _$result = _$v ?? new _$ChatWithVetFeedbackPressed._(answer: answer);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
