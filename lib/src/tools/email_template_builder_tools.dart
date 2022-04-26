import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/widget_configuration.dart';

class EmailTemplateBuilder {
  static String emailUri(String emailAccount, String subject, String body) {
    return 'mailto:$emailAccount?subject=$subject&body=$body';
  }

  static String askAVetEmailBody(MessagesModel messages, AiVetModel aiVetModel, WidgetConfiguration configuration) {
    final emailTemplate = messages.contactMessages.askAVetEmailTemplate;
    final unknown = messages.sharedMessages.unknown;
    final yes = messages.sharedMessages.yes;
    final no = messages.sharedMessages.no;
    final pet = aiVetModel.pet ?? Pet();
    final symptoms = aiVetModel.symptoms ?? [];

    return [
      emailTemplate.intro,
      emailTemplate.petDefinition(pet?.species, pet?.name, pet?.sex, pet?.breed ?? unknown,
          fullAge(pet?.birthdate, messages), pet.neutered ? yes : no ?? false),
      emailTemplate.symptoms(_symptomsJoiner(symptoms)),
      emailTemplate.outro
    ].join('\n\n');
  }

  static String nutribotEmailBody(MessagesModel messages, Pet pet) {
    final emailTemplate = messages.contactMessages.nutribotEmailTemplate;
    return [
      emailTemplate.intro,
      emailTemplate.petDefinition(pet?.species, pet?.name, pet?.sex),
      emailTemplate.outro,
    ].join('\n\n');
  }

  static String _symptomsJoiner(List<Symptom> symptoms) {
    return symptoms
        .map((symptom) =>
            '${symptom?.name} (Duration: ${(symptom?.duration?.label ?? 'unknown')}, Frequency: ${(symptom?.frequency?.label ?? 'unknown')})')
        .join('\n\n');
  }

  static String fullAge(String birthdate, MessagesModel messages) {
    if (birthdate != null) {
      var years = Birthdate.getYearsOld(birthdate).toString();
      var months = Birthdate.getMonthOld(birthdate).toString();
      return messages.sharedMessages.fullAge(years, months);
    } else {
      return messages.sharedMessages.unknown;
    }
  }
}
