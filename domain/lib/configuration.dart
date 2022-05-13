abstract class Configuration {
  String chatOnPhoneCallUrl =
      'https://calendly.com/jmj/?name={userName}&email={userEmail}&a3={petAge}&a4={petSpecies}&a1={fullPhoneNumber}'; // Url with placeholder for instance: https://calendly.com/jmj/?name={userName}&email={userEmail}&a3={petAge}&a4={petSpecies}&a1={fullPhoneNumber}
  String backendUrl;
  String appName;
  String brandName;
  String brandLogo;
  String brandLogoWidth = '70px';
  bool headerWithoutLogo = false;
  String emailAccount;
  String supportSpanishAccount;
  String supportEnglishAccount;
  String emailNewLineFormat = '<br/>';
  int vetStartHour;
  int generalVetFinishHour;
  int fridayVetFinishHour;
  String marketingBrandName;
  String privacyUrl;

  /// Websocket Server url to connect to the Concierge bot
  String conciergeUrl;
  int botPreMessageDelay;
  int botPostMessageDelay;
  bool telehealthEnabled = false;
  bool insuranceEnabled = false;
  bool apiFeatureFlagsEnabled = false;
  bool telehealthVideoCapabilityEnabled = false;
  bool telehealthPhoneCallEnabled = false;
  bool telehealthEmailEnabled = false;
  bool telehealthChatEnabled = true;
  bool petAgeSelectorEnabled = true;
  bool addPetOptionEnabled = true;
  bool goBackHomeOptionEnabled = true;
  bool skipPrimarySymptomEnabled = false;
  bool firstNameRequired = true;
  bool lastNameRequired = false;
  bool petBreedEnabled = false;
  bool reminderEnabled = true;
  bool isChatMobileClient = false;

  String authServiceUserPoolId = 'eu-west-1_zXXXXX';
  String authServiceAppClientId = 'xXxXxX';
}
