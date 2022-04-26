import 'package:common_barkibu_dart/messages/assessmentReportMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/clinicsFinderMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/contactMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/healthPlanMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/homeMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/insuranceMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/nutribotMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/onBoardingMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/petProfileMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/profileMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/validationMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/faqMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/workingFeatureMessages.i18n.dart';
import 'authMessages.i18n.dart';
import 'chatMessages.i18n.dart';
import 'sharedMessages.i18n.dart';

abstract class MessagesModel {
  final AuthMessages authMessages;
  final ChatMessages chatMessages;
  final AssessmentReportMessages assessmentReportMessages;
  final HomeMessages homeMessages;
  final SharedMessages sharedMessages;
  final ValidationMessages validationMessages;
  final PetProfileMessages petProfileMessages;
  final ProfileMessages profileMessages;
  final NutribotMessages nutribotMessages;
  final InsuranceMessages insuranceMessages;
  final ContactMessages contactMessages;
  final HealthPlanMessages healthPlanMessages;
  final WorkingFeatureMessages workingFeatureMessages;
  final OnBoardingMessages onBoardingMessages;
  final FaqMessages faqMessages;
  final ClinicsFinderMessages clinicsFinderMessages;

  MessagesModel(
    this.authMessages,
    this.assessmentReportMessages,
    this.chatMessages,
    this.homeMessages,
    this.sharedMessages,
    this.validationMessages,
    this.petProfileMessages,
    this.profileMessages,
    this.nutribotMessages,
    this.insuranceMessages,
    this.contactMessages,
    this.healthPlanMessages,
    this.workingFeatureMessages,
    this.onBoardingMessages,
    this.faqMessages,
    this.clinicsFinderMessages,
  );
}
