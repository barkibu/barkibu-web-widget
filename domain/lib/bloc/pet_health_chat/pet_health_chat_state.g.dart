// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_health_chat_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PetHealthChatInitial> _$petHealthChatInitialSerializer =
    new _$PetHealthChatInitialSerializer();
Serializer<PetHealthChatFlowUpdated> _$petHealthChatFlowUpdatedSerializer =
    new _$PetHealthChatFlowUpdatedSerializer();
Serializer<PetHealthChatInputRequested>
    _$petHealthChatInputRequestedSerializer =
    new _$PetHealthChatInputRequestedSerializer();

class _$PetHealthChatInitialSerializer
    implements StructuredSerializer<PetHealthChatInitial> {
  @override
  final Iterable<Type> types = const [
    PetHealthChatInitial,
    _$PetHealthChatInitial
  ];
  @override
  final String wireName = 'PetHealthChatInitial';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PetHealthChatInitial object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'chatViewModels',
      serializers.serialize(object.chatViewModels,
          specifiedType:
              const FullType(List, const [const FullType(ChatViewModel)])),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(PetHealthChatType)),
      'userQuestion',
      serializers.serialize(object.userQuestion,
          specifiedType: const FullType(String)),
      'isAskAVetComplete',
      serializers.serialize(object.isAskAVetComplete,
          specifiedType: const FullType(bool)),
      'isVirtualVetComplete',
      serializers.serialize(object.isVirtualVetComplete,
          specifiedType: const FullType(bool)),
      'isVideoCallAvailable',
      serializers.serialize(object.isVideoCallAvailable,
          specifiedType: const FullType(bool)),
      'notHappyWithAnswerCount',
      serializers.serialize(object.notHappyWithAnswerCount,
          specifiedType: const FullType(int)),
      'anamnesisResults',
      serializers.serialize(object.anamnesisResults,
          specifiedType: const FullType(Anamnesis)),
      'aiVetModel',
      serializers.serialize(object.aiVetModel,
          specifiedType: const FullType(AiVetModel)),
    ];
    if (object.input != null) {
      result
        ..add('input')
        ..add(serializers.serialize(object.input,
            specifiedType: const FullType(ChatViewModel)));
    }
    if (object.channelType != null) {
      result
        ..add('channelType')
        ..add(serializers.serialize(object.channelType,
            specifiedType: const FullType(ChannelType)));
    }
    if (object.user != null) {
      result
        ..add('user')
        ..add(serializers.serialize(object.user,
            specifiedType: const FullType(User)));
    }
    if (object.lastAssessmentKey != null) {
      result
        ..add('lastAssessmentKey')
        ..add(serializers.serialize(object.lastAssessmentKey,
            specifiedType: const FullType(String)));
    }
    if (object.conditionsShown != null) {
      result
        ..add('conditionsShown')
        ..add(serializers.serialize(object.conditionsShown,
            specifiedType: const FullType(int)));
    }
    if (object.symptomArticlesShown != null) {
      result
        ..add('symptomArticlesShown')
        ..add(serializers.serialize(object.symptomArticlesShown,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  PetHealthChatInitial deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetHealthChatInitialBuilder();

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
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(PetHealthChatType))
              as PetHealthChatType;
          break;
        case 'channelType':
          result.channelType = serializers.deserialize(value,
              specifiedType: const FullType(ChannelType)) as ChannelType;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(User)) as User;
          break;
        case 'userQuestion':
          result.userQuestion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isAskAVetComplete':
          result.isAskAVetComplete = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isVirtualVetComplete':
          result.isVirtualVetComplete = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isVideoCallAvailable':
          result.isVideoCallAvailable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'notHappyWithAnswerCount':
          result.notHappyWithAnswerCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'anamnesisResults':
          result.anamnesisResults = serializers.deserialize(value,
              specifiedType: const FullType(Anamnesis)) as Anamnesis;
          break;
        case 'aiVetModel':
          result.aiVetModel = serializers.deserialize(value,
              specifiedType: const FullType(AiVetModel)) as AiVetModel;
          break;
        case 'lastAssessmentKey':
          result.lastAssessmentKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'conditionsShown':
          result.conditionsShown = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'symptomArticlesShown':
          result.symptomArticlesShown = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$PetHealthChatFlowUpdatedSerializer
    implements StructuredSerializer<PetHealthChatFlowUpdated> {
  @override
  final Iterable<Type> types = const [
    PetHealthChatFlowUpdated,
    _$PetHealthChatFlowUpdated
  ];
  @override
  final String wireName = 'PetHealthChatFlowUpdated';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PetHealthChatFlowUpdated object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'chatViewModels',
      serializers.serialize(object.chatViewModels,
          specifiedType:
              const FullType(List, const [const FullType(ChatViewModel)])),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(PetHealthChatType)),
      'userQuestion',
      serializers.serialize(object.userQuestion,
          specifiedType: const FullType(String)),
      'isAskAVetComplete',
      serializers.serialize(object.isAskAVetComplete,
          specifiedType: const FullType(bool)),
      'isVirtualVetComplete',
      serializers.serialize(object.isVirtualVetComplete,
          specifiedType: const FullType(bool)),
      'isVideoCallAvailable',
      serializers.serialize(object.isVideoCallAvailable,
          specifiedType: const FullType(bool)),
      'notHappyWithAnswerCount',
      serializers.serialize(object.notHappyWithAnswerCount,
          specifiedType: const FullType(int)),
      'anamnesisResults',
      serializers.serialize(object.anamnesisResults,
          specifiedType: const FullType(Anamnesis)),
      'aiVetModel',
      serializers.serialize(object.aiVetModel,
          specifiedType: const FullType(AiVetModel)),
    ];
    if (object.input != null) {
      result
        ..add('input')
        ..add(serializers.serialize(object.input,
            specifiedType: const FullType(ChatViewModel)));
    }
    if (object.channelType != null) {
      result
        ..add('channelType')
        ..add(serializers.serialize(object.channelType,
            specifiedType: const FullType(ChannelType)));
    }
    if (object.user != null) {
      result
        ..add('user')
        ..add(serializers.serialize(object.user,
            specifiedType: const FullType(User)));
    }
    if (object.lastAssessmentKey != null) {
      result
        ..add('lastAssessmentKey')
        ..add(serializers.serialize(object.lastAssessmentKey,
            specifiedType: const FullType(String)));
    }
    if (object.conditionsShown != null) {
      result
        ..add('conditionsShown')
        ..add(serializers.serialize(object.conditionsShown,
            specifiedType: const FullType(int)));
    }
    if (object.symptomArticlesShown != null) {
      result
        ..add('symptomArticlesShown')
        ..add(serializers.serialize(object.symptomArticlesShown,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  PetHealthChatFlowUpdated deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetHealthChatFlowUpdatedBuilder();

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
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(PetHealthChatType))
              as PetHealthChatType;
          break;
        case 'channelType':
          result.channelType = serializers.deserialize(value,
              specifiedType: const FullType(ChannelType)) as ChannelType;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(User)) as User;
          break;
        case 'userQuestion':
          result.userQuestion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isAskAVetComplete':
          result.isAskAVetComplete = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isVirtualVetComplete':
          result.isVirtualVetComplete = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isVideoCallAvailable':
          result.isVideoCallAvailable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'notHappyWithAnswerCount':
          result.notHappyWithAnswerCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'anamnesisResults':
          result.anamnesisResults = serializers.deserialize(value,
              specifiedType: const FullType(Anamnesis)) as Anamnesis;
          break;
        case 'aiVetModel':
          result.aiVetModel = serializers.deserialize(value,
              specifiedType: const FullType(AiVetModel)) as AiVetModel;
          break;
        case 'lastAssessmentKey':
          result.lastAssessmentKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'conditionsShown':
          result.conditionsShown = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'symptomArticlesShown':
          result.symptomArticlesShown = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$PetHealthChatInputRequestedSerializer
    implements StructuredSerializer<PetHealthChatInputRequested> {
  @override
  final Iterable<Type> types = const [
    PetHealthChatInputRequested,
    _$PetHealthChatInputRequested
  ];
  @override
  final String wireName = 'PetHealthChatInputRequested';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PetHealthChatInputRequested object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'chatViewModels',
      serializers.serialize(object.chatViewModels,
          specifiedType:
              const FullType(List, const [const FullType(ChatViewModel)])),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(PetHealthChatType)),
      'userQuestion',
      serializers.serialize(object.userQuestion,
          specifiedType: const FullType(String)),
      'isAskAVetComplete',
      serializers.serialize(object.isAskAVetComplete,
          specifiedType: const FullType(bool)),
      'isVirtualVetComplete',
      serializers.serialize(object.isVirtualVetComplete,
          specifiedType: const FullType(bool)),
      'isVideoCallAvailable',
      serializers.serialize(object.isVideoCallAvailable,
          specifiedType: const FullType(bool)),
      'notHappyWithAnswerCount',
      serializers.serialize(object.notHappyWithAnswerCount,
          specifiedType: const FullType(int)),
      'anamnesisResults',
      serializers.serialize(object.anamnesisResults,
          specifiedType: const FullType(Anamnesis)),
      'aiVetModel',
      serializers.serialize(object.aiVetModel,
          specifiedType: const FullType(AiVetModel)),
    ];
    if (object.input != null) {
      result
        ..add('input')
        ..add(serializers.serialize(object.input,
            specifiedType: const FullType(ChatViewModel)));
    }
    if (object.channelType != null) {
      result
        ..add('channelType')
        ..add(serializers.serialize(object.channelType,
            specifiedType: const FullType(ChannelType)));
    }
    if (object.user != null) {
      result
        ..add('user')
        ..add(serializers.serialize(object.user,
            specifiedType: const FullType(User)));
    }
    if (object.lastAssessmentKey != null) {
      result
        ..add('lastAssessmentKey')
        ..add(serializers.serialize(object.lastAssessmentKey,
            specifiedType: const FullType(String)));
    }
    if (object.conditionsShown != null) {
      result
        ..add('conditionsShown')
        ..add(serializers.serialize(object.conditionsShown,
            specifiedType: const FullType(int)));
    }
    if (object.symptomArticlesShown != null) {
      result
        ..add('symptomArticlesShown')
        ..add(serializers.serialize(object.symptomArticlesShown,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  PetHealthChatInputRequested deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetHealthChatInputRequestedBuilder();

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
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(PetHealthChatType))
              as PetHealthChatType;
          break;
        case 'channelType':
          result.channelType = serializers.deserialize(value,
              specifiedType: const FullType(ChannelType)) as ChannelType;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(User)) as User;
          break;
        case 'userQuestion':
          result.userQuestion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isAskAVetComplete':
          result.isAskAVetComplete = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isVirtualVetComplete':
          result.isVirtualVetComplete = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isVideoCallAvailable':
          result.isVideoCallAvailable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'notHappyWithAnswerCount':
          result.notHappyWithAnswerCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'anamnesisResults':
          result.anamnesisResults = serializers.deserialize(value,
              specifiedType: const FullType(Anamnesis)) as Anamnesis;
          break;
        case 'aiVetModel':
          result.aiVetModel = serializers.deserialize(value,
              specifiedType: const FullType(AiVetModel)) as AiVetModel;
          break;
        case 'lastAssessmentKey':
          result.lastAssessmentKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'conditionsShown':
          result.conditionsShown = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'symptomArticlesShown':
          result.symptomArticlesShown = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$PetHealthChatInitial extends PetHealthChatInitial {
  @override
  final List<ChatViewModel> chatViewModels;
  @override
  final ChatViewModel input;
  @override
  final PetHealthChatType type;
  @override
  final ChannelType channelType;
  @override
  final User user;
  @override
  final String userQuestion;
  @override
  final bool isAskAVetComplete;
  @override
  final bool isVirtualVetComplete;
  @override
  final bool isVideoCallAvailable;
  @override
  final int notHappyWithAnswerCount;
  @override
  final Anamnesis anamnesisResults;
  @override
  final AiVetModel aiVetModel;
  @override
  final String lastAssessmentKey;
  @override
  final int conditionsShown;
  @override
  final int symptomArticlesShown;

  factory _$PetHealthChatInitial(
          [void Function(PetHealthChatInitialBuilder) updates]) =>
      (new PetHealthChatInitialBuilder()..update(updates)).build();

  _$PetHealthChatInitial._(
      {this.chatViewModels,
      this.input,
      this.type,
      this.channelType,
      this.user,
      this.userQuestion,
      this.isAskAVetComplete,
      this.isVirtualVetComplete,
      this.isVideoCallAvailable,
      this.notHappyWithAnswerCount,
      this.anamnesisResults,
      this.aiVetModel,
      this.lastAssessmentKey,
      this.conditionsShown,
      this.symptomArticlesShown})
      : super._() {
    if (chatViewModels == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatInitial', 'chatViewModels');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('PetHealthChatInitial', 'type');
    }
    if (userQuestion == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatInitial', 'userQuestion');
    }
    if (isAskAVetComplete == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatInitial', 'isAskAVetComplete');
    }
    if (isVirtualVetComplete == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatInitial', 'isVirtualVetComplete');
    }
    if (isVideoCallAvailable == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatInitial', 'isVideoCallAvailable');
    }
    if (notHappyWithAnswerCount == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatInitial', 'notHappyWithAnswerCount');
    }
    if (anamnesisResults == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatInitial', 'anamnesisResults');
    }
    if (aiVetModel == null) {
      throw new BuiltValueNullFieldError('PetHealthChatInitial', 'aiVetModel');
    }
  }

  @override
  PetHealthChatInitial rebuild(
          void Function(PetHealthChatInitialBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetHealthChatInitialBuilder toBuilder() =>
      new PetHealthChatInitialBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetHealthChatInitial &&
        chatViewModels == other.chatViewModels &&
        input == other.input &&
        type == other.type &&
        channelType == other.channelType &&
        user == other.user &&
        userQuestion == other.userQuestion &&
        isAskAVetComplete == other.isAskAVetComplete &&
        isVirtualVetComplete == other.isVirtualVetComplete &&
        isVideoCallAvailable == other.isVideoCallAvailable &&
        notHappyWithAnswerCount == other.notHappyWithAnswerCount &&
        anamnesisResults == other.anamnesisResults &&
        aiVetModel == other.aiVetModel &&
        lastAssessmentKey == other.lastAssessmentKey &&
        conditionsShown == other.conditionsShown &&
        symptomArticlesShown == other.symptomArticlesShown;
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
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                0,
                                                                chatViewModels
                                                                    .hashCode),
                                                            input.hashCode),
                                                        type.hashCode),
                                                    channelType.hashCode),
                                                user.hashCode),
                                            userQuestion.hashCode),
                                        isAskAVetComplete.hashCode),
                                    isVirtualVetComplete.hashCode),
                                isVideoCallAvailable.hashCode),
                            notHappyWithAnswerCount.hashCode),
                        anamnesisResults.hashCode),
                    aiVetModel.hashCode),
                lastAssessmentKey.hashCode),
            conditionsShown.hashCode),
        symptomArticlesShown.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetHealthChatInitial')
          ..add('chatViewModels', chatViewModels)
          ..add('input', input)
          ..add('type', type)
          ..add('channelType', channelType)
          ..add('user', user)
          ..add('userQuestion', userQuestion)
          ..add('isAskAVetComplete', isAskAVetComplete)
          ..add('isVirtualVetComplete', isVirtualVetComplete)
          ..add('isVideoCallAvailable', isVideoCallAvailable)
          ..add('notHappyWithAnswerCount', notHappyWithAnswerCount)
          ..add('anamnesisResults', anamnesisResults)
          ..add('aiVetModel', aiVetModel)
          ..add('lastAssessmentKey', lastAssessmentKey)
          ..add('conditionsShown', conditionsShown)
          ..add('symptomArticlesShown', symptomArticlesShown))
        .toString();
  }
}

class PetHealthChatInitialBuilder
    implements Builder<PetHealthChatInitial, PetHealthChatInitialBuilder> {
  _$PetHealthChatInitial _$v;

  List<ChatViewModel> _chatViewModels;
  List<ChatViewModel> get chatViewModels => _$this._chatViewModels;
  set chatViewModels(List<ChatViewModel> chatViewModels) =>
      _$this._chatViewModels = chatViewModels;

  ChatViewModel _input;
  ChatViewModel get input => _$this._input;
  set input(ChatViewModel input) => _$this._input = input;

  PetHealthChatType _type;
  PetHealthChatType get type => _$this._type;
  set type(PetHealthChatType type) => _$this._type = type;

  ChannelType _channelType;
  ChannelType get channelType => _$this._channelType;
  set channelType(ChannelType channelType) => _$this._channelType = channelType;

  User _user;
  User get user => _$this._user;
  set user(User user) => _$this._user = user;

  String _userQuestion;
  String get userQuestion => _$this._userQuestion;
  set userQuestion(String userQuestion) => _$this._userQuestion = userQuestion;

  bool _isAskAVetComplete;
  bool get isAskAVetComplete => _$this._isAskAVetComplete;
  set isAskAVetComplete(bool isAskAVetComplete) =>
      _$this._isAskAVetComplete = isAskAVetComplete;

  bool _isVirtualVetComplete;
  bool get isVirtualVetComplete => _$this._isVirtualVetComplete;
  set isVirtualVetComplete(bool isVirtualVetComplete) =>
      _$this._isVirtualVetComplete = isVirtualVetComplete;

  bool _isVideoCallAvailable;
  bool get isVideoCallAvailable => _$this._isVideoCallAvailable;
  set isVideoCallAvailable(bool isVideoCallAvailable) =>
      _$this._isVideoCallAvailable = isVideoCallAvailable;

  int _notHappyWithAnswerCount;
  int get notHappyWithAnswerCount => _$this._notHappyWithAnswerCount;
  set notHappyWithAnswerCount(int notHappyWithAnswerCount) =>
      _$this._notHappyWithAnswerCount = notHappyWithAnswerCount;

  Anamnesis _anamnesisResults;
  Anamnesis get anamnesisResults => _$this._anamnesisResults;
  set anamnesisResults(Anamnesis anamnesisResults) =>
      _$this._anamnesisResults = anamnesisResults;

  AiVetModel _aiVetModel;
  AiVetModel get aiVetModel => _$this._aiVetModel;
  set aiVetModel(AiVetModel aiVetModel) => _$this._aiVetModel = aiVetModel;

  String _lastAssessmentKey;
  String get lastAssessmentKey => _$this._lastAssessmentKey;
  set lastAssessmentKey(String lastAssessmentKey) =>
      _$this._lastAssessmentKey = lastAssessmentKey;

  int _conditionsShown;
  int get conditionsShown => _$this._conditionsShown;
  set conditionsShown(int conditionsShown) =>
      _$this._conditionsShown = conditionsShown;

  int _symptomArticlesShown;
  int get symptomArticlesShown => _$this._symptomArticlesShown;
  set symptomArticlesShown(int symptomArticlesShown) =>
      _$this._symptomArticlesShown = symptomArticlesShown;

  PetHealthChatInitialBuilder() {
    PetHealthChatInitial._initializeBuilder(this);
  }

  PetHealthChatInitialBuilder get _$this {
    if (_$v != null) {
      _chatViewModels = _$v.chatViewModels;
      _input = _$v.input;
      _type = _$v.type;
      _channelType = _$v.channelType;
      _user = _$v.user;
      _userQuestion = _$v.userQuestion;
      _isAskAVetComplete = _$v.isAskAVetComplete;
      _isVirtualVetComplete = _$v.isVirtualVetComplete;
      _isVideoCallAvailable = _$v.isVideoCallAvailable;
      _notHappyWithAnswerCount = _$v.notHappyWithAnswerCount;
      _anamnesisResults = _$v.anamnesisResults;
      _aiVetModel = _$v.aiVetModel;
      _lastAssessmentKey = _$v.lastAssessmentKey;
      _conditionsShown = _$v.conditionsShown;
      _symptomArticlesShown = _$v.symptomArticlesShown;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetHealthChatInitial other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetHealthChatInitial;
  }

  @override
  void update(void Function(PetHealthChatInitialBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetHealthChatInitial build() {
    final _$result = _$v ??
        new _$PetHealthChatInitial._(
            chatViewModels: chatViewModels,
            input: input,
            type: type,
            channelType: channelType,
            user: user,
            userQuestion: userQuestion,
            isAskAVetComplete: isAskAVetComplete,
            isVirtualVetComplete: isVirtualVetComplete,
            isVideoCallAvailable: isVideoCallAvailable,
            notHappyWithAnswerCount: notHappyWithAnswerCount,
            anamnesisResults: anamnesisResults,
            aiVetModel: aiVetModel,
            lastAssessmentKey: lastAssessmentKey,
            conditionsShown: conditionsShown,
            symptomArticlesShown: symptomArticlesShown);
    replace(_$result);
    return _$result;
  }
}

class _$PetHealthChatFlowUpdated extends PetHealthChatFlowUpdated {
  @override
  final List<ChatViewModel> chatViewModels;
  @override
  final ChatViewModel input;
  @override
  final PetHealthChatType type;
  @override
  final ChannelType channelType;
  @override
  final User user;
  @override
  final String userQuestion;
  @override
  final bool isAskAVetComplete;
  @override
  final bool isVirtualVetComplete;
  @override
  final bool isVideoCallAvailable;
  @override
  final int notHappyWithAnswerCount;
  @override
  final Anamnesis anamnesisResults;
  @override
  final AiVetModel aiVetModel;
  @override
  final String lastAssessmentKey;
  @override
  final int conditionsShown;
  @override
  final int symptomArticlesShown;

  factory _$PetHealthChatFlowUpdated(
          [void Function(PetHealthChatFlowUpdatedBuilder) updates]) =>
      (new PetHealthChatFlowUpdatedBuilder()..update(updates)).build();

  _$PetHealthChatFlowUpdated._(
      {this.chatViewModels,
      this.input,
      this.type,
      this.channelType,
      this.user,
      this.userQuestion,
      this.isAskAVetComplete,
      this.isVirtualVetComplete,
      this.isVideoCallAvailable,
      this.notHappyWithAnswerCount,
      this.anamnesisResults,
      this.aiVetModel,
      this.lastAssessmentKey,
      this.conditionsShown,
      this.symptomArticlesShown})
      : super._() {
    if (chatViewModels == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatFlowUpdated', 'chatViewModels');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('PetHealthChatFlowUpdated', 'type');
    }
    if (userQuestion == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatFlowUpdated', 'userQuestion');
    }
    if (isAskAVetComplete == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatFlowUpdated', 'isAskAVetComplete');
    }
    if (isVirtualVetComplete == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatFlowUpdated', 'isVirtualVetComplete');
    }
    if (isVideoCallAvailable == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatFlowUpdated', 'isVideoCallAvailable');
    }
    if (notHappyWithAnswerCount == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatFlowUpdated', 'notHappyWithAnswerCount');
    }
    if (anamnesisResults == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatFlowUpdated', 'anamnesisResults');
    }
    if (aiVetModel == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatFlowUpdated', 'aiVetModel');
    }
  }

  @override
  PetHealthChatFlowUpdated rebuild(
          void Function(PetHealthChatFlowUpdatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetHealthChatFlowUpdatedBuilder toBuilder() =>
      new PetHealthChatFlowUpdatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetHealthChatFlowUpdated &&
        chatViewModels == other.chatViewModels &&
        input == other.input &&
        type == other.type &&
        channelType == other.channelType &&
        user == other.user &&
        userQuestion == other.userQuestion &&
        isAskAVetComplete == other.isAskAVetComplete &&
        isVirtualVetComplete == other.isVirtualVetComplete &&
        isVideoCallAvailable == other.isVideoCallAvailable &&
        notHappyWithAnswerCount == other.notHappyWithAnswerCount &&
        anamnesisResults == other.anamnesisResults &&
        aiVetModel == other.aiVetModel &&
        lastAssessmentKey == other.lastAssessmentKey &&
        conditionsShown == other.conditionsShown &&
        symptomArticlesShown == other.symptomArticlesShown;
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
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                0,
                                                                chatViewModels
                                                                    .hashCode),
                                                            input.hashCode),
                                                        type.hashCode),
                                                    channelType.hashCode),
                                                user.hashCode),
                                            userQuestion.hashCode),
                                        isAskAVetComplete.hashCode),
                                    isVirtualVetComplete.hashCode),
                                isVideoCallAvailable.hashCode),
                            notHappyWithAnswerCount.hashCode),
                        anamnesisResults.hashCode),
                    aiVetModel.hashCode),
                lastAssessmentKey.hashCode),
            conditionsShown.hashCode),
        symptomArticlesShown.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetHealthChatFlowUpdated')
          ..add('chatViewModels', chatViewModels)
          ..add('input', input)
          ..add('type', type)
          ..add('channelType', channelType)
          ..add('user', user)
          ..add('userQuestion', userQuestion)
          ..add('isAskAVetComplete', isAskAVetComplete)
          ..add('isVirtualVetComplete', isVirtualVetComplete)
          ..add('isVideoCallAvailable', isVideoCallAvailable)
          ..add('notHappyWithAnswerCount', notHappyWithAnswerCount)
          ..add('anamnesisResults', anamnesisResults)
          ..add('aiVetModel', aiVetModel)
          ..add('lastAssessmentKey', lastAssessmentKey)
          ..add('conditionsShown', conditionsShown)
          ..add('symptomArticlesShown', symptomArticlesShown))
        .toString();
  }
}

class PetHealthChatFlowUpdatedBuilder
    implements
        Builder<PetHealthChatFlowUpdated, PetHealthChatFlowUpdatedBuilder> {
  _$PetHealthChatFlowUpdated _$v;

  List<ChatViewModel> _chatViewModels;
  List<ChatViewModel> get chatViewModels => _$this._chatViewModels;
  set chatViewModels(List<ChatViewModel> chatViewModels) =>
      _$this._chatViewModels = chatViewModels;

  ChatViewModel _input;
  ChatViewModel get input => _$this._input;
  set input(ChatViewModel input) => _$this._input = input;

  PetHealthChatType _type;
  PetHealthChatType get type => _$this._type;
  set type(PetHealthChatType type) => _$this._type = type;

  ChannelType _channelType;
  ChannelType get channelType => _$this._channelType;
  set channelType(ChannelType channelType) => _$this._channelType = channelType;

  User _user;
  User get user => _$this._user;
  set user(User user) => _$this._user = user;

  String _userQuestion;
  String get userQuestion => _$this._userQuestion;
  set userQuestion(String userQuestion) => _$this._userQuestion = userQuestion;

  bool _isAskAVetComplete;
  bool get isAskAVetComplete => _$this._isAskAVetComplete;
  set isAskAVetComplete(bool isAskAVetComplete) =>
      _$this._isAskAVetComplete = isAskAVetComplete;

  bool _isVirtualVetComplete;
  bool get isVirtualVetComplete => _$this._isVirtualVetComplete;
  set isVirtualVetComplete(bool isVirtualVetComplete) =>
      _$this._isVirtualVetComplete = isVirtualVetComplete;

  bool _isVideoCallAvailable;
  bool get isVideoCallAvailable => _$this._isVideoCallAvailable;
  set isVideoCallAvailable(bool isVideoCallAvailable) =>
      _$this._isVideoCallAvailable = isVideoCallAvailable;

  int _notHappyWithAnswerCount;
  int get notHappyWithAnswerCount => _$this._notHappyWithAnswerCount;
  set notHappyWithAnswerCount(int notHappyWithAnswerCount) =>
      _$this._notHappyWithAnswerCount = notHappyWithAnswerCount;

  Anamnesis _anamnesisResults;
  Anamnesis get anamnesisResults => _$this._anamnesisResults;
  set anamnesisResults(Anamnesis anamnesisResults) =>
      _$this._anamnesisResults = anamnesisResults;

  AiVetModel _aiVetModel;
  AiVetModel get aiVetModel => _$this._aiVetModel;
  set aiVetModel(AiVetModel aiVetModel) => _$this._aiVetModel = aiVetModel;

  String _lastAssessmentKey;
  String get lastAssessmentKey => _$this._lastAssessmentKey;
  set lastAssessmentKey(String lastAssessmentKey) =>
      _$this._lastAssessmentKey = lastAssessmentKey;

  int _conditionsShown;
  int get conditionsShown => _$this._conditionsShown;
  set conditionsShown(int conditionsShown) =>
      _$this._conditionsShown = conditionsShown;

  int _symptomArticlesShown;
  int get symptomArticlesShown => _$this._symptomArticlesShown;
  set symptomArticlesShown(int symptomArticlesShown) =>
      _$this._symptomArticlesShown = symptomArticlesShown;

  PetHealthChatFlowUpdatedBuilder() {
    PetHealthChatFlowUpdated._initializeBuilder(this);
  }

  PetHealthChatFlowUpdatedBuilder get _$this {
    if (_$v != null) {
      _chatViewModels = _$v.chatViewModels;
      _input = _$v.input;
      _type = _$v.type;
      _channelType = _$v.channelType;
      _user = _$v.user;
      _userQuestion = _$v.userQuestion;
      _isAskAVetComplete = _$v.isAskAVetComplete;
      _isVirtualVetComplete = _$v.isVirtualVetComplete;
      _isVideoCallAvailable = _$v.isVideoCallAvailable;
      _notHappyWithAnswerCount = _$v.notHappyWithAnswerCount;
      _anamnesisResults = _$v.anamnesisResults;
      _aiVetModel = _$v.aiVetModel;
      _lastAssessmentKey = _$v.lastAssessmentKey;
      _conditionsShown = _$v.conditionsShown;
      _symptomArticlesShown = _$v.symptomArticlesShown;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetHealthChatFlowUpdated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetHealthChatFlowUpdated;
  }

  @override
  void update(void Function(PetHealthChatFlowUpdatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetHealthChatFlowUpdated build() {
    final _$result = _$v ??
        new _$PetHealthChatFlowUpdated._(
            chatViewModels: chatViewModels,
            input: input,
            type: type,
            channelType: channelType,
            user: user,
            userQuestion: userQuestion,
            isAskAVetComplete: isAskAVetComplete,
            isVirtualVetComplete: isVirtualVetComplete,
            isVideoCallAvailable: isVideoCallAvailable,
            notHappyWithAnswerCount: notHappyWithAnswerCount,
            anamnesisResults: anamnesisResults,
            aiVetModel: aiVetModel,
            lastAssessmentKey: lastAssessmentKey,
            conditionsShown: conditionsShown,
            symptomArticlesShown: symptomArticlesShown);
    replace(_$result);
    return _$result;
  }
}

class _$PetHealthChatInputRequested extends PetHealthChatInputRequested {
  @override
  final List<ChatViewModel> chatViewModels;
  @override
  final ChatViewModel input;
  @override
  final PetHealthChatType type;
  @override
  final ChannelType channelType;
  @override
  final User user;
  @override
  final String userQuestion;
  @override
  final bool isAskAVetComplete;
  @override
  final bool isVirtualVetComplete;
  @override
  final bool isVideoCallAvailable;
  @override
  final int notHappyWithAnswerCount;
  @override
  final Anamnesis anamnesisResults;
  @override
  final AiVetModel aiVetModel;
  @override
  final String lastAssessmentKey;
  @override
  final int conditionsShown;
  @override
  final int symptomArticlesShown;

  factory _$PetHealthChatInputRequested(
          [void Function(PetHealthChatInputRequestedBuilder) updates]) =>
      (new PetHealthChatInputRequestedBuilder()..update(updates)).build();

  _$PetHealthChatInputRequested._(
      {this.chatViewModels,
      this.input,
      this.type,
      this.channelType,
      this.user,
      this.userQuestion,
      this.isAskAVetComplete,
      this.isVirtualVetComplete,
      this.isVideoCallAvailable,
      this.notHappyWithAnswerCount,
      this.anamnesisResults,
      this.aiVetModel,
      this.lastAssessmentKey,
      this.conditionsShown,
      this.symptomArticlesShown})
      : super._() {
    if (chatViewModels == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatInputRequested', 'chatViewModels');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('PetHealthChatInputRequested', 'type');
    }
    if (userQuestion == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatInputRequested', 'userQuestion');
    }
    if (isAskAVetComplete == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatInputRequested', 'isAskAVetComplete');
    }
    if (isVirtualVetComplete == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatInputRequested', 'isVirtualVetComplete');
    }
    if (isVideoCallAvailable == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatInputRequested', 'isVideoCallAvailable');
    }
    if (notHappyWithAnswerCount == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatInputRequested', 'notHappyWithAnswerCount');
    }
    if (anamnesisResults == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatInputRequested', 'anamnesisResults');
    }
    if (aiVetModel == null) {
      throw new BuiltValueNullFieldError(
          'PetHealthChatInputRequested', 'aiVetModel');
    }
  }

  @override
  PetHealthChatInputRequested rebuild(
          void Function(PetHealthChatInputRequestedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetHealthChatInputRequestedBuilder toBuilder() =>
      new PetHealthChatInputRequestedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetHealthChatInputRequested &&
        chatViewModels == other.chatViewModels &&
        input == other.input &&
        type == other.type &&
        channelType == other.channelType &&
        user == other.user &&
        userQuestion == other.userQuestion &&
        isAskAVetComplete == other.isAskAVetComplete &&
        isVirtualVetComplete == other.isVirtualVetComplete &&
        isVideoCallAvailable == other.isVideoCallAvailable &&
        notHappyWithAnswerCount == other.notHappyWithAnswerCount &&
        anamnesisResults == other.anamnesisResults &&
        aiVetModel == other.aiVetModel &&
        lastAssessmentKey == other.lastAssessmentKey &&
        conditionsShown == other.conditionsShown &&
        symptomArticlesShown == other.symptomArticlesShown;
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
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                0,
                                                                chatViewModels
                                                                    .hashCode),
                                                            input.hashCode),
                                                        type.hashCode),
                                                    channelType.hashCode),
                                                user.hashCode),
                                            userQuestion.hashCode),
                                        isAskAVetComplete.hashCode),
                                    isVirtualVetComplete.hashCode),
                                isVideoCallAvailable.hashCode),
                            notHappyWithAnswerCount.hashCode),
                        anamnesisResults.hashCode),
                    aiVetModel.hashCode),
                lastAssessmentKey.hashCode),
            conditionsShown.hashCode),
        symptomArticlesShown.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetHealthChatInputRequested')
          ..add('chatViewModels', chatViewModels)
          ..add('input', input)
          ..add('type', type)
          ..add('channelType', channelType)
          ..add('user', user)
          ..add('userQuestion', userQuestion)
          ..add('isAskAVetComplete', isAskAVetComplete)
          ..add('isVirtualVetComplete', isVirtualVetComplete)
          ..add('isVideoCallAvailable', isVideoCallAvailable)
          ..add('notHappyWithAnswerCount', notHappyWithAnswerCount)
          ..add('anamnesisResults', anamnesisResults)
          ..add('aiVetModel', aiVetModel)
          ..add('lastAssessmentKey', lastAssessmentKey)
          ..add('conditionsShown', conditionsShown)
          ..add('symptomArticlesShown', symptomArticlesShown))
        .toString();
  }
}

class PetHealthChatInputRequestedBuilder
    implements
        Builder<PetHealthChatInputRequested,
            PetHealthChatInputRequestedBuilder> {
  _$PetHealthChatInputRequested _$v;

  List<ChatViewModel> _chatViewModels;
  List<ChatViewModel> get chatViewModels => _$this._chatViewModels;
  set chatViewModels(List<ChatViewModel> chatViewModels) =>
      _$this._chatViewModels = chatViewModels;

  ChatViewModel _input;
  ChatViewModel get input => _$this._input;
  set input(ChatViewModel input) => _$this._input = input;

  PetHealthChatType _type;
  PetHealthChatType get type => _$this._type;
  set type(PetHealthChatType type) => _$this._type = type;

  ChannelType _channelType;
  ChannelType get channelType => _$this._channelType;
  set channelType(ChannelType channelType) => _$this._channelType = channelType;

  User _user;
  User get user => _$this._user;
  set user(User user) => _$this._user = user;

  String _userQuestion;
  String get userQuestion => _$this._userQuestion;
  set userQuestion(String userQuestion) => _$this._userQuestion = userQuestion;

  bool _isAskAVetComplete;
  bool get isAskAVetComplete => _$this._isAskAVetComplete;
  set isAskAVetComplete(bool isAskAVetComplete) =>
      _$this._isAskAVetComplete = isAskAVetComplete;

  bool _isVirtualVetComplete;
  bool get isVirtualVetComplete => _$this._isVirtualVetComplete;
  set isVirtualVetComplete(bool isVirtualVetComplete) =>
      _$this._isVirtualVetComplete = isVirtualVetComplete;

  bool _isVideoCallAvailable;
  bool get isVideoCallAvailable => _$this._isVideoCallAvailable;
  set isVideoCallAvailable(bool isVideoCallAvailable) =>
      _$this._isVideoCallAvailable = isVideoCallAvailable;

  int _notHappyWithAnswerCount;
  int get notHappyWithAnswerCount => _$this._notHappyWithAnswerCount;
  set notHappyWithAnswerCount(int notHappyWithAnswerCount) =>
      _$this._notHappyWithAnswerCount = notHappyWithAnswerCount;

  Anamnesis _anamnesisResults;
  Anamnesis get anamnesisResults => _$this._anamnesisResults;
  set anamnesisResults(Anamnesis anamnesisResults) =>
      _$this._anamnesisResults = anamnesisResults;

  AiVetModel _aiVetModel;
  AiVetModel get aiVetModel => _$this._aiVetModel;
  set aiVetModel(AiVetModel aiVetModel) => _$this._aiVetModel = aiVetModel;

  String _lastAssessmentKey;
  String get lastAssessmentKey => _$this._lastAssessmentKey;
  set lastAssessmentKey(String lastAssessmentKey) =>
      _$this._lastAssessmentKey = lastAssessmentKey;

  int _conditionsShown;
  int get conditionsShown => _$this._conditionsShown;
  set conditionsShown(int conditionsShown) =>
      _$this._conditionsShown = conditionsShown;

  int _symptomArticlesShown;
  int get symptomArticlesShown => _$this._symptomArticlesShown;
  set symptomArticlesShown(int symptomArticlesShown) =>
      _$this._symptomArticlesShown = symptomArticlesShown;

  PetHealthChatInputRequestedBuilder() {
    PetHealthChatInputRequested._initializeBuilder(this);
  }

  PetHealthChatInputRequestedBuilder get _$this {
    if (_$v != null) {
      _chatViewModels = _$v.chatViewModels;
      _input = _$v.input;
      _type = _$v.type;
      _channelType = _$v.channelType;
      _user = _$v.user;
      _userQuestion = _$v.userQuestion;
      _isAskAVetComplete = _$v.isAskAVetComplete;
      _isVirtualVetComplete = _$v.isVirtualVetComplete;
      _isVideoCallAvailable = _$v.isVideoCallAvailable;
      _notHappyWithAnswerCount = _$v.notHappyWithAnswerCount;
      _anamnesisResults = _$v.anamnesisResults;
      _aiVetModel = _$v.aiVetModel;
      _lastAssessmentKey = _$v.lastAssessmentKey;
      _conditionsShown = _$v.conditionsShown;
      _symptomArticlesShown = _$v.symptomArticlesShown;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetHealthChatInputRequested other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetHealthChatInputRequested;
  }

  @override
  void update(void Function(PetHealthChatInputRequestedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetHealthChatInputRequested build() {
    final _$result = _$v ??
        new _$PetHealthChatInputRequested._(
            chatViewModels: chatViewModels,
            input: input,
            type: type,
            channelType: channelType,
            user: user,
            userQuestion: userQuestion,
            isAskAVetComplete: isAskAVetComplete,
            isVirtualVetComplete: isVirtualVetComplete,
            isVideoCallAvailable: isVideoCallAvailable,
            notHappyWithAnswerCount: notHappyWithAnswerCount,
            anamnesisResults: anamnesisResults,
            aiVetModel: aiVetModel,
            lastAssessmentKey: lastAssessmentKey,
            conditionsShown: conditionsShown,
            symptomArticlesShown: symptomArticlesShown);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
