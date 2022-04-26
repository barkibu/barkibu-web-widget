import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/messages/assessmentReportMessages_es.i18n.dart';
import 'package:common_barkibu_dart/messages/contactMessages_es.i18n.dart';
import 'package:common_barkibu_dart/messages/faqMessages_es.i18n.dart';
import 'package:common_barkibu_dart/messages/healthPlanMessages_es.i18n.dart';
import 'package:common_barkibu_dart/messages/onBoardingMessages_es.i18n.dart';
import 'package:common_barkibu_dart/messages/workingFeatureMessages_es.i18n.dart';
import 'package:common_barkibu_dart/messages/clinicsFinderMessages_es.i18n.dart';

import 'authMessages_es.i18n.dart';
import 'chatMessages_es.i18n.dart';
import 'homeMessages_es.i18n.dart';
import 'petProfileMessages_es.i18n.dart';
import 'profileMessages_es.i18n.dart';
import 'sharedMessages_es.i18n.dart';
import 'validationMessages_es.i18n.dart';
import 'nutribotMessages_es.i18n.dart';
import 'insuranceMessages_es.i18n.dart';

class MessagesModelEs extends MessagesModel {
  MessagesModelEs()
      : super(
          AuthMessages_es(),
          AssessmentReportMessages_es(),
          ChatMessages_es(),
          HomeMessages_es(),
          SharedMessages_es(),
          ValidationMessages_es(),
          PetProfileMessages_es(),
          ProfileMessages_es(),
          NutribotMessages_es(),
          InsuranceMessages_es(),
          ContactMessages_es(),
          HealthPlanMessages_es(),
          WorkingFeatureMessages_es(),
          OnBoardingMessages_es(),
          FaqMessages_es(),
          ClinicsFinderMessages_es(),
        );
}
