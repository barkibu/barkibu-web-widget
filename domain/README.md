A library for Dart developers that contains code shared between flutter app and angular dart app:

Flutter app repo: https://github.com/barkibu/barkibu-app

Angular dart repo: https://github.com/barkibu/web-widgets

## Development

- Instal dart SDK
- run `pub get`
- run `pub run test` to execute test suite

## Usage

Add `common_barkibu_dart` as the dependency to the `pubspec.yaml`:

```
dependencies:
  common_barkibu_dart:
    git:
      url: git@github.com:barkibu/common_barkibu_dart.git
      ref: develop
```

Also you'd have to add either `angular_bloc` or `flutter_bloc` dependency in order to integrate your framework with `bloc`. Import desired component as `import 'package:common_barkibu_dart/bloc/auth/signup/signup_bloc.dart';`

For usage examples refer to bloc documentation:

- Bloc documentation: https://bloclibrary.dev/#/gettingstarted
- `angular_bloc` package: https://pub.dev/packages/angular_bloc
- `flutter_bloc` package: https://pub.dev/packages/flutter_bloc

You'll need to setup the service locator with a couple of implementations:

```
ServiceLocator.setup(
    YourConfigurationImplementation,
    YourSecureStorageImplementation,
    YourNavigationServiceImplementation,
    )
```

When instanciating the factories that needs the usage of params we can do it this way, knowing that authHomeInstance is a previous instanciated object:

```
final authBloc = ServiceLocator.container<AuthBloc>();
final resetPasswordBloc = ServiceLocator.container<ResetPasswordBloc>(param1: authBloc);
final signInBloc = ServiceLocator.container<SignInBloc>(param1: authBloc);
final signUpBloc = ServiceLocator.container<SignUpBloc>(param1: authBloc);
```

## Internationalization

Translations are generated from yaml files in /lib/messages, and converted to plain Dart classes using https://pub.dev/packages/i18n

To refresh them, run:

```
pub run build_runner watch --delete-conflicting-outputs
```

You can get the current locale via `ServiceLocator.container<LocaleService>().currentLocale`
By default it's passed "en". 

You can either change that default on `ServiceLocator.setup()` or with 
`ServiceLocator.container<LocaleService>().currentLocale = 'yourlocale'` later on.

## Translations tool

Before using translation scripts make sure you have commited/stashed your current work in `lib/messages` folder.

Translations tools are two python scripts that allow us to import and export `.yaml` files to `Airtable` and vice-versa.
- `local_to_airtable_translations.py` takes all the `.yaml` files from `lib/messages` and uploads the content to a `App` table in `BT - Barkibu Translations Master` base in Airtable.
- `airtable_to_local_translations.py` takes `App_Barkibu (en,es,de)` table in `BT - Barkibu Translations Master` base in Airtable and creates all the required `.yaml` files ready for use them back in `lib/messages`

they can be executed using:
`cd /translations_tool`
`python3  airtable_to_local_translations.py` and
`python3 local_to_airtable_translations.py`


dependencies can be installed using pip:

`pip3 install ruamel.yaml`

To set up an `AIRTABLE_API_KEY` environment variable is required. Check Airtable API documentation for the api key

`export AIRTABLE_API_KEY="airtable_api_key"`

Test script `test.py` is also available to make sure output is correctly generated after modification/refactoring.