import 'package:common_barkibu_dart/messages/contactMessages.i18n.dart';

class ContactMessages_furlife extends ContactMessages {
  const ContactMessages_furlife();

  @override
  AskAVetEmailTemplateContactMessages get askAVetEmailTemplate => AskAVetEmailTemplateContactMessages_furlife(this);
}

class AskAVetEmailTemplateContactMessages_furlife extends AskAVetEmailTemplateContactMessages {
  const AskAVetEmailTemplateContactMessages_furlife(ContactMessages_furlife _parent) : super(_parent);

  @override
  String petDefinition(String petSpecies, String petName, String petSex, String breed, String age, String neutered) =>
      'My $petSpecies is $petName \nBreed: $breed\nAge: $age\n';
}
