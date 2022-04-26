// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_viewmodel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MessageChatViewModel extends MessageChatViewModel {
  @override
  final bool me;
  @override
  final String message;
  @override
  final bool editable;

  factory _$MessageChatViewModel(
          [void Function(MessageChatViewModelBuilder) updates]) =>
      (new MessageChatViewModelBuilder()..update(updates)).build();

  _$MessageChatViewModel._({this.me, this.message, this.editable}) : super._() {
    if (me == null) {
      throw new BuiltValueNullFieldError('MessageChatViewModel', 'me');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('MessageChatViewModel', 'message');
    }
    if (editable == null) {
      throw new BuiltValueNullFieldError('MessageChatViewModel', 'editable');
    }
  }

  @override
  MessageChatViewModel rebuild(
          void Function(MessageChatViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageChatViewModelBuilder toBuilder() =>
      new MessageChatViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessageChatViewModel &&
        me == other.me &&
        message == other.message &&
        editable == other.editable;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, me.hashCode), message.hashCode), editable.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MessageChatViewModel')
          ..add('me', me)
          ..add('message', message)
          ..add('editable', editable))
        .toString();
  }
}

class MessageChatViewModelBuilder
    implements Builder<MessageChatViewModel, MessageChatViewModelBuilder> {
  _$MessageChatViewModel _$v;

  bool _me;
  bool get me => _$this._me;
  set me(bool me) => _$this._me = me;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  bool _editable;
  bool get editable => _$this._editable;
  set editable(bool editable) => _$this._editable = editable;

  MessageChatViewModelBuilder() {
    MessageChatViewModel._initializeBuilder(this);
  }

  MessageChatViewModelBuilder get _$this {
    if (_$v != null) {
      _me = _$v.me;
      _message = _$v.message;
      _editable = _$v.editable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessageChatViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MessageChatViewModel;
  }

  @override
  void update(void Function(MessageChatViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MessageChatViewModel build() {
    final _$result = _$v ??
        new _$MessageChatViewModel._(
            me: me, message: message, editable: editable);
    replace(_$result);
    return _$result;
  }
}

class _$ImageChatViewModel extends ImageChatViewModel {
  @override
  final bool me;
  @override
  final String mediaUrl;

  factory _$ImageChatViewModel(
          [void Function(ImageChatViewModelBuilder) updates]) =>
      (new ImageChatViewModelBuilder()..update(updates)).build();

  _$ImageChatViewModel._({this.me, this.mediaUrl}) : super._() {
    if (me == null) {
      throw new BuiltValueNullFieldError('ImageChatViewModel', 'me');
    }
    if (mediaUrl == null) {
      throw new BuiltValueNullFieldError('ImageChatViewModel', 'mediaUrl');
    }
  }

  @override
  ImageChatViewModel rebuild(
          void Function(ImageChatViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImageChatViewModelBuilder toBuilder() =>
      new ImageChatViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImageChatViewModel &&
        me == other.me &&
        mediaUrl == other.mediaUrl;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, me.hashCode), mediaUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ImageChatViewModel')
          ..add('me', me)
          ..add('mediaUrl', mediaUrl))
        .toString();
  }
}

class ImageChatViewModelBuilder
    implements Builder<ImageChatViewModel, ImageChatViewModelBuilder> {
  _$ImageChatViewModel _$v;

  bool _me;
  bool get me => _$this._me;
  set me(bool me) => _$this._me = me;

  String _mediaUrl;
  String get mediaUrl => _$this._mediaUrl;
  set mediaUrl(String mediaUrl) => _$this._mediaUrl = mediaUrl;

  ImageChatViewModelBuilder();

  ImageChatViewModelBuilder get _$this {
    if (_$v != null) {
      _me = _$v.me;
      _mediaUrl = _$v.mediaUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImageChatViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ImageChatViewModel;
  }

  @override
  void update(void Function(ImageChatViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ImageChatViewModel build() {
    final _$result =
        _$v ?? new _$ImageChatViewModel._(me: me, mediaUrl: mediaUrl);
    replace(_$result);
    return _$result;
  }
}

class _$MessageWithHelpChatViewModel extends MessageWithHelpChatViewModel {
  @override
  final bool me;
  @override
  final String message;
  @override
  final String helpTitle;
  @override
  final String helpContent;

  factory _$MessageWithHelpChatViewModel(
          [void Function(MessageWithHelpChatViewModelBuilder) updates]) =>
      (new MessageWithHelpChatViewModelBuilder()..update(updates)).build();

  _$MessageWithHelpChatViewModel._(
      {this.me, this.message, this.helpTitle, this.helpContent})
      : super._() {
    if (me == null) {
      throw new BuiltValueNullFieldError('MessageWithHelpChatViewModel', 'me');
    }
  }

  @override
  MessageWithHelpChatViewModel rebuild(
          void Function(MessageWithHelpChatViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageWithHelpChatViewModelBuilder toBuilder() =>
      new MessageWithHelpChatViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessageWithHelpChatViewModel &&
        me == other.me &&
        message == other.message &&
        helpTitle == other.helpTitle &&
        helpContent == other.helpContent;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, me.hashCode), message.hashCode), helpTitle.hashCode),
        helpContent.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MessageWithHelpChatViewModel')
          ..add('me', me)
          ..add('message', message)
          ..add('helpTitle', helpTitle)
          ..add('helpContent', helpContent))
        .toString();
  }
}

class MessageWithHelpChatViewModelBuilder
    implements
        Builder<MessageWithHelpChatViewModel,
            MessageWithHelpChatViewModelBuilder> {
  _$MessageWithHelpChatViewModel _$v;

  bool _me;
  bool get me => _$this._me;
  set me(bool me) => _$this._me = me;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  String _helpTitle;
  String get helpTitle => _$this._helpTitle;
  set helpTitle(String helpTitle) => _$this._helpTitle = helpTitle;

  String _helpContent;
  String get helpContent => _$this._helpContent;
  set helpContent(String helpContent) => _$this._helpContent = helpContent;

  MessageWithHelpChatViewModelBuilder();

  MessageWithHelpChatViewModelBuilder get _$this {
    if (_$v != null) {
      _me = _$v.me;
      _message = _$v.message;
      _helpTitle = _$v.helpTitle;
      _helpContent = _$v.helpContent;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessageWithHelpChatViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MessageWithHelpChatViewModel;
  }

  @override
  void update(void Function(MessageWithHelpChatViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MessageWithHelpChatViewModel build() {
    final _$result = _$v ??
        new _$MessageWithHelpChatViewModel._(
            me: me,
            message: message,
            helpTitle: helpTitle,
            helpContent: helpContent);
    replace(_$result);
    return _$result;
  }
}

class _$MessageWithHelpTypeChatViewModel<T>
    extends MessageWithHelpTypeChatViewModel<T> {
  @override
  final bool me;
  @override
  final T messageType;
  @override
  final Map<String, String> data;

  factory _$MessageWithHelpTypeChatViewModel(
          [void Function(MessageWithHelpTypeChatViewModelBuilder<T>)
              updates]) =>
      (new MessageWithHelpTypeChatViewModelBuilder<T>()..update(updates))
          .build();

  _$MessageWithHelpTypeChatViewModel._({this.me, this.messageType, this.data})
      : super._() {
    if (me == null) {
      throw new BuiltValueNullFieldError(
          'MessageWithHelpTypeChatViewModel', 'me');
    }
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(
          'MessageWithHelpTypeChatViewModel', 'T');
    }
  }

  @override
  MessageWithHelpTypeChatViewModel<T> rebuild(
          void Function(MessageWithHelpTypeChatViewModelBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageWithHelpTypeChatViewModelBuilder<T> toBuilder() =>
      new MessageWithHelpTypeChatViewModelBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessageWithHelpTypeChatViewModel &&
        me == other.me &&
        messageType == other.messageType &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, me.hashCode), messageType.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MessageWithHelpTypeChatViewModel')
          ..add('me', me)
          ..add('messageType', messageType)
          ..add('data', data))
        .toString();
  }
}

class MessageWithHelpTypeChatViewModelBuilder<T>
    implements
        Builder<MessageWithHelpTypeChatViewModel<T>,
            MessageWithHelpTypeChatViewModelBuilder<T>> {
  _$MessageWithHelpTypeChatViewModel<T> _$v;

  bool _me;
  bool get me => _$this._me;
  set me(bool me) => _$this._me = me;

  T _messageType;
  T get messageType => _$this._messageType;
  set messageType(T messageType) => _$this._messageType = messageType;

  Map<String, String> _data;
  Map<String, String> get data => _$this._data;
  set data(Map<String, String> data) => _$this._data = data;

  MessageWithHelpTypeChatViewModelBuilder();

  MessageWithHelpTypeChatViewModelBuilder<T> get _$this {
    if (_$v != null) {
      _me = _$v.me;
      _messageType = _$v.messageType;
      _data = _$v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessageWithHelpTypeChatViewModel<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MessageWithHelpTypeChatViewModel<T>;
  }

  @override
  void update(
      void Function(MessageWithHelpTypeChatViewModelBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MessageWithHelpTypeChatViewModel<T> build() {
    final _$result = _$v ??
        new _$MessageWithHelpTypeChatViewModel<T>._(
            me: me, messageType: messageType, data: data);
    replace(_$result);
    return _$result;
  }
}

class _$MessageTypeChatViewModel<T> extends MessageTypeChatViewModel<T> {
  @override
  final bool me;
  @override
  final T messageType;
  @override
  final Map<String, String> data;
  @override
  final dynamic Function() dataResolver;

  factory _$MessageTypeChatViewModel(
          [void Function(MessageTypeChatViewModelBuilder<T>) updates]) =>
      (new MessageTypeChatViewModelBuilder<T>()..update(updates)).build();

  _$MessageTypeChatViewModel._(
      {this.me, this.messageType, this.data, this.dataResolver})
      : super._() {
    if (me == null) {
      throw new BuiltValueNullFieldError('MessageTypeChatViewModel', 'me');
    }
    if (messageType == null) {
      throw new BuiltValueNullFieldError(
          'MessageTypeChatViewModel', 'messageType');
    }
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('MessageTypeChatViewModel', 'T');
    }
  }

  @override
  MessageTypeChatViewModel<T> rebuild(
          void Function(MessageTypeChatViewModelBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageTypeChatViewModelBuilder<T> toBuilder() =>
      new MessageTypeChatViewModelBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is MessageTypeChatViewModel &&
        me == other.me &&
        messageType == other.messageType &&
        data == other.data &&
        dataResolver == _$dynamicOther.dataResolver;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, me.hashCode), messageType.hashCode), data.hashCode),
        dataResolver.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MessageTypeChatViewModel')
          ..add('me', me)
          ..add('messageType', messageType)
          ..add('data', data)
          ..add('dataResolver', dataResolver))
        .toString();
  }
}

class MessageTypeChatViewModelBuilder<T>
    implements
        Builder<MessageTypeChatViewModel<T>,
            MessageTypeChatViewModelBuilder<T>> {
  _$MessageTypeChatViewModel<T> _$v;

  bool _me;
  bool get me => _$this._me;
  set me(bool me) => _$this._me = me;

  T _messageType;
  T get messageType => _$this._messageType;
  set messageType(T messageType) => _$this._messageType = messageType;

  Map<String, String> _data;
  Map<String, String> get data => _$this._data;
  set data(Map<String, String> data) => _$this._data = data;

  dynamic Function() _dataResolver;
  dynamic Function() get dataResolver => _$this._dataResolver;
  set dataResolver(dynamic Function() dataResolver) =>
      _$this._dataResolver = dataResolver;

  MessageTypeChatViewModelBuilder();

  MessageTypeChatViewModelBuilder<T> get _$this {
    if (_$v != null) {
      _me = _$v.me;
      _messageType = _$v.messageType;
      _data = _$v.data;
      _dataResolver = _$v.dataResolver;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessageTypeChatViewModel<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MessageTypeChatViewModel<T>;
  }

  @override
  void update(void Function(MessageTypeChatViewModelBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MessageTypeChatViewModel<T> build() {
    final _$result = _$v ??
        new _$MessageTypeChatViewModel<T>._(
            me: me,
            messageType: messageType,
            data: data,
            dataResolver: dataResolver);
    replace(_$result);
    return _$result;
  }
}

class _$CardViewModel extends CardViewModel {
  @override
  final String title;
  @override
  final String description;
  @override
  final bool urgent;

  factory _$CardViewModel([void Function(CardViewModelBuilder) updates]) =>
      (new CardViewModelBuilder()..update(updates)).build();

  _$CardViewModel._({this.title, this.description, this.urgent}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('CardViewModel', 'title');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('CardViewModel', 'description');
    }
    if (urgent == null) {
      throw new BuiltValueNullFieldError('CardViewModel', 'urgent');
    }
  }

  @override
  CardViewModel rebuild(void Function(CardViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CardViewModelBuilder toBuilder() => new CardViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CardViewModel &&
        title == other.title &&
        description == other.description &&
        urgent == other.urgent;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, title.hashCode), description.hashCode), urgent.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CardViewModel')
          ..add('title', title)
          ..add('description', description)
          ..add('urgent', urgent))
        .toString();
  }
}

class CardViewModelBuilder
    implements Builder<CardViewModel, CardViewModelBuilder> {
  _$CardViewModel _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  bool _urgent;
  bool get urgent => _$this._urgent;
  set urgent(bool urgent) => _$this._urgent = urgent;

  CardViewModelBuilder();

  CardViewModelBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _description = _$v.description;
      _urgent = _$v.urgent;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CardViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CardViewModel;
  }

  @override
  void update(void Function(CardViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CardViewModel build() {
    final _$result = _$v ??
        new _$CardViewModel._(
            title: title, description: description, urgent: urgent);
    replace(_$result);
    return _$result;
  }
}

class _$NutribotRecommendationViewModel
    extends NutribotRecommendationViewModel {
  @override
  final NutribotChatMessageType titleType;
  @override
  final NutribotChatMessageType descriptionType;
  @override
  final NutribotChatMessageType subDescriptionType;
  @override
  final FoodRecommended data;
  @override
  final String petName;
  @override
  final String recipe;
  @override
  final String treats;

  factory _$NutribotRecommendationViewModel(
          [void Function(NutribotRecommendationViewModelBuilder) updates]) =>
      (new NutribotRecommendationViewModelBuilder()..update(updates)).build();

  _$NutribotRecommendationViewModel._(
      {this.titleType,
      this.descriptionType,
      this.subDescriptionType,
      this.data,
      this.petName,
      this.recipe,
      this.treats})
      : super._() {
    if (titleType == null) {
      throw new BuiltValueNullFieldError(
          'NutribotRecommendationViewModel', 'titleType');
    }
    if (descriptionType == null) {
      throw new BuiltValueNullFieldError(
          'NutribotRecommendationViewModel', 'descriptionType');
    }
    if (subDescriptionType == null) {
      throw new BuiltValueNullFieldError(
          'NutribotRecommendationViewModel', 'subDescriptionType');
    }
    if (data == null) {
      throw new BuiltValueNullFieldError(
          'NutribotRecommendationViewModel', 'data');
    }
    if (petName == null) {
      throw new BuiltValueNullFieldError(
          'NutribotRecommendationViewModel', 'petName');
    }
    if (recipe == null) {
      throw new BuiltValueNullFieldError(
          'NutribotRecommendationViewModel', 'recipe');
    }
    if (treats == null) {
      throw new BuiltValueNullFieldError(
          'NutribotRecommendationViewModel', 'treats');
    }
  }

  @override
  NutribotRecommendationViewModel rebuild(
          void Function(NutribotRecommendationViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NutribotRecommendationViewModelBuilder toBuilder() =>
      new NutribotRecommendationViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NutribotRecommendationViewModel &&
        titleType == other.titleType &&
        descriptionType == other.descriptionType &&
        subDescriptionType == other.subDescriptionType &&
        data == other.data &&
        petName == other.petName &&
        recipe == other.recipe &&
        treats == other.treats;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc(0, titleType.hashCode),
                            descriptionType.hashCode),
                        subDescriptionType.hashCode),
                    data.hashCode),
                petName.hashCode),
            recipe.hashCode),
        treats.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NutribotRecommendationViewModel')
          ..add('titleType', titleType)
          ..add('descriptionType', descriptionType)
          ..add('subDescriptionType', subDescriptionType)
          ..add('data', data)
          ..add('petName', petName)
          ..add('recipe', recipe)
          ..add('treats', treats))
        .toString();
  }
}

class NutribotRecommendationViewModelBuilder
    implements
        Builder<NutribotRecommendationViewModel,
            NutribotRecommendationViewModelBuilder> {
  _$NutribotRecommendationViewModel _$v;

  NutribotChatMessageType _titleType;
  NutribotChatMessageType get titleType => _$this._titleType;
  set titleType(NutribotChatMessageType titleType) =>
      _$this._titleType = titleType;

  NutribotChatMessageType _descriptionType;
  NutribotChatMessageType get descriptionType => _$this._descriptionType;
  set descriptionType(NutribotChatMessageType descriptionType) =>
      _$this._descriptionType = descriptionType;

  NutribotChatMessageType _subDescriptionType;
  NutribotChatMessageType get subDescriptionType => _$this._subDescriptionType;
  set subDescriptionType(NutribotChatMessageType subDescriptionType) =>
      _$this._subDescriptionType = subDescriptionType;

  FoodRecommended _data;
  FoodRecommended get data => _$this._data;
  set data(FoodRecommended data) => _$this._data = data;

  String _petName;
  String get petName => _$this._petName;
  set petName(String petName) => _$this._petName = petName;

  String _recipe;
  String get recipe => _$this._recipe;
  set recipe(String recipe) => _$this._recipe = recipe;

  String _treats;
  String get treats => _$this._treats;
  set treats(String treats) => _$this._treats = treats;

  NutribotRecommendationViewModelBuilder();

  NutribotRecommendationViewModelBuilder get _$this {
    if (_$v != null) {
      _titleType = _$v.titleType;
      _descriptionType = _$v.descriptionType;
      _subDescriptionType = _$v.subDescriptionType;
      _data = _$v.data;
      _petName = _$v.petName;
      _recipe = _$v.recipe;
      _treats = _$v.treats;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NutribotRecommendationViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NutribotRecommendationViewModel;
  }

  @override
  void update(void Function(NutribotRecommendationViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NutribotRecommendationViewModel build() {
    final _$result = _$v ??
        new _$NutribotRecommendationViewModel._(
            titleType: titleType,
            descriptionType: descriptionType,
            subDescriptionType: subDescriptionType,
            data: data,
            petName: petName,
            recipe: recipe,
            treats: treats);
    replace(_$result);
    return _$result;
  }
}

class _$OptionViewModel<T> extends OptionViewModel<T> {
  @override
  final T key;
  @override
  final String description;

  factory _$OptionViewModel(
          [void Function(OptionViewModelBuilder<T>) updates]) =>
      (new OptionViewModelBuilder<T>()..update(updates)).build();

  _$OptionViewModel._({this.key, this.description}) : super._() {
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('OptionViewModel', 'T');
    }
  }

  @override
  OptionViewModel<T> rebuild(
          void Function(OptionViewModelBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OptionViewModelBuilder<T> toBuilder() =>
      new OptionViewModelBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OptionViewModel &&
        key == other.key &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, key.hashCode), description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OptionViewModel')
          ..add('key', key)
          ..add('description', description))
        .toString();
  }
}

class OptionViewModelBuilder<T>
    implements Builder<OptionViewModel<T>, OptionViewModelBuilder<T>> {
  _$OptionViewModel<T> _$v;

  T _key;
  T get key => _$this._key;
  set key(T key) => _$this._key = key;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  OptionViewModelBuilder();

  OptionViewModelBuilder<T> get _$this {
    if (_$v != null) {
      _key = _$v.key;
      _description = _$v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OptionViewModel<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$OptionViewModel<T>;
  }

  @override
  void update(void Function(OptionViewModelBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OptionViewModel<T> build() {
    final _$result =
        _$v ?? new _$OptionViewModel<T>._(key: key, description: description);
    replace(_$result);
    return _$result;
  }
}

class _$CardsListChatViewModel extends CardsListChatViewModel {
  @override
  final List<CardViewModel> items;
  @override
  final String petName;

  factory _$CardsListChatViewModel(
          [void Function(CardsListChatViewModelBuilder) updates]) =>
      (new CardsListChatViewModelBuilder()..update(updates)).build();

  _$CardsListChatViewModel._({this.items, this.petName}) : super._() {
    if (items == null) {
      throw new BuiltValueNullFieldError('CardsListChatViewModel', 'items');
    }
    if (petName == null) {
      throw new BuiltValueNullFieldError('CardsListChatViewModel', 'petName');
    }
  }

  @override
  CardsListChatViewModel rebuild(
          void Function(CardsListChatViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CardsListChatViewModelBuilder toBuilder() =>
      new CardsListChatViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CardsListChatViewModel &&
        items == other.items &&
        petName == other.petName;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, items.hashCode), petName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CardsListChatViewModel')
          ..add('items', items)
          ..add('petName', petName))
        .toString();
  }
}

class CardsListChatViewModelBuilder
    implements Builder<CardsListChatViewModel, CardsListChatViewModelBuilder> {
  _$CardsListChatViewModel _$v;

  List<CardViewModel> _items;
  List<CardViewModel> get items => _$this._items;
  set items(List<CardViewModel> items) => _$this._items = items;

  String _petName;
  String get petName => _$this._petName;
  set petName(String petName) => _$this._petName = petName;

  CardsListChatViewModelBuilder();

  CardsListChatViewModelBuilder get _$this {
    if (_$v != null) {
      _items = _$v.items;
      _petName = _$v.petName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CardsListChatViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CardsListChatViewModel;
  }

  @override
  void update(void Function(CardsListChatViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CardsListChatViewModel build() {
    final _$result =
        _$v ?? new _$CardsListChatViewModel._(items: items, petName: petName);
    replace(_$result);
    return _$result;
  }
}

class _$TextInputSimpleChatViewModel extends TextInputSimpleChatViewModel {
  @override
  final ChatFlow chatFlow;

  factory _$TextInputSimpleChatViewModel(
          [void Function(TextInputSimpleChatViewModelBuilder) updates]) =>
      (new TextInputSimpleChatViewModelBuilder()..update(updates)).build();

  _$TextInputSimpleChatViewModel._({this.chatFlow}) : super._() {
    if (chatFlow == null) {
      throw new BuiltValueNullFieldError(
          'TextInputSimpleChatViewModel', 'chatFlow');
    }
  }

  @override
  TextInputSimpleChatViewModel rebuild(
          void Function(TextInputSimpleChatViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextInputSimpleChatViewModelBuilder toBuilder() =>
      new TextInputSimpleChatViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextInputSimpleChatViewModel && chatFlow == other.chatFlow;
  }

  @override
  int get hashCode {
    return $jf($jc(0, chatFlow.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TextInputSimpleChatViewModel')
          ..add('chatFlow', chatFlow))
        .toString();
  }
}

class TextInputSimpleChatViewModelBuilder
    implements
        Builder<TextInputSimpleChatViewModel,
            TextInputSimpleChatViewModelBuilder> {
  _$TextInputSimpleChatViewModel _$v;

  ChatFlow _chatFlow;
  ChatFlow get chatFlow => _$this._chatFlow;
  set chatFlow(ChatFlow chatFlow) => _$this._chatFlow = chatFlow;

  TextInputSimpleChatViewModelBuilder();

  TextInputSimpleChatViewModelBuilder get _$this {
    if (_$v != null) {
      _chatFlow = _$v.chatFlow;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TextInputSimpleChatViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TextInputSimpleChatViewModel;
  }

  @override
  void update(void Function(TextInputSimpleChatViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TextInputSimpleChatViewModel build() {
    final _$result =
        _$v ?? new _$TextInputSimpleChatViewModel._(chatFlow: chatFlow);
    replace(_$result);
    return _$result;
  }
}

class _$TextInputCompoundChatViewModel extends TextInputCompoundChatViewModel {
  @override
  final ChatFlow chatFlow;

  factory _$TextInputCompoundChatViewModel(
          [void Function(TextInputCompoundChatViewModelBuilder) updates]) =>
      (new TextInputCompoundChatViewModelBuilder()..update(updates)).build();

  _$TextInputCompoundChatViewModel._({this.chatFlow}) : super._() {
    if (chatFlow == null) {
      throw new BuiltValueNullFieldError(
          'TextInputCompoundChatViewModel', 'chatFlow');
    }
  }

  @override
  TextInputCompoundChatViewModel rebuild(
          void Function(TextInputCompoundChatViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextInputCompoundChatViewModelBuilder toBuilder() =>
      new TextInputCompoundChatViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextInputCompoundChatViewModel &&
        chatFlow == other.chatFlow;
  }

  @override
  int get hashCode {
    return $jf($jc(0, chatFlow.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TextInputCompoundChatViewModel')
          ..add('chatFlow', chatFlow))
        .toString();
  }
}

class TextInputCompoundChatViewModelBuilder
    implements
        Builder<TextInputCompoundChatViewModel,
            TextInputCompoundChatViewModelBuilder> {
  _$TextInputCompoundChatViewModel _$v;

  ChatFlow _chatFlow;
  ChatFlow get chatFlow => _$this._chatFlow;
  set chatFlow(ChatFlow chatFlow) => _$this._chatFlow = chatFlow;

  TextInputCompoundChatViewModelBuilder();

  TextInputCompoundChatViewModelBuilder get _$this {
    if (_$v != null) {
      _chatFlow = _$v.chatFlow;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TextInputCompoundChatViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TextInputCompoundChatViewModel;
  }

  @override
  void update(void Function(TextInputCompoundChatViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TextInputCompoundChatViewModel build() {
    final _$result =
        _$v ?? new _$TextInputCompoundChatViewModel._(chatFlow: chatFlow);
    replace(_$result);
    return _$result;
  }
}

class _$PhoneNumberInputChatViewModel extends PhoneNumberInputChatViewModel {
  @override
  final ChatFlow chatFlow;

  factory _$PhoneNumberInputChatViewModel(
          [void Function(PhoneNumberInputChatViewModelBuilder) updates]) =>
      (new PhoneNumberInputChatViewModelBuilder()..update(updates)).build();

  _$PhoneNumberInputChatViewModel._({this.chatFlow}) : super._() {
    if (chatFlow == null) {
      throw new BuiltValueNullFieldError(
          'PhoneNumberInputChatViewModel', 'chatFlow');
    }
  }

  @override
  PhoneNumberInputChatViewModel rebuild(
          void Function(PhoneNumberInputChatViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneNumberInputChatViewModelBuilder toBuilder() =>
      new PhoneNumberInputChatViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneNumberInputChatViewModel && chatFlow == other.chatFlow;
  }

  @override
  int get hashCode {
    return $jf($jc(0, chatFlow.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PhoneNumberInputChatViewModel')
          ..add('chatFlow', chatFlow))
        .toString();
  }
}

class PhoneNumberInputChatViewModelBuilder
    implements
        Builder<PhoneNumberInputChatViewModel,
            PhoneNumberInputChatViewModelBuilder> {
  _$PhoneNumberInputChatViewModel _$v;

  ChatFlow _chatFlow;
  ChatFlow get chatFlow => _$this._chatFlow;
  set chatFlow(ChatFlow chatFlow) => _$this._chatFlow = chatFlow;

  PhoneNumberInputChatViewModelBuilder();

  PhoneNumberInputChatViewModelBuilder get _$this {
    if (_$v != null) {
      _chatFlow = _$v.chatFlow;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhoneNumberInputChatViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneNumberInputChatViewModel;
  }

  @override
  void update(void Function(PhoneNumberInputChatViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneNumberInputChatViewModel build() {
    final _$result =
        _$v ?? new _$PhoneNumberInputChatViewModel._(chatFlow: chatFlow);
    replace(_$result);
    return _$result;
  }
}

class _$TextInputAndSingleOptionsSelectorViewModel
    extends TextInputAndSingleOptionsSelectorViewModel {
  @override
  final List<OptionViewModel> items;
  @override
  final ChatFlow chatFlow;

  factory _$TextInputAndSingleOptionsSelectorViewModel(
          [void Function(TextInputAndSingleOptionsSelectorViewModelBuilder)
              updates]) =>
      (new TextInputAndSingleOptionsSelectorViewModelBuilder()..update(updates))
          .build();

  _$TextInputAndSingleOptionsSelectorViewModel._({this.items, this.chatFlow})
      : super._() {
    if (items == null) {
      throw new BuiltValueNullFieldError(
          'TextInputAndSingleOptionsSelectorViewModel', 'items');
    }
    if (chatFlow == null) {
      throw new BuiltValueNullFieldError(
          'TextInputAndSingleOptionsSelectorViewModel', 'chatFlow');
    }
  }

  @override
  TextInputAndSingleOptionsSelectorViewModel rebuild(
          void Function(TextInputAndSingleOptionsSelectorViewModelBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextInputAndSingleOptionsSelectorViewModelBuilder toBuilder() =>
      new TextInputAndSingleOptionsSelectorViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextInputAndSingleOptionsSelectorViewModel &&
        items == other.items &&
        chatFlow == other.chatFlow;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, items.hashCode), chatFlow.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'TextInputAndSingleOptionsSelectorViewModel')
          ..add('items', items)
          ..add('chatFlow', chatFlow))
        .toString();
  }
}

class TextInputAndSingleOptionsSelectorViewModelBuilder
    implements
        Builder<TextInputAndSingleOptionsSelectorViewModel,
            TextInputAndSingleOptionsSelectorViewModelBuilder> {
  _$TextInputAndSingleOptionsSelectorViewModel _$v;

  List<OptionViewModel> _items;
  List<OptionViewModel> get items => _$this._items;
  set items(List<OptionViewModel> items) => _$this._items = items;

  ChatFlow _chatFlow;
  ChatFlow get chatFlow => _$this._chatFlow;
  set chatFlow(ChatFlow chatFlow) => _$this._chatFlow = chatFlow;

  TextInputAndSingleOptionsSelectorViewModelBuilder();

  TextInputAndSingleOptionsSelectorViewModelBuilder get _$this {
    if (_$v != null) {
      _items = _$v.items;
      _chatFlow = _$v.chatFlow;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TextInputAndSingleOptionsSelectorViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TextInputAndSingleOptionsSelectorViewModel;
  }

  @override
  void update(
      void Function(TextInputAndSingleOptionsSelectorViewModelBuilder)
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TextInputAndSingleOptionsSelectorViewModel build() {
    final _$result = _$v ??
        new _$TextInputAndSingleOptionsSelectorViewModel._(
            items: items, chatFlow: chatFlow);
    replace(_$result);
    return _$result;
  }
}

class _$ButtonInputChatViewModel extends ButtonInputChatViewModel {
  @override
  final ChatViewModelAction action;
  @override
  final dynamic Function() dataResolver;

  factory _$ButtonInputChatViewModel(
          [void Function(ButtonInputChatViewModelBuilder) updates]) =>
      (new ButtonInputChatViewModelBuilder()..update(updates)).build();

  _$ButtonInputChatViewModel._({this.action, this.dataResolver}) : super._() {
    if (action == null) {
      throw new BuiltValueNullFieldError('ButtonInputChatViewModel', 'action');
    }
    if (dataResolver == null) {
      throw new BuiltValueNullFieldError(
          'ButtonInputChatViewModel', 'dataResolver');
    }
  }

  @override
  ButtonInputChatViewModel rebuild(
          void Function(ButtonInputChatViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ButtonInputChatViewModelBuilder toBuilder() =>
      new ButtonInputChatViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is ButtonInputChatViewModel &&
        action == other.action &&
        dataResolver == _$dynamicOther.dataResolver;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, action.hashCode), dataResolver.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ButtonInputChatViewModel')
          ..add('action', action)
          ..add('dataResolver', dataResolver))
        .toString();
  }
}

class ButtonInputChatViewModelBuilder
    implements
        Builder<ButtonInputChatViewModel, ButtonInputChatViewModelBuilder> {
  _$ButtonInputChatViewModel _$v;

  ChatViewModelAction _action;
  ChatViewModelAction get action => _$this._action;
  set action(ChatViewModelAction action) => _$this._action = action;

  dynamic Function() _dataResolver;
  dynamic Function() get dataResolver => _$this._dataResolver;
  set dataResolver(dynamic Function() dataResolver) =>
      _$this._dataResolver = dataResolver;

  ButtonInputChatViewModelBuilder();

  ButtonInputChatViewModelBuilder get _$this {
    if (_$v != null) {
      _action = _$v.action;
      _dataResolver = _$v.dataResolver;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ButtonInputChatViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ButtonInputChatViewModel;
  }

  @override
  void update(void Function(ButtonInputChatViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ButtonInputChatViewModel build() {
    final _$result = _$v ??
        new _$ButtonInputChatViewModel._(
            action: action, dataResolver: dataResolver);
    replace(_$result);
    return _$result;
  }
}

class _$ButtonOutputChatViewModel extends ButtonOutputChatViewModel {
  @override
  final bool me;
  @override
  final ChatViewModelAction action;
  @override
  final dynamic Function() dataResolver;

  factory _$ButtonOutputChatViewModel(
          [void Function(ButtonOutputChatViewModelBuilder) updates]) =>
      (new ButtonOutputChatViewModelBuilder()..update(updates)).build();

  _$ButtonOutputChatViewModel._({this.me, this.action, this.dataResolver})
      : super._() {
    if (me == null) {
      throw new BuiltValueNullFieldError('ButtonOutputChatViewModel', 'me');
    }
    if (action == null) {
      throw new BuiltValueNullFieldError('ButtonOutputChatViewModel', 'action');
    }
    if (dataResolver == null) {
      throw new BuiltValueNullFieldError(
          'ButtonOutputChatViewModel', 'dataResolver');
    }
  }

  @override
  ButtonOutputChatViewModel rebuild(
          void Function(ButtonOutputChatViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ButtonOutputChatViewModelBuilder toBuilder() =>
      new ButtonOutputChatViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is ButtonOutputChatViewModel &&
        me == other.me &&
        action == other.action &&
        dataResolver == _$dynamicOther.dataResolver;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, me.hashCode), action.hashCode), dataResolver.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ButtonOutputChatViewModel')
          ..add('me', me)
          ..add('action', action)
          ..add('dataResolver', dataResolver))
        .toString();
  }
}

class ButtonOutputChatViewModelBuilder
    implements
        Builder<ButtonOutputChatViewModel, ButtonOutputChatViewModelBuilder> {
  _$ButtonOutputChatViewModel _$v;

  bool _me;
  bool get me => _$this._me;
  set me(bool me) => _$this._me = me;

  ChatViewModelAction _action;
  ChatViewModelAction get action => _$this._action;
  set action(ChatViewModelAction action) => _$this._action = action;

  dynamic Function() _dataResolver;
  dynamic Function() get dataResolver => _$this._dataResolver;
  set dataResolver(dynamic Function() dataResolver) =>
      _$this._dataResolver = dataResolver;

  ButtonOutputChatViewModelBuilder();

  ButtonOutputChatViewModelBuilder get _$this {
    if (_$v != null) {
      _me = _$v.me;
      _action = _$v.action;
      _dataResolver = _$v.dataResolver;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ButtonOutputChatViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ButtonOutputChatViewModel;
  }

  @override
  void update(void Function(ButtonOutputChatViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ButtonOutputChatViewModel build() {
    final _$result = _$v ??
        new _$ButtonOutputChatViewModel._(
            me: me, action: action, dataResolver: dataResolver);
    replace(_$result);
    return _$result;
  }
}

class _$ButtonsInputChatViewModel<T> extends ButtonsInputChatViewModel<T> {
  @override
  final List<T> items;
  @override
  final Map<String, String> data;

  factory _$ButtonsInputChatViewModel(
          [void Function(ButtonsInputChatViewModelBuilder<T>) updates]) =>
      (new ButtonsInputChatViewModelBuilder<T>()..update(updates)).build();

  _$ButtonsInputChatViewModel._({this.items, this.data}) : super._() {
    if (items == null) {
      throw new BuiltValueNullFieldError('ButtonsInputChatViewModel', 'items');
    }
    if (data == null) {
      throw new BuiltValueNullFieldError('ButtonsInputChatViewModel', 'data');
    }
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(
          'ButtonsInputChatViewModel', 'T');
    }
  }

  @override
  ButtonsInputChatViewModel<T> rebuild(
          void Function(ButtonsInputChatViewModelBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ButtonsInputChatViewModelBuilder<T> toBuilder() =>
      new ButtonsInputChatViewModelBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ButtonsInputChatViewModel &&
        items == other.items &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, items.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ButtonsInputChatViewModel')
          ..add('items', items)
          ..add('data', data))
        .toString();
  }
}

class ButtonsInputChatViewModelBuilder<T>
    implements
        Builder<ButtonsInputChatViewModel<T>,
            ButtonsInputChatViewModelBuilder<T>> {
  _$ButtonsInputChatViewModel<T> _$v;

  List<T> _items;
  List<T> get items => _$this._items;
  set items(List<T> items) => _$this._items = items;

  Map<String, String> _data;
  Map<String, String> get data => _$this._data;
  set data(Map<String, String> data) => _$this._data = data;

  ButtonsInputChatViewModelBuilder();

  ButtonsInputChatViewModelBuilder<T> get _$this {
    if (_$v != null) {
      _items = _$v.items;
      _data = _$v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ButtonsInputChatViewModel<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ButtonsInputChatViewModel<T>;
  }

  @override
  void update(void Function(ButtonsInputChatViewModelBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ButtonsInputChatViewModel<T> build() {
    final _$result =
        _$v ?? new _$ButtonsInputChatViewModel<T>._(items: items, data: data);
    replace(_$result);
    return _$result;
  }
}

class _$SingleOptionsSelectorViewModel extends SingleOptionsSelectorViewModel {
  @override
  final List<OptionViewModel> items;
  @override
  final ChatFlow chatFlow;

  factory _$SingleOptionsSelectorViewModel(
          [void Function(SingleOptionsSelectorViewModelBuilder) updates]) =>
      (new SingleOptionsSelectorViewModelBuilder()..update(updates)).build();

  _$SingleOptionsSelectorViewModel._({this.items, this.chatFlow}) : super._() {
    if (items == null) {
      throw new BuiltValueNullFieldError(
          'SingleOptionsSelectorViewModel', 'items');
    }
    if (chatFlow == null) {
      throw new BuiltValueNullFieldError(
          'SingleOptionsSelectorViewModel', 'chatFlow');
    }
  }

  @override
  SingleOptionsSelectorViewModel rebuild(
          void Function(SingleOptionsSelectorViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SingleOptionsSelectorViewModelBuilder toBuilder() =>
      new SingleOptionsSelectorViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SingleOptionsSelectorViewModel &&
        items == other.items &&
        chatFlow == other.chatFlow;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, items.hashCode), chatFlow.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SingleOptionsSelectorViewModel')
          ..add('items', items)
          ..add('chatFlow', chatFlow))
        .toString();
  }
}

class SingleOptionsSelectorViewModelBuilder
    implements
        Builder<SingleOptionsSelectorViewModel,
            SingleOptionsSelectorViewModelBuilder> {
  _$SingleOptionsSelectorViewModel _$v;

  List<OptionViewModel> _items;
  List<OptionViewModel> get items => _$this._items;
  set items(List<OptionViewModel> items) => _$this._items = items;

  ChatFlow _chatFlow;
  ChatFlow get chatFlow => _$this._chatFlow;
  set chatFlow(ChatFlow chatFlow) => _$this._chatFlow = chatFlow;

  SingleOptionsSelectorViewModelBuilder();

  SingleOptionsSelectorViewModelBuilder get _$this {
    if (_$v != null) {
      _items = _$v.items;
      _chatFlow = _$v.chatFlow;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SingleOptionsSelectorViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SingleOptionsSelectorViewModel;
  }

  @override
  void update(void Function(SingleOptionsSelectorViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SingleOptionsSelectorViewModel build() {
    final _$result = _$v ??
        new _$SingleOptionsSelectorViewModel._(
            items: items, chatFlow: chatFlow);
    replace(_$result);
    return _$result;
  }
}

class _$MultipleOptionsSelectorViewModel
    extends MultipleOptionsSelectorViewModel {
  @override
  final List<OptionViewModel> items;
  @override
  final int clearAllItemIndex;
  @override
  final ChatFlow chatFlow;

  factory _$MultipleOptionsSelectorViewModel(
          [void Function(MultipleOptionsSelectorViewModelBuilder) updates]) =>
      (new MultipleOptionsSelectorViewModelBuilder()..update(updates)).build();

  _$MultipleOptionsSelectorViewModel._(
      {this.items, this.clearAllItemIndex, this.chatFlow})
      : super._() {
    if (items == null) {
      throw new BuiltValueNullFieldError(
          'MultipleOptionsSelectorViewModel', 'items');
    }
    if (chatFlow == null) {
      throw new BuiltValueNullFieldError(
          'MultipleOptionsSelectorViewModel', 'chatFlow');
    }
  }

  @override
  MultipleOptionsSelectorViewModel rebuild(
          void Function(MultipleOptionsSelectorViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MultipleOptionsSelectorViewModelBuilder toBuilder() =>
      new MultipleOptionsSelectorViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MultipleOptionsSelectorViewModel &&
        items == other.items &&
        clearAllItemIndex == other.clearAllItemIndex &&
        chatFlow == other.chatFlow;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, items.hashCode), clearAllItemIndex.hashCode),
        chatFlow.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MultipleOptionsSelectorViewModel')
          ..add('items', items)
          ..add('clearAllItemIndex', clearAllItemIndex)
          ..add('chatFlow', chatFlow))
        .toString();
  }
}

class MultipleOptionsSelectorViewModelBuilder
    implements
        Builder<MultipleOptionsSelectorViewModel,
            MultipleOptionsSelectorViewModelBuilder> {
  _$MultipleOptionsSelectorViewModel _$v;

  List<OptionViewModel> _items;
  List<OptionViewModel> get items => _$this._items;
  set items(List<OptionViewModel> items) => _$this._items = items;

  int _clearAllItemIndex;
  int get clearAllItemIndex => _$this._clearAllItemIndex;
  set clearAllItemIndex(int clearAllItemIndex) =>
      _$this._clearAllItemIndex = clearAllItemIndex;

  ChatFlow _chatFlow;
  ChatFlow get chatFlow => _$this._chatFlow;
  set chatFlow(ChatFlow chatFlow) => _$this._chatFlow = chatFlow;

  MultipleOptionsSelectorViewModelBuilder();

  MultipleOptionsSelectorViewModelBuilder get _$this {
    if (_$v != null) {
      _items = _$v.items;
      _clearAllItemIndex = _$v.clearAllItemIndex;
      _chatFlow = _$v.chatFlow;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MultipleOptionsSelectorViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MultipleOptionsSelectorViewModel;
  }

  @override
  void update(void Function(MultipleOptionsSelectorViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MultipleOptionsSelectorViewModel build() {
    final _$result = _$v ??
        new _$MultipleOptionsSelectorViewModel._(
            items: items,
            clearAllItemIndex: clearAllItemIndex,
            chatFlow: chatFlow);
    replace(_$result);
    return _$result;
  }
}

class _$YesNoViewModel extends YesNoViewModel {
  @override
  final ChatFlow chatFlow;

  factory _$YesNoViewModel([void Function(YesNoViewModelBuilder) updates]) =>
      (new YesNoViewModelBuilder()..update(updates)).build();

  _$YesNoViewModel._({this.chatFlow}) : super._() {
    if (chatFlow == null) {
      throw new BuiltValueNullFieldError('YesNoViewModel', 'chatFlow');
    }
  }

  @override
  YesNoViewModel rebuild(void Function(YesNoViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  YesNoViewModelBuilder toBuilder() =>
      new YesNoViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is YesNoViewModel && chatFlow == other.chatFlow;
  }

  @override
  int get hashCode {
    return $jf($jc(0, chatFlow.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('YesNoViewModel')
          ..add('chatFlow', chatFlow))
        .toString();
  }
}

class YesNoViewModelBuilder
    implements Builder<YesNoViewModel, YesNoViewModelBuilder> {
  _$YesNoViewModel _$v;

  ChatFlow _chatFlow;
  ChatFlow get chatFlow => _$this._chatFlow;
  set chatFlow(ChatFlow chatFlow) => _$this._chatFlow = chatFlow;

  YesNoViewModelBuilder();

  YesNoViewModelBuilder get _$this {
    if (_$v != null) {
      _chatFlow = _$v.chatFlow;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(YesNoViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$YesNoViewModel;
  }

  @override
  void update(void Function(YesNoViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$YesNoViewModel build() {
    final _$result = _$v ?? new _$YesNoViewModel._(chatFlow: chatFlow);
    replace(_$result);
    return _$result;
  }
}

class _$AgeSelectorViewModel extends AgeSelectorViewModel {
  @override
  final ChatFlow chatFlow;

  factory _$AgeSelectorViewModel(
          [void Function(AgeSelectorViewModelBuilder) updates]) =>
      (new AgeSelectorViewModelBuilder()..update(updates)).build();

  _$AgeSelectorViewModel._({this.chatFlow}) : super._() {
    if (chatFlow == null) {
      throw new BuiltValueNullFieldError('AgeSelectorViewModel', 'chatFlow');
    }
  }

  @override
  AgeSelectorViewModel rebuild(
          void Function(AgeSelectorViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AgeSelectorViewModelBuilder toBuilder() =>
      new AgeSelectorViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AgeSelectorViewModel && chatFlow == other.chatFlow;
  }

  @override
  int get hashCode {
    return $jf($jc(0, chatFlow.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AgeSelectorViewModel')
          ..add('chatFlow', chatFlow))
        .toString();
  }
}

class AgeSelectorViewModelBuilder
    implements Builder<AgeSelectorViewModel, AgeSelectorViewModelBuilder> {
  _$AgeSelectorViewModel _$v;

  ChatFlow _chatFlow;
  ChatFlow get chatFlow => _$this._chatFlow;
  set chatFlow(ChatFlow chatFlow) => _$this._chatFlow = chatFlow;

  AgeSelectorViewModelBuilder();

  AgeSelectorViewModelBuilder get _$this {
    if (_$v != null) {
      _chatFlow = _$v.chatFlow;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AgeSelectorViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AgeSelectorViewModel;
  }

  @override
  void update(void Function(AgeSelectorViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AgeSelectorViewModel build() {
    final _$result = _$v ?? new _$AgeSelectorViewModel._(chatFlow: chatFlow);
    replace(_$result);
    return _$result;
  }
}

class _$BreedSelectorViewModel extends BreedSelectorViewModel {
  @override
  final ChatFlow chatFlow;
  @override
  final Map<String, String> data;

  factory _$BreedSelectorViewModel(
          [void Function(BreedSelectorViewModelBuilder) updates]) =>
      (new BreedSelectorViewModelBuilder()..update(updates)).build();

  _$BreedSelectorViewModel._({this.chatFlow, this.data}) : super._() {
    if (chatFlow == null) {
      throw new BuiltValueNullFieldError('BreedSelectorViewModel', 'chatFlow');
    }
  }

  @override
  BreedSelectorViewModel rebuild(
          void Function(BreedSelectorViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BreedSelectorViewModelBuilder toBuilder() =>
      new BreedSelectorViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BreedSelectorViewModel &&
        chatFlow == other.chatFlow &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, chatFlow.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BreedSelectorViewModel')
          ..add('chatFlow', chatFlow)
          ..add('data', data))
        .toString();
  }
}

class BreedSelectorViewModelBuilder
    implements Builder<BreedSelectorViewModel, BreedSelectorViewModelBuilder> {
  _$BreedSelectorViewModel _$v;

  ChatFlow _chatFlow;
  ChatFlow get chatFlow => _$this._chatFlow;
  set chatFlow(ChatFlow chatFlow) => _$this._chatFlow = chatFlow;

  Map<String, String> _data;
  Map<String, String> get data => _$this._data;
  set data(Map<String, String> data) => _$this._data = data;

  BreedSelectorViewModelBuilder();

  BreedSelectorViewModelBuilder get _$this {
    if (_$v != null) {
      _chatFlow = _$v.chatFlow;
      _data = _$v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BreedSelectorViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BreedSelectorViewModel;
  }

  @override
  void update(void Function(BreedSelectorViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BreedSelectorViewModel build() {
    final _$result =
        _$v ?? new _$BreedSelectorViewModel._(chatFlow: chatFlow, data: data);
    replace(_$result);
    return _$result;
  }
}

class _$YesNoUnknownViewModel extends YesNoUnknownViewModel {
  @override
  final ChatFlow chatFlow;

  factory _$YesNoUnknownViewModel(
          [void Function(YesNoUnknownViewModelBuilder) updates]) =>
      (new YesNoUnknownViewModelBuilder()..update(updates)).build();

  _$YesNoUnknownViewModel._({this.chatFlow}) : super._() {
    if (chatFlow == null) {
      throw new BuiltValueNullFieldError('YesNoUnknownViewModel', 'chatFlow');
    }
  }

  @override
  YesNoUnknownViewModel rebuild(
          void Function(YesNoUnknownViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  YesNoUnknownViewModelBuilder toBuilder() =>
      new YesNoUnknownViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is YesNoUnknownViewModel && chatFlow == other.chatFlow;
  }

  @override
  int get hashCode {
    return $jf($jc(0, chatFlow.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('YesNoUnknownViewModel')
          ..add('chatFlow', chatFlow))
        .toString();
  }
}

class YesNoUnknownViewModelBuilder
    implements Builder<YesNoUnknownViewModel, YesNoUnknownViewModelBuilder> {
  _$YesNoUnknownViewModel _$v;

  ChatFlow _chatFlow;
  ChatFlow get chatFlow => _$this._chatFlow;
  set chatFlow(ChatFlow chatFlow) => _$this._chatFlow = chatFlow;

  YesNoUnknownViewModelBuilder();

  YesNoUnknownViewModelBuilder get _$this {
    if (_$v != null) {
      _chatFlow = _$v.chatFlow;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(YesNoUnknownViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$YesNoUnknownViewModel;
  }

  @override
  void update(void Function(YesNoUnknownViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$YesNoUnknownViewModel build() {
    final _$result = _$v ?? new _$YesNoUnknownViewModel._(chatFlow: chatFlow);
    replace(_$result);
    return _$result;
  }
}

class _$EmptyChatViewModel extends EmptyChatViewModel {
  factory _$EmptyChatViewModel(
          [void Function(EmptyChatViewModelBuilder) updates]) =>
      (new EmptyChatViewModelBuilder()..update(updates)).build();

  _$EmptyChatViewModel._() : super._();

  @override
  EmptyChatViewModel rebuild(
          void Function(EmptyChatViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmptyChatViewModelBuilder toBuilder() =>
      new EmptyChatViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmptyChatViewModel;
  }

  @override
  int get hashCode {
    return 427742466;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('EmptyChatViewModel').toString();
  }
}

class EmptyChatViewModelBuilder
    implements Builder<EmptyChatViewModel, EmptyChatViewModelBuilder> {
  _$EmptyChatViewModel _$v;

  EmptyChatViewModelBuilder();

  @override
  void replace(EmptyChatViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EmptyChatViewModel;
  }

  @override
  void update(void Function(EmptyChatViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EmptyChatViewModel build() {
    final _$result = _$v ?? new _$EmptyChatViewModel._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
