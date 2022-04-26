// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_vet_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ContactVetState> _$contactVetStateSerializer =
    new _$ContactVetStateSerializer();

class _$ContactVetStateSerializer
    implements StructuredSerializer<ContactVetState> {
  @override
  final Iterable<Type> types = const [ContactVetState, _$ContactVetState];
  @override
  final String wireName = 'ContactVetState';

  @override
  Iterable<Object> serialize(Serializers serializers, ContactVetState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(ContactVetStatus)),
      'symptoms',
      serializers.serialize(object.symptoms,
          specifiedType: const FullType(List, const [const FullType(Symptom)])),
    ];
    if (object.viewModel != null) {
      result
        ..add('viewModel')
        ..add(serializers.serialize(object.viewModel,
            specifiedType: const FullType(ChatViewModel)));
    }
    if (object.type != null) {
      result
        ..add('type')
        ..add(serializers.serialize(object.type,
            specifiedType: const FullType(Flow)));
    }
    if (object.user != null) {
      result
        ..add('user')
        ..add(serializers.serialize(object.user,
            specifiedType: const FullType(User)));
    }
    if (object.pet != null) {
      result
        ..add('pet')
        ..add(serializers.serialize(object.pet,
            specifiedType: const FullType(Pet)));
    }
    if (object.channelType != null) {
      result
        ..add('channelType')
        ..add(serializers.serialize(object.channelType,
            specifiedType: const FullType(ChannelType)));
    }
    return result;
  }

  @override
  ContactVetState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContactVetStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
                  specifiedType: const FullType(ContactVetStatus))
              as ContactVetStatus;
          break;
        case 'viewModel':
          result.viewModel = serializers.deserialize(value,
              specifiedType: const FullType(ChatViewModel)) as ChatViewModel;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(Flow)) as Flow;
          break;
        case 'symptoms':
          result.symptoms = serializers.deserialize(value,
                  specifiedType:
                      const FullType(List, const [const FullType(Symptom)]))
              as List<Symptom>;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(User)) as User;
          break;
        case 'pet':
          result.pet = serializers.deserialize(value,
              specifiedType: const FullType(Pet)) as Pet;
          break;
        case 'channelType':
          result.channelType = serializers.deserialize(value,
              specifiedType: const FullType(ChannelType)) as ChannelType;
          break;
      }
    }

    return result.build();
  }
}

class _$ContactVetState extends ContactVetState {
  @override
  final ContactVetStatus status;
  @override
  final ChatViewModel viewModel;
  @override
  final Flow type;
  @override
  final List<Symptom> symptoms;
  @override
  final User user;
  @override
  final Pet pet;
  @override
  final ChannelType channelType;

  factory _$ContactVetState([void Function(ContactVetStateBuilder) updates]) =>
      (new ContactVetStateBuilder()..update(updates)).build();

  _$ContactVetState._(
      {this.status,
      this.viewModel,
      this.type,
      this.symptoms,
      this.user,
      this.pet,
      this.channelType})
      : super._() {
    if (status == null) {
      throw new BuiltValueNullFieldError('ContactVetState', 'status');
    }
    if (symptoms == null) {
      throw new BuiltValueNullFieldError('ContactVetState', 'symptoms');
    }
  }

  @override
  ContactVetState rebuild(void Function(ContactVetStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactVetStateBuilder toBuilder() =>
      new ContactVetStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactVetState &&
        status == other.status &&
        viewModel == other.viewModel &&
        type == other.type &&
        symptoms == other.symptoms &&
        user == other.user &&
        pet == other.pet &&
        channelType == other.channelType;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, status.hashCode), viewModel.hashCode),
                        type.hashCode),
                    symptoms.hashCode),
                user.hashCode),
            pet.hashCode),
        channelType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ContactVetState')
          ..add('status', status)
          ..add('viewModel', viewModel)
          ..add('type', type)
          ..add('symptoms', symptoms)
          ..add('user', user)
          ..add('pet', pet)
          ..add('channelType', channelType))
        .toString();
  }
}

class ContactVetStateBuilder
    implements Builder<ContactVetState, ContactVetStateBuilder> {
  _$ContactVetState _$v;

  ContactVetStatus _status;
  ContactVetStatus get status => _$this._status;
  set status(ContactVetStatus status) => _$this._status = status;

  ChatViewModel _viewModel;
  ChatViewModel get viewModel => _$this._viewModel;
  set viewModel(ChatViewModel viewModel) => _$this._viewModel = viewModel;

  Flow _type;
  Flow get type => _$this._type;
  set type(Flow type) => _$this._type = type;

  List<Symptom> _symptoms;
  List<Symptom> get symptoms => _$this._symptoms;
  set symptoms(List<Symptom> symptoms) => _$this._symptoms = symptoms;

  User _user;
  User get user => _$this._user;
  set user(User user) => _$this._user = user;

  Pet _pet;
  Pet get pet => _$this._pet;
  set pet(Pet pet) => _$this._pet = pet;

  ChannelType _channelType;
  ChannelType get channelType => _$this._channelType;
  set channelType(ChannelType channelType) => _$this._channelType = channelType;

  ContactVetStateBuilder() {
    ContactVetState._initializeBuilder(this);
  }

  ContactVetStateBuilder get _$this {
    if (_$v != null) {
      _status = _$v.status;
      _viewModel = _$v.viewModel;
      _type = _$v.type;
      _symptoms = _$v.symptoms;
      _user = _$v.user;
      _pet = _$v.pet;
      _channelType = _$v.channelType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContactVetState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ContactVetState;
  }

  @override
  void update(void Function(ContactVetStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ContactVetState build() {
    final _$result = _$v ??
        new _$ContactVetState._(
            status: status,
            viewModel: viewModel,
            type: type,
            symptoms: symptoms,
            user: user,
            pet: pet,
            channelType: channelType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
