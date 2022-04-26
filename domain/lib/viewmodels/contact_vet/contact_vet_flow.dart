import 'package:common_barkibu_dart/viewmodels/viewmodels.dart';

abstract class ContactVetChatFlow extends ChatFlow implements PetHealthChatFlow, NutribotChatFlow {
  ContactVetChatFlow();

  factory ContactVetChatFlow.talkToAVet() = TalkToAVetAIVetChatFlow;
  factory ContactVetChatFlow.scheduleAppointment() = ScheduleAppointmentChatFlow;
  factory ContactVetChatFlow.checkPhoneNumber() = CheckPhoneNumberAIVetChatFlow;
  factory ContactVetChatFlow.addPhoneNumber() = InputPhoneNumberAIVetChatFlow;
}

class TalkToAVetAIVetChatFlow extends ContactVetChatFlow {}

class ScheduleAppointmentChatFlow extends ContactVetChatFlow {}

class CheckPhoneNumberAIVetChatFlow extends ContactVetChatFlow {}

class InputPhoneNumberAIVetChatFlow extends ContactVetChatFlow {}
