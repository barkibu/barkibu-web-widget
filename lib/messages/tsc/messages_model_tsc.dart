import 'package:common_barkibu_dart/messages/clinicsFinderMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/faqMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/healthPlanMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:common_barkibu_dart/messages/onBoardingMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/profileMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/validationMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/nutribotMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/insuranceMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/contactMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/workingFeatureMessages.i18n.dart';
import 'package:web_widget/messages/tsc/auth_messages_tsc.dart';
import 'package:web_widget/messages/tsc/home_messages_tsc.dart';
import 'package:web_widget/messages/tsc/pet_profile_messages_tsc.dart';
import 'package:web_widget/messages/tsc/chat_messages_tsc.dart';
import 'package:web_widget/messages/tsc/assessment_report_messages_tsc.dart';
import 'package:web_widget/messages/tsc/shared_messages_tsc.dart';

class MessagesModelTsc extends MessagesModel {
  MessagesModelTsc()
      : super(
      AuthMessages_tsc(),
      AssessmentReportMessages_tsc(),
      ChatMessages_tsc(),
      HomeMessages_tsc(),
      SharedMessages_tsc(),
      ValidationMessages(),
      PetProfileMessages_tsc(),
      ProfileMessages(),
      NutribotMessages(),
      InsuranceMessages(),
      ContactMessages(),
      HealthPlanMessages(),
      WorkingFeatureMessages(),
      OnBoardingMessages(),
      FaqMessages(),
      ClinicsFinderMessages());
}