import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:common_barkibu_dart/bloc/contact_vet/contact_vet.dart';
import 'package:common_barkibu_dart/models/consultation_options.dart';
import 'package:common_barkibu_dart/models/pet.dart';
import 'package:common_barkibu_dart/models/user.dart';
import 'package:common_barkibu_dart/viewmodels/chat/chat_viewmodel.dart';

part 'contact_vet_state.g.dart';

enum ContactVetStatus {
  initial,
  presentChoiceInProgress,
  presentChoiceSuccess,

  channelChoiceSuccess,
  channelChoiceSkipped,
  channelChoiceFailure,

  askPhoneInProgress,
  askPhoneSuccess,

  verifyPhoneInProgress,
  verifyPhoneSuccess,
  verifyPhoneFailure,

  schedulePhoneInProgress,
  schedulePhoneSuccess,

  emailRedirectionInProgress,
  emailRedirectionSuccess,
}

abstract class ContactVetState implements Built<ContactVetState, ContactVetStateBuilder> {
  static Serializer<ContactVetState> get serializer => _$contactVetStateSerializer;

  ContactVetStatus get status;

  /// ViewModel to add to the chat UI
  @nullable
  ChatViewModel get viewModel;

  @nullable
  Flow get type;

  List<Symptom> get symptoms;

  @nullable
  User get user;

  @nullable
  Pet get pet;

  @nullable
  ChannelType get channelType;

  ContactVetState._();
  static void _initializeBuilder(ContactVetStateBuilder builder) => builder..symptoms = [];
  factory ContactVetState([void Function(ContactVetStateBuilder) updates]) = _$ContactVetState;
}
