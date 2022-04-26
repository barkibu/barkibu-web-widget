import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/messages/assessmentReportMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/clinicsFinderMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/contactMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/faqMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/healthPlanMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/onBoardingMessages.i18n.dart';
import 'package:common_barkibu_dart/messages/workingFeatureMessages.i18n.dart';

import 'authMessages.i18n.dart';
import 'chatMessages.i18n.dart';
import 'homeMessages.i18n.dart';
import 'petProfileMessages.i18n.dart';
import 'profileMessages.i18n.dart';
import 'sharedMessages.i18n.dart';
import 'validationMessages.i18n.dart';
import 'nutribotMessages.i18n.dart';
import 'insuranceMessages.i18n.dart';

class MessagesModelDefault extends MessagesModel {
  MessagesModelDefault()
      : super(
          AuthMessages(),
          AssessmentReportMessages(),
          ChatMessages(),
          HomeMessages(),
          SharedMessages(),
          ValidationMessages(),
          PetProfileMessages(),
          ProfileMessages(),
          NutribotMessages(),
          InsuranceMessages(),
          ContactMessages(),
          HealthPlanMessages(),
          WorkingFeatureMessages(),
          OnBoardingMessages(),
          FaqMessages(),
          ClinicsFinderMessages(),
        );
}
