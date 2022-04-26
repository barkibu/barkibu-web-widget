// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'twilio_message.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TwilioMessage> _$twilioMessageSerializer =
    new _$TwilioMessageSerializer();

class _$TwilioMessageSerializer implements StructuredSerializer<TwilioMessage> {
  @override
  final Iterable<Type> types = const [TwilioMessage, _$TwilioMessage];
  @override
  final String wireName = 'TwilioMessage';

  @override
  Iterable<Object> serialize(Serializers serializers, TwilioMessage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'sid',
      serializers.serialize(object.sid, specifiedType: const FullType(String)),
      'index',
      serializers.serialize(object.index, specifiedType: const FullType(int)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(String)),
      'body',
      serializers.serialize(object.body, specifiedType: const FullType(String)),
      'attributes',
      serializers.serialize(object.attributes,
          specifiedType: const FullType(
              Map, const [const FullType(String), const FullType(dynamic)])),
      'me',
      serializers.serialize(object.me, specifiedType: const FullType(bool)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(ChatViewModelType)),
    ];
    if (object.mediaSid != null) {
      result
        ..add('mediaSid')
        ..add(serializers.serialize(object.mediaSid,
            specifiedType: const FullType(String)));
    }
    if (object.mediaFilename != null) {
      result
        ..add('mediaFilename')
        ..add(serializers.serialize(object.mediaFilename,
            specifiedType: const FullType(String)));
    }
    if (object.mediaType != null) {
      result
        ..add('mediaType')
        ..add(serializers.serialize(object.mediaType,
            specifiedType: const FullType(String)));
    }
    if (object.mediaFileUrl != null) {
      result
        ..add('mediaFileUrl')
        ..add(serializers.serialize(object.mediaFileUrl,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  TwilioMessage deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TwilioMessageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'sid':
          result.sid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'index':
          result.index = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'body':
          result.body = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'attributes':
          result.attributes = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>;
          break;
        case 'mediaSid':
          result.mediaSid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mediaFilename':
          result.mediaFilename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mediaType':
          result.mediaType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mediaFileUrl':
          result.mediaFileUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'me':
          result.me = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(ChatViewModelType))
              as ChatViewModelType;
          break;
      }
    }

    return result.build();
  }
}

class _$TwilioMessage extends TwilioMessage {
  @override
  final String sid;
  @override
  final int index;
  @override
  final String author;
  @override
  final String body;
  @override
  final Map<String, dynamic> attributes;
  @override
  final String mediaSid;
  @override
  final String mediaFilename;
  @override
  final String mediaType;
  @override
  final String mediaFileUrl;
  @override
  final bool me;
  @override
  final ChatViewModelType type;

  factory _$TwilioMessage([void Function(TwilioMessageBuilder) updates]) =>
      (new TwilioMessageBuilder()..update(updates)).build();

  _$TwilioMessage._(
      {this.sid,
      this.index,
      this.author,
      this.body,
      this.attributes,
      this.mediaSid,
      this.mediaFilename,
      this.mediaType,
      this.mediaFileUrl,
      this.me,
      this.type})
      : super._() {
    if (sid == null) {
      throw new BuiltValueNullFieldError('TwilioMessage', 'sid');
    }
    if (index == null) {
      throw new BuiltValueNullFieldError('TwilioMessage', 'index');
    }
    if (author == null) {
      throw new BuiltValueNullFieldError('TwilioMessage', 'author');
    }
    if (body == null) {
      throw new BuiltValueNullFieldError('TwilioMessage', 'body');
    }
    if (attributes == null) {
      throw new BuiltValueNullFieldError('TwilioMessage', 'attributes');
    }
    if (me == null) {
      throw new BuiltValueNullFieldError('TwilioMessage', 'me');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('TwilioMessage', 'type');
    }
  }

  @override
  TwilioMessage rebuild(void Function(TwilioMessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TwilioMessageBuilder toBuilder() => new TwilioMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TwilioMessage &&
        sid == other.sid &&
        index == other.index &&
        author == other.author &&
        body == other.body &&
        attributes == other.attributes &&
        mediaSid == other.mediaSid &&
        mediaFilename == other.mediaFilename &&
        mediaType == other.mediaType &&
        mediaFileUrl == other.mediaFileUrl &&
        me == other.me &&
        type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, sid.hashCode),
                                            index.hashCode),
                                        author.hashCode),
                                    body.hashCode),
                                attributes.hashCode),
                            mediaSid.hashCode),
                        mediaFilename.hashCode),
                    mediaType.hashCode),
                mediaFileUrl.hashCode),
            me.hashCode),
        type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TwilioMessage')
          ..add('sid', sid)
          ..add('index', index)
          ..add('author', author)
          ..add('body', body)
          ..add('attributes', attributes)
          ..add('mediaSid', mediaSid)
          ..add('mediaFilename', mediaFilename)
          ..add('mediaType', mediaType)
          ..add('mediaFileUrl', mediaFileUrl)
          ..add('me', me)
          ..add('type', type))
        .toString();
  }
}

class TwilioMessageBuilder
    implements Builder<TwilioMessage, TwilioMessageBuilder> {
  _$TwilioMessage _$v;

  String _sid;
  String get sid => _$this._sid;
  set sid(String sid) => _$this._sid = sid;

  int _index;
  int get index => _$this._index;
  set index(int index) => _$this._index = index;

  String _author;
  String get author => _$this._author;
  set author(String author) => _$this._author = author;

  String _body;
  String get body => _$this._body;
  set body(String body) => _$this._body = body;

  Map<String, dynamic> _attributes;
  Map<String, dynamic> get attributes => _$this._attributes;
  set attributes(Map<String, dynamic> attributes) =>
      _$this._attributes = attributes;

  String _mediaSid;
  String get mediaSid => _$this._mediaSid;
  set mediaSid(String mediaSid) => _$this._mediaSid = mediaSid;

  String _mediaFilename;
  String get mediaFilename => _$this._mediaFilename;
  set mediaFilename(String mediaFilename) =>
      _$this._mediaFilename = mediaFilename;

  String _mediaType;
  String get mediaType => _$this._mediaType;
  set mediaType(String mediaType) => _$this._mediaType = mediaType;

  String _mediaFileUrl;
  String get mediaFileUrl => _$this._mediaFileUrl;
  set mediaFileUrl(String mediaFileUrl) => _$this._mediaFileUrl = mediaFileUrl;

  bool _me;
  bool get me => _$this._me;
  set me(bool me) => _$this._me = me;

  ChatViewModelType _type;
  ChatViewModelType get type => _$this._type;
  set type(ChatViewModelType type) => _$this._type = type;

  TwilioMessageBuilder() {
    TwilioMessage._initializeBuilder(this);
  }

  TwilioMessageBuilder get _$this {
    if (_$v != null) {
      _sid = _$v.sid;
      _index = _$v.index;
      _author = _$v.author;
      _body = _$v.body;
      _attributes = _$v.attributes;
      _mediaSid = _$v.mediaSid;
      _mediaFilename = _$v.mediaFilename;
      _mediaType = _$v.mediaType;
      _mediaFileUrl = _$v.mediaFileUrl;
      _me = _$v.me;
      _type = _$v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TwilioMessage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TwilioMessage;
  }

  @override
  void update(void Function(TwilioMessageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TwilioMessage build() {
    TwilioMessage._finalizeBuilder(this);
    final _$result = _$v ??
        new _$TwilioMessage._(
            sid: sid,
            index: index,
            author: author,
            body: body,
            attributes: attributes,
            mediaSid: mediaSid,
            mediaFilename: mediaFilename,
            mediaType: mediaType,
            mediaFileUrl: mediaFileUrl,
            me: me,
            type: type);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
