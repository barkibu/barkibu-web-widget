# Widget configuration

Widget can be configured in order to support different environments local/dev/staging/prod/... and to support needs of different clients. Common use cases:

- Feature flagging
- Customisation
- Storing static values(instead of hardcoding)

## Overview

Configuration is applied in layers. There are 3 places where config values can be adjusted

- `Configuration` class in `common_barkibu_dart` package
- `WidgetConfiguration` [class](../lib/src/widget_configuration.dart) in `web_widget` package
- build.{env}.yaml files in the root of this repository

## `common_barkibu_dart` configuration

`Configuration` class in `common_barkibu_dart` is responsible for configuring the library. If there is a need for a new config value that will change the logic of the `common_barkibu_dart` code - it has to be added directly into the `Configuration` class.

## `web_widget` configuration

`WidgetConfiguration` extends `Configuration` class from the `common_barkibu_dart` library. It means that it has access to all values from the common library, but also adds new configuration options that can control the UI side of the widget.

## Dart build pipeline configuration - build.{env}.yaml

Build files are used to control [dart's build system](https://github.com/dart-lang/build). Each build file represents a deployment target:

- `build.dev.yaml` - https://web-widget-dev.herokuapp.com/
- `build.staging.yaml` - https://web-widget-staging.herokuapp.com/
- `build.yaml` - https://web-widget.herokuapp.com/

These files are also used to inject specific configuration values based on the build file used. Each file contains a set of configuration values that will be compiled into a dart file with constants definitions. This file used as a source for `WidgetConfiguration` class values.

```yaml
targets:
  $default:
    builders:
      web_widget|config_builder:
        options:
          configValue1: dummy
          configValue2: value
          configValue3: true
          clientIdConfigOverride:
            some_client_id1:
              configValue3: false
            some_client_id2:
              configValue3: false
```

This part of yaml is then provided to the [config_builder](../lib/builders/config_builder.dart) to generate `config.g.dart` class during the build phase. This file can be imported in other places to get the values.

```dart
// Generated file: .dart_tool/build/generated/web_widget/lib/config.g.dart
const configValue1 = "dummy";
const configValue2 = "value";
const configValue3 = true;
const clientIdConfigOverride = {
  "some_client_id1": {
    "configValue3": false
  },
  "some_client_id2": {
    "configValue3": false
  }
};

// Example usage
import 'package:web_widget/config.g.dart' as config;

config.clientIdConfigOverride['some_client_id1']['configValue3']; // false
config.configValue1; // "dummy"
```

Generated code in `config.g.dart` file is used by [widget_configuration.dart](../lib/src/widget_configuration.dart) code. If any of the values that are referenced by `widget_configuration.dart` are missing in the `config.g.dart` - build will fail. You have to provide ALL config values in the yaml file. To see the list of all possible configs refer to any existing build yaml file.

`clientIdConfigOverride` property of the yaml file is used in case of multi-tenant widget deployment. If widget app is opened with `?client_id=some_client_id1` query string, settings from `clientIdConfigOverride['some_client_id1']` will override settings from the top level. This way different `client_id` can have different configs.

## List of all configuration values

### `Configuration` class

- `backendUrl` - Defines the API URL
- `appName` - Defines the application name. Value is inserted in copies instead of placeholders where an application name is mentioned
- `brandName` - Same as `appName` but for a brand/company name. Used to replace placeholders in copies.
- `brandLogo` - File name of the apps logo. The file needs to be placed in `assets/images/`
- `marketingBrandName` - Defines the name of the marketing brand that appears when `marketingOptInEnabled` is activated.
- `marketingOptInEnabled` - Defines wether the texts relative to marketing opt in is active or not.
- `privacyUrl` - Defines the url to which user should be redirected to know the privacy terms of the brand.
- `emailAccount` - Defines an email address where pet parents should send their emails in order to contact with a vet
- `emailNewLineFormat` - Defines a new line separator, used to build a body for an email consultation
- `chatOnPhoneCallUrl` - Url for external service where pet parent can schedule a phone call with a vet. Used when pet parent selects `Phone` option to connect with a vet
- `conciergeUrl` - Defines the url where the concierge can be contacted (for instance: `wss://concierge.barkibu.com`)
- `botPreMessageDelay` - Defines a delay in ms before bot message in the chat. Used to simulate a real conversation
- `botPostMessageDelay` - Defines a delay in ms after bot message in the chat. Used to simulate a real conversation
- `telehealthEnabled` - Flag that defines wether "Connect with a vet" functionality is enabled
- `telehealthMediaSharingEnabled` - Flag that defines wether pet parent can connect with a vet using video call
- `telehealthVideoCapabilityEnabled` - Flag that defines wether pet parent can upload media files when chatting with a vet
- `telehealthPhoneCallEnabled` - Flag that defines wether pet parent can connect with a vet using a scheduled phone appointment. The value depends on the content of `chatOnPhoneCallUrl`.
- `telehealthEmailEnabled` - Flag that defines wether pet parent can connect with a vet using an email. The value depends on the content of `chatOnPhoneCallUrl`.
- `skipPrimarySymptomEnabled` - Controls whether the user will be presented with an option to skip symptom definition after 2 unsuccessful searches. This includes cases when nothing matched or when the user didn't select any of the presented search results.
- `addPetOptionEnabled` - Flag that defines wether "Add pet" option will be available when selecting a pet in a conversation
- `backButtonEnabled` - Flag that defines if back button is going to be displaying into different sections of the app
- `authServiceUserPoolId` - Cognito user pool id. Only used if `useLegacyAuthDatasource` is set to `false`
- `authServiceAppClientId` - Cognito app client id. Only used if `useLegacyAuthDatasource` is set to `false`
- `externalToSEnabled` - Flag that defines wether the terms of service are external (you have to provide a url link in the Messages Model) or internal (you have to add a component that includes the ToS)
- `virtualVetInfoEnabled` - Flag that allows you to activate and deactivate the link(s) to the Virtual Vet Info page.

### `WidgetConfiguration` class

`WidgetConfiguration` overrides values from `Configuration` class and uses the values from generated `config.g.dart` files. If no value is present in `config.g.dart` class a default value is returned. List below only covers config values that are specific for the `WidgetConfiguration` class

- `clientId` - Unique identifier of the client. Used for analytics and error tracking. Have to be provided in query params when opening a widget. Default value can be set in `build.{env}.yaml` file in `features['defaultClientId]` property
- `country` - Country of the pet parent. Can be provided in query params
- `theme` - Theme defines the color scheme and some other visual adjustments. Can be provided in the query params. Default value can be set in `build.{env}.yaml` file in `features['defaultTheme]` property
- `locale` - Defines the language of the widget, can be provided in query params. If not provided - browser locale will be used
- `externalAuthToken` - Stores the value of an authentication token that was provided in query params when opening a widget
- `sentryDsn` - URL for sentry service. Used to configure Sentry error logging
- `envName` - environment name. Possible values: `development`, `staging` and `production`. Used for analytics and error tracking. If the value is `development` - no error logs are sent to Sentry
- `version` - Has the same value as in `web/version` file. Used for analytics and error tracking
- `spanishFeedbackUrl` - External feedback tool url for `es` locale
- `englishFeedbackUrl` - External feedback tool url for `en` locale
- `assessmentDateFormat` - Date format used for assessments(history, details)
- `defaultPhonePrefix` - Phone prefix value that will be prepopulated in the chat phone input

Feature flags:

- `useSpecialTranslations` - Flag that affects copies per specific client.
- `backButtonEnabled` - Flag that enables back button across the widget
- `footerChatCreditsEnabled` - Flag to add custom footer
- `useLegacyAuthDatasource` - Controls wether authentication is performed by API backend or Cognito AWS. In case value is `true` - API backend is used to issue a JWT. In case value is `false` - AWS Cognito service is used along with `amazon_cognito_identity_dart_2` package to handle authentication.
- `authByEmailEnabled` - Controls wether pet parent is able sign in/sign up using an email
- `authByPhoneEnabled` - Controls wether pet parent is able sign in/sign up using phone number
- `nutribotEnabled` - Controls wether "Food and Nutrition Finder" menu item is visible on the home page
- `findAClinicEnabled` - Controls wether "Find a Clinic" menu item is visible on the home page
- `findAClinicAddressApiEnabled` - Allows the input box in feature "Find a Clinic" to be used to search by address. Requires a backend integration with a position API. 
- `askAVetDirectlyEnabled` - Controls wether "Ask a vet" menu item is visible on the home page
- `aivetEnabled` - Controls wether "Pet Health Symptom Checker" menu item is visible on the home page
- `externalProfileDataEnabled` - If this value is true - then auth_token _or_ otp_token is expected to be passed to the wiget in url params. If this value is false - user will be able to sign in/sign up within the widget. Controls wether "Profile" menu item is visible on the home page. In case neither auth_token nor otp_token was provided and `externalProfileDataEnabled` is true - home page will show an empty screen to prevent user from signing in.
- `extendedFeedbackEnabled` - Controls wether an external feedback tool is opened when pet parent completes a consultation
- `externalPetDataEnabled` - Controls wether clicking "Add pet" will open a pet form in the widget(if value is `false`) or send an event to the parent window using `window.postMessage`(if value is `true`)
- `externalLinksEventsEnabled` - Controls wether external links are actual links(if value is `false`) or buttons that will call `window.postMessage`(if value is `true`) on click. Used to prevent navigation to external website if widget is within a WebView
- `aivetUrgencyOrderEnabled` - Controls wether symptoms/conditions are sorted by urgency in AIvet report
- `embeddedEmailClientEnabled ` - Controls wether to show the email sender component when selecting email contact 
- `termsOfServiceHomeEnabled` - Controls wether Terms of service link is displayed on the home screen
- `lastNameRequired` - Controls wether last name field is displayed in sign up forms
- `petBreedEnabled` - Controls wether breed search field is displayed in pet profile and asked by bot in pet definition flow
- `chatWithVetEnabled` - Controls wether to show chat contact option in ask a vet flow
- `segmentWriteKey`- Key of the tracking service https://segment.com/ to send the events registered in all the widget.  