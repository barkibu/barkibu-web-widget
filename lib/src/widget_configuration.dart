import 'package:common_barkibu_dart/configuration.dart';
import 'package:web_widget/config.g.dart' as config;
import 'package:web_widget/src/i18n/current_locale.dart';
import 'package:web_widget/src/twilio/twilio_video_service.dart';

export 'package:common_barkibu_dart/configuration.dart';

class WidgetConfiguration extends Configuration {
  WidgetConfiguration() {
    clientId = Uri.base.queryParameters['client_id'] ?? config.fallbackClientId;
    country = Uri.base.queryParameters['country'];
    theme = _getThemeFromUrl(Uri.base.queryParameters['theme']);
    locale = CurrentLocale.build(Uri.base.queryParameters['locale']);
    externalAuthToken = Uri.base.queryParameters['auth_token'];
    otpToken = Uri.base.queryParameters['otp_token'];
    isChatMobileClient = false;
  }

  String clientId;
  String locale;
  String country;
  String theme;
  String externalAuthToken;
  String otpToken;

  String get sentryDsn => 'https://32896222e27847ed9ef97990418e25f0@o361405.ingest.sentry.io/5282877';
  String get envName => config.envName;
  String get version => config.version;
  String get spanishFeedbackUrl => 'https://barkibu1.typeform.com/to/sWWV7DA1';
  String get englishFeedbackUrl => 'https://barkibu1.typeform.com/to/pjap4KZD';

  bool get authByEmailEnabled => _clientIdOverridenValue('authByEmailEnabled') ?? config.authByEmailEnabled;
  bool get authByPhoneEnabled => _clientIdOverridenValue('authByPhoneEnabled') ?? config.authByPhoneEnabled;
  bool get useLegacyAuthDatasource =>
      _clientIdOverridenValue('useLegacyAuthDatasource') ?? config.useLegacyAuthDatasource;

  @override
  String get authServiceUserPoolId => _clientIdOverridenValue('authServiceUserPoolId') ?? config.authServiceUserPoolId;

  @override
  String get authServiceAppClientId =>
      _clientIdOverridenValue('authServiceAppClientId') ?? config.authServiceAppClientId;

  @override
  String get emailNewLineFormat => '\n';

  @override
  String get chatOnPhoneCallUrl => _clientIdOverridenValue('chatOnPhoneCallUrl') ?? config.chatOnPhoneCallUrl;

  bool get chatWithVetEnabled => _clientIdOverridenValue('chatWithVetEnabled') ?? config.chatWithVetEnabled;

  @override
  String get backendUrl => _clientIdOverridenValue('apiUrl') ?? config.apiUrl;

  @override
  String get appName => _clientIdOverridenValue('appName') ?? config.appName;

  @override
  String get brandName => _clientIdOverridenValue('brandName') ?? config.brandName;

  @override
  bool get marketingOptInEnabled => _clientIdOverridenValue('marketingOptInEnabled') ?? config.marketingOptInEnabled;

  @override
  String get marketingBrandName => _clientIdOverridenValue('marketingBrandName') ?? config.marketingBrandName;

  @override
  String get privacyUrl => _clientIdOverridenValue('privacyUrl') ?? config.privacyUrl;

  @override
  String get affiliatesUrl => _clientIdOverridenValue('affiliatesUrl') ?? config.affiliatesUrl;

  @override
  String get brandLogo => _clientIdOverridenValue('brandLogo') ?? config.brandLogo;

  @override
  String get brandLogoWidth => _clientIdOverridenValue('brandLogoWidth') ?? config.brandLogoWidth;

  @override
  bool get headerWithoutLogo => _clientIdOverridenValue('headerWithoutLogo') ?? config.headerWithoutLogo;

  @override
  String get emailAccount => _clientIdOverridenValue('emailAccount') ?? config.emailAccount;

  @override
  bool get telehealthEnabled => _clientIdOverridenValue('telehealthEnabled') ?? config.telehealthEnabled;

  @override
  bool get petBreedEnabled => _clientIdOverridenValue('petBreedEnabled') ?? config.petBreedEnabled;

  bool get telehealthMediaSharingEnabled =>
      _clientIdOverridenValue('telehealthMediaSharingEnabled') ?? config.telehealthMediaSharingEnabled;

  @override
  bool get telehealthVideoCapabilityEnabled =>
      _clientIdOverridenValue('telehealthVideoCapabilityEnabled') ?? config.telehealthVideoCapabilityEnabled;

  bool get isVideoSupported => TwilioVideoService.isSupported;

  @override
  bool get telehealthPhoneCallEnabled => chatOnPhoneCallUrl != null;

  @override
  bool get telehealthChatEnabled => chatWithVetEnabled;

  @override
  bool get reminderEnabled => !closeButtonEnabled;

  @override
  bool get telehealthEmailEnabled => emailAccount != null;

  @override
  String get conciergeUrl => _clientIdOverridenValue('conciergeUrl') ?? config.conciergeUrl;

  @override
  bool get addPetOptionEnabled => _clientIdOverridenValue('addPetOptionEnabled') ?? config.addPetOptionEnabled;

  @override
  bool get lastNameRequired => _clientIdOverridenValue('lastNameRequired') ?? config.lastNameRequired;

  @override
  bool get skipPrimarySymptomEnabled =>
      _clientIdOverridenValue('skipPrimarySymptomEnabled') ?? config.skipPrimarySymptomEnabled;

  bool get aivetEnabled => _clientIdOverridenValue('aivetEnabled') ?? config.aivetEnabled;

  bool get nutribotEnabled => _clientIdOverridenValue('nutribotEnabled') ?? config.nutribotEnabled;

  bool get nutribotRecommendationShortJourneyEnabled =>
      _clientIdOverridenValue('nutribotRecommendationShortJourneyEnabled') ??
      config.nutribotRecommendationShortJourneyEnabled;

  bool get findAClinicEnabled => _clientIdOverridenValue('findAClinicEnabled') ?? config.findAClinicEnabled;

  bool get findAClinicAddressApiEnabled =>
      _clientIdOverridenValue('findAClinicAddressApiEnabled') ?? config.findAClinicAddressApiEnabled;

  bool get askAVetDirectlyEnabled => _clientIdOverridenValue('askAVetDirectlyEnabled') ?? config.askAVetDirectlyEnabled;

  bool get externalProfileDataEnabled =>
      _clientIdOverridenValue('externalProfileDataEnabled') ?? config.externalProfileDataEnabled;

  bool get externalPetDataEnabled => _clientIdOverridenValue('externalPetDataEnabled') ?? config.externalPetDataEnabled;

  bool get extendedFeedbackEnabled =>
      _clientIdOverridenValue('extendedFeedbackEnabled') ?? config.extendedFeedbackEnabled;

  bool get embeddedEmailClientEnabled =>
      _clientIdOverridenValue('embeddedEmailClientEnabled ') ?? config.embeddedEmailClientEnabled;

  bool get externalLinksEventsEnabled =>
      _clientIdOverridenValue('externalLinksEventsEnabled') ?? config.externalLinksEventsEnabled;

  bool get closeButtonEnabled => _clientIdOverridenValue('closeButtonEnabled') ?? config.closeButtonEnabled;

  bool get backButtonEnabled => _clientIdOverridenValue('backButtonEnabled') ?? config.backButtonEnabled;

  bool get goHomeLinkEnabled => _clientIdOverridenValue('goHomeLinkEnabled') ?? config.goHomeLinkEnabled;

  bool get footerChatCreditsEnabled =>
      _clientIdOverridenValue('footerChatCreditsEnabled') ?? config.footerChatCreditsEnabled;

  bool get aivetUrgencyOrderEnabled =>
      _clientIdOverridenValue('aivetUrgencyOrderEnabled') ?? config.aivetUrgencyOrderEnabled;

  bool get termsOfServiceHomeEnabled =>
      _clientIdOverridenValue('termsOfServiceHomeEnabled') ?? config.termsOfServiceHomeEnabled;

  String get assessmentDateFormat => _clientIdOverridenValue('assessmentDateFormat') ?? config.assessmentDateFormat;

  String get defaultPhonePrefix => _clientIdOverridenValue('defaultPhonePrefix') ?? config.defaultPhonePrefix;

  String _getThemeFromUrl(param) {
    final fallBackTheme = _clientIdOverridenValue('fallbackTheme') ?? config.fallbackTheme;
    return [
      'tsc',
      'floof',
      'default',
      'whitelabel',
      'iams-dogs',
      'iams-cats',
      'thewildest',
      'walmart',
      'greatergood',
    ].contains(param)
        ? param
        : fallBackTheme;
  }

  String get iconsTheme => _clientIdOverridenValue('iconsTheme') ?? config.iconsTheme;

  @override
  int get botPreMessageDelay => _clientIdOverridenValue('botPreMessageDelay') ?? config.botPreMessageDelay;

  @override
  int get botPostMessageDelay => _clientIdOverridenValue('botPostMessageDelay') ?? config.botPostMessageDelay;

  String get useSpecialTranslations =>
      _clientIdOverridenValue('useSpecialTranslations') ?? config.useSpecialTranslations;

  bool get virtualVetInfoEnabled => _clientIdOverridenValue('virtualVetInfoEnabled') ?? config.virtualVetInfoEnabled;

  bool get externalToSEnabled => _clientIdOverridenValue('externalToSEnabled') ?? config.externalToSEnabled;

  bool get findClinicButtonInChatEnabled =>
      _clientIdOverridenValue('findClinicButtonInChatEnabled') ?? config.findClinicButtonInChatEnabled;

  dynamic _clientIdOverridenValue(String configName) {
    if (config.clientIdConfigOverride == null) {
      return;
    }
    if (config.clientIdConfigOverride[clientId] == null) {
      return;
    }
    return config.clientIdConfigOverride[clientId][configName];
  }
}
