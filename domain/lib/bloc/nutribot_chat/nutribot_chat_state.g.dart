// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutribot_chat_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NutribotChatInitial> _$nutribotChatInitialSerializer =
    new _$NutribotChatInitialSerializer();
Serializer<NutribotChatFlowUpdated> _$nutribotChatFlowUpdatedSerializer =
    new _$NutribotChatFlowUpdatedSerializer();
Serializer<NutribotChatInputRequested> _$nutribotChatInputRequestedSerializer =
    new _$NutribotChatInputRequestedSerializer();

class _$NutribotChatInitialSerializer
    implements StructuredSerializer<NutribotChatInitial> {
  @override
  final Iterable<Type> types = const [
    NutribotChatInitial,
    _$NutribotChatInitial
  ];
  @override
  final String wireName = 'NutribotChatInitial';

  @override
  Iterable<Object> serialize(
      Serializers serializers, NutribotChatInitial object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'chatViewModels',
      serializers.serialize(object.chatViewModels,
          specifiedType:
              const FullType(List, const [const FullType(ChatViewModel)])),
      'model',
      serializers.serialize(object.model,
          specifiedType: const FullType(NutribotModel)),
    ];
    if (object.input != null) {
      result
        ..add('input')
        ..add(serializers.serialize(object.input,
            specifiedType: const FullType(ChatViewModel)));
    }
    if (object.user != null) {
      result
        ..add('user')
        ..add(serializers.serialize(object.user,
            specifiedType: const FullType(User)));
    }
    return result;
  }

  @override
  NutribotChatInitial deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NutribotChatInitialBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'chatViewModels':
          result.chatViewModels = serializers.deserialize(value,
                  specifiedType: const FullType(
                      List, const [const FullType(ChatViewModel)]))
              as List<ChatViewModel>;
          break;
        case 'input':
          result.input = serializers.deserialize(value,
              specifiedType: const FullType(ChatViewModel)) as ChatViewModel;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(User)) as User;
          break;
        case 'model':
          result.model = serializers.deserialize(value,
              specifiedType: const FullType(NutribotModel)) as NutribotModel;
          break;
      }
    }

    return result.build();
  }
}

class _$NutribotChatFlowUpdatedSerializer
    implements StructuredSerializer<NutribotChatFlowUpdated> {
  @override
  final Iterable<Type> types = const [
    NutribotChatFlowUpdated,
    _$NutribotChatFlowUpdated
  ];
  @override
  final String wireName = 'NutribotChatFlowUpdated';

  @override
  Iterable<Object> serialize(
      Serializers serializers, NutribotChatFlowUpdated object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'chatViewModels',
      serializers.serialize(object.chatViewModels,
          specifiedType:
              const FullType(List, const [const FullType(ChatViewModel)])),
      'model',
      serializers.serialize(object.model,
          specifiedType: const FullType(NutribotModel)),
    ];
    if (object.input != null) {
      result
        ..add('input')
        ..add(serializers.serialize(object.input,
            specifiedType: const FullType(ChatViewModel)));
    }
    if (object.user != null) {
      result
        ..add('user')
        ..add(serializers.serialize(object.user,
            specifiedType: const FullType(User)));
    }
    return result;
  }

  @override
  NutribotChatFlowUpdated deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NutribotChatFlowUpdatedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'chatViewModels':
          result.chatViewModels = serializers.deserialize(value,
                  specifiedType: const FullType(
                      List, const [const FullType(ChatViewModel)]))
              as List<ChatViewModel>;
          break;
        case 'input':
          result.input = serializers.deserialize(value,
              specifiedType: const FullType(ChatViewModel)) as ChatViewModel;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(User)) as User;
          break;
        case 'model':
          result.model = serializers.deserialize(value,
              specifiedType: const FullType(NutribotModel)) as NutribotModel;
          break;
      }
    }

    return result.build();
  }
}

class _$NutribotChatInputRequestedSerializer
    implements StructuredSerializer<NutribotChatInputRequested> {
  @override
  final Iterable<Type> types = const [
    NutribotChatInputRequested,
    _$NutribotChatInputRequested
  ];
  @override
  final String wireName = 'NutribotChatInputRequested';

  @override
  Iterable<Object> serialize(
      Serializers serializers, NutribotChatInputRequested object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'chatViewModels',
      serializers.serialize(object.chatViewModels,
          specifiedType:
              const FullType(List, const [const FullType(ChatViewModel)])),
      'model',
      serializers.serialize(object.model,
          specifiedType: const FullType(NutribotModel)),
    ];
    if (object.input != null) {
      result
        ..add('input')
        ..add(serializers.serialize(object.input,
            specifiedType: const FullType(ChatViewModel)));
    }
    if (object.user != null) {
      result
        ..add('user')
        ..add(serializers.serialize(object.user,
            specifiedType: const FullType(User)));
    }
    return result;
  }

  @override
  NutribotChatInputRequested deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NutribotChatInputRequestedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'chatViewModels':
          result.chatViewModels = serializers.deserialize(value,
                  specifiedType: const FullType(
                      List, const [const FullType(ChatViewModel)]))
              as List<ChatViewModel>;
          break;
        case 'input':
          result.input = serializers.deserialize(value,
              specifiedType: const FullType(ChatViewModel)) as ChatViewModel;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(User)) as User;
          break;
        case 'model':
          result.model = serializers.deserialize(value,
              specifiedType: const FullType(NutribotModel)) as NutribotModel;
          break;
      }
    }

    return result.build();
  }
}

class _$NutribotChatInitial extends NutribotChatInitial {
  @override
  final List<ChatViewModel> chatViewModels;
  @override
  final ChatViewModel input;
  @override
  final User user;
  @override
  final NutribotModel model;

  factory _$NutribotChatInitial(
          [void Function(NutribotChatInitialBuilder) updates]) =>
      (new NutribotChatInitialBuilder()..update(updates)).build();

  _$NutribotChatInitial._(
      {this.chatViewModels, this.input, this.user, this.model})
      : super._() {
    if (chatViewModels == null) {
      throw new BuiltValueNullFieldError(
          'NutribotChatInitial', 'chatViewModels');
    }
    if (model == null) {
      throw new BuiltValueNullFieldError('NutribotChatInitial', 'model');
    }
  }

  @override
  NutribotChatInitial rebuild(
          void Function(NutribotChatInitialBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NutribotChatInitialBuilder toBuilder() =>
      new NutribotChatInitialBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NutribotChatInitial &&
        chatViewModels == other.chatViewModels &&
        input == other.input &&
        user == other.user &&
        model == other.model;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, chatViewModels.hashCode), input.hashCode),
            user.hashCode),
        model.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NutribotChatInitial')
          ..add('chatViewModels', chatViewModels)
          ..add('input', input)
          ..add('user', user)
          ..add('model', model))
        .toString();
  }
}

class NutribotChatInitialBuilder
    implements Builder<NutribotChatInitial, NutribotChatInitialBuilder> {
  _$NutribotChatInitial _$v;

  List<ChatViewModel> _chatViewModels;
  List<ChatViewModel> get chatViewModels => _$this._chatViewModels;
  set chatViewModels(List<ChatViewModel> chatViewModels) =>
      _$this._chatViewModels = chatViewModels;

  ChatViewModel _input;
  ChatViewModel get input => _$this._input;
  set input(ChatViewModel input) => _$this._input = input;

  User _user;
  User get user => _$this._user;
  set user(User user) => _$this._user = user;

  NutribotModel _model;
  NutribotModel get model => _$this._model;
  set model(NutribotModel model) => _$this._model = model;

  NutribotChatInitialBuilder() {
    NutribotChatInitial._initializeBuilder(this);
  }

  NutribotChatInitialBuilder get _$this {
    if (_$v != null) {
      _chatViewModels = _$v.chatViewModels;
      _input = _$v.input;
      _user = _$v.user;
      _model = _$v.model;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NutribotChatInitial other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NutribotChatInitial;
  }

  @override
  void update(void Function(NutribotChatInitialBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NutribotChatInitial build() {
    final _$result = _$v ??
        new _$NutribotChatInitial._(
            chatViewModels: chatViewModels,
            input: input,
            user: user,
            model: model);
    replace(_$result);
    return _$result;
  }
}

class _$NutribotChatFlowUpdated extends NutribotChatFlowUpdated {
  @override
  final List<ChatViewModel> chatViewModels;
  @override
  final ChatViewModel input;
  @override
  final User user;
  @override
  final NutribotModel model;

  factory _$NutribotChatFlowUpdated(
          [void Function(NutribotChatFlowUpdatedBuilder) updates]) =>
      (new NutribotChatFlowUpdatedBuilder()..update(updates)).build();

  _$NutribotChatFlowUpdated._(
      {this.chatViewModels, this.input, this.user, this.model})
      : super._() {
    if (chatViewModels == null) {
      throw new BuiltValueNullFieldError(
          'NutribotChatFlowUpdated', 'chatViewModels');
    }
    if (model == null) {
      throw new BuiltValueNullFieldError('NutribotChatFlowUpdated', 'model');
    }
  }

  @override
  NutribotChatFlowUpdated rebuild(
          void Function(NutribotChatFlowUpdatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NutribotChatFlowUpdatedBuilder toBuilder() =>
      new NutribotChatFlowUpdatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NutribotChatFlowUpdated &&
        chatViewModels == other.chatViewModels &&
        input == other.input &&
        user == other.user &&
        model == other.model;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, chatViewModels.hashCode), input.hashCode),
            user.hashCode),
        model.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NutribotChatFlowUpdated')
          ..add('chatViewModels', chatViewModels)
          ..add('input', input)
          ..add('user', user)
          ..add('model', model))
        .toString();
  }
}

class NutribotChatFlowUpdatedBuilder
    implements
        Builder<NutribotChatFlowUpdated, NutribotChatFlowUpdatedBuilder> {
  _$NutribotChatFlowUpdated _$v;

  List<ChatViewModel> _chatViewModels;
  List<ChatViewModel> get chatViewModels => _$this._chatViewModels;
  set chatViewModels(List<ChatViewModel> chatViewModels) =>
      _$this._chatViewModels = chatViewModels;

  ChatViewModel _input;
  ChatViewModel get input => _$this._input;
  set input(ChatViewModel input) => _$this._input = input;

  User _user;
  User get user => _$this._user;
  set user(User user) => _$this._user = user;

  NutribotModel _model;
  NutribotModel get model => _$this._model;
  set model(NutribotModel model) => _$this._model = model;

  NutribotChatFlowUpdatedBuilder();

  NutribotChatFlowUpdatedBuilder get _$this {
    if (_$v != null) {
      _chatViewModels = _$v.chatViewModels;
      _input = _$v.input;
      _user = _$v.user;
      _model = _$v.model;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NutribotChatFlowUpdated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NutribotChatFlowUpdated;
  }

  @override
  void update(void Function(NutribotChatFlowUpdatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NutribotChatFlowUpdated build() {
    final _$result = _$v ??
        new _$NutribotChatFlowUpdated._(
            chatViewModels: chatViewModels,
            input: input,
            user: user,
            model: model);
    replace(_$result);
    return _$result;
  }
}

class _$NutribotChatInputRequested extends NutribotChatInputRequested {
  @override
  final List<ChatViewModel> chatViewModels;
  @override
  final ChatViewModel input;
  @override
  final User user;
  @override
  final NutribotModel model;

  factory _$NutribotChatInputRequested(
          [void Function(NutribotChatInputRequestedBuilder) updates]) =>
      (new NutribotChatInputRequestedBuilder()..update(updates)).build();

  _$NutribotChatInputRequested._(
      {this.chatViewModels, this.input, this.user, this.model})
      : super._() {
    if (chatViewModels == null) {
      throw new BuiltValueNullFieldError(
          'NutribotChatInputRequested', 'chatViewModels');
    }
    if (model == null) {
      throw new BuiltValueNullFieldError('NutribotChatInputRequested', 'model');
    }
  }

  @override
  NutribotChatInputRequested rebuild(
          void Function(NutribotChatInputRequestedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NutribotChatInputRequestedBuilder toBuilder() =>
      new NutribotChatInputRequestedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NutribotChatInputRequested &&
        chatViewModels == other.chatViewModels &&
        input == other.input &&
        user == other.user &&
        model == other.model;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, chatViewModels.hashCode), input.hashCode),
            user.hashCode),
        model.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NutribotChatInputRequested')
          ..add('chatViewModels', chatViewModels)
          ..add('input', input)
          ..add('user', user)
          ..add('model', model))
        .toString();
  }
}

class NutribotChatInputRequestedBuilder
    implements
        Builder<NutribotChatInputRequested, NutribotChatInputRequestedBuilder> {
  _$NutribotChatInputRequested _$v;

  List<ChatViewModel> _chatViewModels;
  List<ChatViewModel> get chatViewModels => _$this._chatViewModels;
  set chatViewModels(List<ChatViewModel> chatViewModels) =>
      _$this._chatViewModels = chatViewModels;

  ChatViewModel _input;
  ChatViewModel get input => _$this._input;
  set input(ChatViewModel input) => _$this._input = input;

  User _user;
  User get user => _$this._user;
  set user(User user) => _$this._user = user;

  NutribotModel _model;
  NutribotModel get model => _$this._model;
  set model(NutribotModel model) => _$this._model = model;

  NutribotChatInputRequestedBuilder();

  NutribotChatInputRequestedBuilder get _$this {
    if (_$v != null) {
      _chatViewModels = _$v.chatViewModels;
      _input = _$v.input;
      _user = _$v.user;
      _model = _$v.model;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NutribotChatInputRequested other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NutribotChatInputRequested;
  }

  @override
  void update(void Function(NutribotChatInputRequestedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NutribotChatInputRequested build() {
    final _$result = _$v ??
        new _$NutribotChatInputRequested._(
            chatViewModels: chatViewModels,
            input: input,
            user: user,
            model: model);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
