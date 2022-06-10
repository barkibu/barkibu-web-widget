import 'package:web_widget/src/widget_configuration.dart';
import 'package:mockito/mockito.dart';

class MockConfiguration extends Mock implements WidgetConfiguration {
  @override
  int botPreMessageDelay = 0;

  @override
  int botPostMessageDelay = 0;

  @override
  String get backendUrl => 'http://example.com';

  @override
  String get theme => 'default';

  @override
  String emailNewLineFormat = '\n';
}

void mockConfigDefaultValues(WidgetConfiguration config) {
  when(config.authByEmailEnabled).thenReturn(false);
  when(config.nutribotEnabled).thenReturn(false);
  when(config.askAVetDirectlyEnabled).thenReturn(false);
  when(config.aivetEnabled).thenReturn(true);
  when(config.petAgeSelectorEnabled).thenReturn(true);
  when(config.addPetOptionEnabled).thenReturn(true);
  when(config.externalProfileDataEnabled).thenReturn(false);
  when(config.externalPetDataEnabled).thenReturn(false);
  when(config.telehealthEnabled).thenReturn(true);
  when(config.telehealthEmailEnabled).thenReturn(true);
  when(config.telehealthVideoCapabilityEnabled).thenReturn(false);
  when(config.backButtonEnabled).thenReturn(true);
  when(config.telehealthVideoCapabilityEnabled).thenReturn(false);
  when(config.telehealthPhoneCallEnabled).thenReturn(true);
  when(config.extendedFeedbackEnabled).thenReturn(true);
  when(config.externalLinksEventsEnabled).thenReturn(false);
  when(config.aivetUrgencyOrderEnabled).thenReturn(true);
  when(config.termsOfServiceHomeEnabled).thenReturn(false);
  when(config.apiFeatureFlagsEnabled).thenReturn(false);
  when(config.authByPhoneEnabled).thenReturn(true);
  when(config.assessmentDateFormat).thenReturn('dd/MM/yyyy');
  when(config.goHomeLinkEnabled).thenReturn(false);
  when(config.virtualVetInfoEnabled).thenReturn(true);
  when(config.externalToSEnabled).thenReturn(false);
  when(config.headerWithoutLogo).thenReturn(false);
  when(config.marketingOptInEnabled).thenReturn(false);
  when(config.marketingBrandName).thenReturn('Brand Name');
  when(config.affiliatesUrl).thenReturn('');
  when(config.privacyUrl).thenReturn('');
  when(config.petSexAndSpayedStatusEnabled).thenReturn(false);
  when(config.findClinicButtonInChatEnabled).thenReturn(true);
}
