import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:common_barkibu_dart/bloc/nutribot_chat/nutribot_chat_event.dart';
import 'package:common_barkibu_dart/bloc/pet_health_chat/pet_health_chat_event.dart';
import 'package:common_barkibu_dart/models/consultation_options.dart';
import 'package:common_barkibu_dart/models/pet.dart';
import 'package:common_barkibu_dart/models/user.dart';

part 'contact_vet_event.g.dart';

enum Flow {
  nutribot,
  askAVetDirectly,
  virtualVet,
}

abstract class ContactVetEvent implements PetHealthChatEvent, NutribotChatEvent {}

abstract class ContactVetStarted implements Built<ContactVetStarted, ContactVetStartedBuilder>, ContactVetEvent {
  static Serializer<ContactVetStarted> get serializer => _$contactVetStartedSerializer;

  bool get withQuestion;
  @nullable
  User get user;
  @nullable
  Pet get pet;

  List<Symptom> get symptoms;

  Flow get type;

  ContactVetStarted._();
  static void _initializeBuilder(ContactVetStartedBuilder builder) => builder
    ..withQuestion = false
    ..symptoms = [];
  factory ContactVetStarted([void Function(ContactVetStartedBuilder) updates]) = _$ContactVetStarted;
}

abstract class ContactVetCheckPhoneNumberPressed
    implements Built<ContactVetCheckPhoneNumberPressed, ContactVetCheckPhoneNumberPressedBuilder>, ContactVetEvent {
  static Serializer<ContactVetCheckPhoneNumberPressed> get serializer => _$contactVetCheckPhoneNumberPressedSerializer;
  bool get isPhoneNumberCorrect;

  ContactVetCheckPhoneNumberPressed._();
  factory ContactVetCheckPhoneNumberPressed([void Function(ContactVetCheckPhoneNumberPressedBuilder) updates]) =
      _$ContactVetCheckPhoneNumberPressed;
}

abstract class ContactVetAddPhoneNumberPressed
    implements Built<ContactVetAddPhoneNumberPressed, ContactVetAddPhoneNumberPressedBuilder>, ContactVetEvent {
  static Serializer<ContactVetAddPhoneNumberPressed> get serializer => _$contactVetAddPhoneNumberPressedSerializer;
  String get phoneNumber;

  ContactVetAddPhoneNumberPressed._();
  factory ContactVetAddPhoneNumberPressed([void Function(ContactVetAddPhoneNumberPressedBuilder) updates]) =
      _$ContactVetAddPhoneNumberPressed;
}

abstract class ContactVetPhoneAppointmentScheduled
    implements Built<ContactVetPhoneAppointmentScheduled, ContactVetPhoneAppointmentScheduledBuilder>, ContactVetEvent {
  ContactVetPhoneAppointmentScheduled._();
  factory ContactVetPhoneAppointmentScheduled([void Function(ContactVetPhoneAppointmentScheduledBuilder) updates]) =
      _$ContactVetPhoneAppointmentScheduled;
}

class ContactVetVideoCallOptionPressed extends ContactVetEvent {}

class ContactVetPhoneCallOptionPressed extends ContactVetEvent {}

abstract class ContactVetEmailOptionPressed
    implements Built<ContactVetEmailOptionPressed, ContactVetEmailOptionPressedBuilder>, ContactVetEvent {
  static Serializer<ContactVetEmailOptionPressed> get serializer => _$contactVetEmailOptionPressedSerializer;

  ContactVetEmailOptionPressed._();
  factory ContactVetEmailOptionPressed([void Function(ContactVetEmailOptionPressedBuilder) updates]) =
      _$ContactVetEmailOptionPressed;
}

abstract class ContactVetEmailRedirectionPressed
    implements Built<ContactVetEmailRedirectionPressed, ContactVetEmailRedirectionPressedBuilder>, ContactVetEvent {
  static Serializer<ContactVetEmailRedirectionPressed> get serializer => _$contactVetEmailRedirectionPressedSerializer;

  ContactVetEmailRedirectionPressed._();
  factory ContactVetEmailRedirectionPressed([void Function(ContactVetEmailRedirectionPressedBuilder) updates]) =
      _$ContactVetEmailRedirectionPressed;
}

class ContactVetNoThanksPressed extends ContactVetEvent {}

abstract class ContactVetScheduleAppointmentPressed
    implements
        Built<ContactVetScheduleAppointmentPressed, ContactVetScheduleAppointmentPressedBuilder>,
        ContactVetEvent {
  static Serializer<ContactVetScheduleAppointmentPressed> get serializer =>
      _$contactVetScheduleAppointmentPressedSerializer;

  ContactVetScheduleAppointmentPressed._();
  factory ContactVetScheduleAppointmentPressed([void Function(ContactVetScheduleAppointmentPressedBuilder) updates]) =
      _$ContactVetScheduleAppointmentPressed;
}

abstract class ContactVetChatOptionPressed
    implements Built<ContactVetChatOptionPressed, ContactVetChatOptionPressedBuilder>, ContactVetEvent {
  static Serializer<ContactVetChatOptionPressed> get serializer => _$contactVetChatOptionPressedSerializer;

  ContactVetChatOptionPressed._();
  factory ContactVetChatOptionPressed([void Function(ContactVetChatOptionPressedBuilder) updates]) =
      _$ContactVetChatOptionPressed;
}
