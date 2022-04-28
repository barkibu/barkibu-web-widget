import 'package:common_barkibu_dart/messages/contactMessages.i18n.dart';

class ContactMessages_thewildest extends ContactMessages {
  const ContactMessages_thewildest();

  @override
  AskAVetEmailTemplateContactMessages get askAVetEmailTemplate => AskAVetEmailTemplateContactMessages_thewildest(this);
}

class AskAVetEmailTemplateContactMessages_thewildest extends AskAVetEmailTemplateContactMessages {
  const AskAVetEmailTemplateContactMessages_thewildest(ContactMessages_thewildest _parent) : super(_parent);
  @override
  String petDefinition(String petSpecies, String petName, String petSex, String breed, String age, String neutered) =>
      'My $petSpecies is $petName ($petSex)\nBreed: $breed\nAge: $age\n';
}