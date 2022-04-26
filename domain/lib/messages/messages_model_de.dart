import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/messages/assessmentReportMessages_de.i18n.dart';
import 'package:common_barkibu_dart/messages/clinicsFinderMessages_de.i18n.dart';
import 'package:common_barkibu_dart/messages/contactMessages_de.i18n.dart';
import 'package:common_barkibu_dart/messages/faqMessages_de.i18n.dart';
import 'package:common_barkibu_dart/messages/healthPlanMessages_de.i18n.dart';
import 'package:common_barkibu_dart/messages/onBoardingMessages_de.i18n.dart';
import 'package:common_barkibu_dart/messages/workingFeatureMessages_de.i18n.dart';

import 'authMessages_de.i18n.dart';
import 'chatMessages_de.i18n.dart';
import 'homeMessages_de.i18n.dart';
import 'petProfileMessages_de.i18n.dart';
import 'profileMessages_de.i18n.dart';
import 'sharedMessages_de.i18n.dart';
import 'validationMessages_de.i18n.dart';
import 'nutribotMessages_de.i18n.dart';
import 'insuranceMessages_de.i18n.dart';

class MessagesModelDe extends MessagesModel {
  MessagesModelDe()
      : super(
          AuthMessages_de(),
          AssessmentReportMessages_de(),
          ChatMessages_de(),
          HomeMessages_de(),
          SharedMessages_de(),
          ValidationMessages_de(),
          PetProfileMessages_de(),
          ProfileMessages_de(),
          NutribotMessages_de(),
          InsuranceMessages_de(),
          ContactMessages_de(),
          HealthPlanMessages_de(),
          WorkingFeatureMessages_de(),
          OnBoardingMessages_de(),
          FaqMessages_de(),
          ClinicsFinderMessages_de(),
        );
}
