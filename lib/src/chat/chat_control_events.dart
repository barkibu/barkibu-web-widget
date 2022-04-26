import 'package:common_barkibu_dart/viewmodels/viewmodels.dart';

abstract class ChatControlEvent {
  ChatFlow flow;

  ChatControlEvent(this.flow);
}

class SelectOptionConfirmed extends ChatControlEvent {
  OptionViewModel selected;

  SelectOptionConfirmed(flow, this.selected) : super(flow);
}

class MultipleSelectOptionsConfirmed extends ChatControlEvent {
  List<OptionViewModel> selected;

  MultipleSelectOptionsConfirmed(flow, this.selected) : super(flow);
}

class TextEntered extends ChatControlEvent {
  String text;

  TextEntered(flow, this.text) : super(flow);
}

class PhoneNumberEntered extends ChatControlEvent {
  final String phone;
  final String prefix;

  PhoneNumberEntered(flow, this.phone, this.prefix) : super(flow);
}

class YesNoUnkownConfirmed extends ChatControlEvent {
  bool answer;

  YesNoUnkownConfirmed(flow, this.answer) : super(flow);
}

class ChatOptionButtonPressed extends ChatControlEvent {
  ChatButtonOptionType optionType;

  ChatOptionButtonPressed(this.optionType) : super(null);
}

class ChatActionButtonPressed extends ChatControlEvent {
  ButtonInputChatViewModel buttonViewModel;

  ChatActionButtonPressed(this.buttonViewModel) : super(null);
}

class ChatAgeConfirmed extends ChatControlEvent {
  String birthdate;

  ChatAgeConfirmed(flow, this.birthdate) : super(flow);
}

class ChatBreedConfirmed extends ChatControlEvent {
  String breed;
  String breedUuid;
  String size;

  ChatBreedConfirmed(flow, this.breed, this.breedUuid, this.size) : super(flow);
}
