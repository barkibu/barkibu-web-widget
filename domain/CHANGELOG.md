# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres
to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

# [Unreleased]

- Add DebugMonitoringService to avoid polluting Sentry with exceptions in develop
- Add PreventionEvent feature
- Add German language support

# [2.1.8]

- Add Cache capabilities
- Replace isIndoor with isOutdoor

# [2.1.7]

- Add is indoor question for cats at nutribot flow
- Add pet definition bloc question for cat to know if its indoor or not
- Replace hypoallegernic question in nutribot for weight management question
- Pet Summary View - Add Activity Counters
- Pet Counters - Expose PetInteractionsBloc

# [2.1.6]

- Control when to show reminder messages by adding reminderEnabled flag

# [2.1.5]

- Add missing strings

# [2.1.4]

- Add strings for pet breed (onboarding)
- Replace hypoallegernic question in nutribot for weight management question

# [2.1.3]

- OnBoarding - Add a bloc and associated abstraction to be implemented by clients
- Update translation tool to use airtable directly
- New text for navigation bar
- [Breaking] Refactor/clean some Pet-related models
- Update tracked User Properties on pet C~~R~~UD events

# [2.1.2]

# [2.1.1]

- Get Features when pet is confirmed in PetDefinitionBloc

# [2.1.0]

- New param `otpToken` on `AppStarted` AuthBloc event [New Feature]
- Extract Triage logic from PetHealthChatBloc
- New service to retrieve some user data from IP
- Concierge - Switchedfrom Id to Access token
- Breaking Change - Concierge button message split into Payload and Url types
- Allow firstName to be optional (via configuration)
- Trim authData
- Add fetchUser to the TwilioMember and display join/typing messages with friendlyName
- [Breaking] New auth/onboarding texts (deprecating some old ones)
- [Breaking] Refactor some analytic events

## [2.0.1]

- Add vet working time to config
- Update buy health plan message

## [2.0.0]

- Add `.getAssessment` to GetAssessmentReportUseCase
- Fetch Assessment on AssessmentReportBloc `-Started` event
- Fix the missing VirtualVet and AskAVet events when PetHealthChatBloc is started with the concierge
- Send new user attributes to Segment
- Support media sharing in browser environment

## [1.1.5.1]

## [1.1.5]

## [1.1.4]

- Add ability to send feedback for Chat with a Vet
- Add correct error messages on phone sign in
- Remove `goBackHomeOptionEnabled` option
- Add config to allow skipping symptom definition

## [1.1.3]

- Add `ConciergeBloc`leading on top of `PetHealthChatBloc` when no pet/question is provided

## [1.1.2]

- Add connection to plans endpoint
- Add bloc for health plans screens
- Global method for user profile validation
- New question for nutribot: "Does {petname} have dry skin and/or a dull coat?"
- Removed "Freeze dried" option from nutribot preferred food options
- Removed "GMO" question for nurtibot

## [1.1.1]

- Add ability to hide "Add a pet" option when selecting a pet
- Add `ContactVetBloc`
- Add ability to hide "Back home" option at the end of consultation
- Add `InsuranceBloc`
- Fix PetDefinitionBloc flow
- Changed hardcoded message copies with "Barkibu" for a placeholder
- Add email update validation for user profile
- Additional fields in the "Email" option of `ContactVetBloc`
- Fix body messages of email template in contact with a vet via email
- Add `productId` field to `RecipeOrTreat` model
- Add order for nutribot consultations
- Fix symptom names in emails
- Change event names according to taxonomy document
- ContactVetBloc gets stuck on phone update error
- Fixed an error for not asking for pet gender, when its the only field missing
- Fixed an error with appointment url generation when user has no email
- Connect to flag endpoints to get users available app features by their country
- Update "noVetsAvailable" messages
- Add health plan to pet model
- Fixed typos and misspelled words in Spanish
- New analytics events && some fixes to existing ones
- Add texts for users without phone
- Add check for empty phone number in User
- Add `AuthDatasource` as optional param of `ServiceLocator``
- Inject token in interceptor from AuthDatasource
- Add Cognito Pool identification variables into the configuration file
- Rewrite Cognito direct auth integration into `AuthDatasource`
- Renamed original `AuthDatasource` to `LegacyAuthDatasource`
- Reorder ServiceLocator dependency injections meaningfully
- Add chip number to pet model

## [1.1.0+hotfix.1]

- Unify report translations
- Report can be re-opened from chat

## [1.1.0]

- Renamed `PetHealthChatOptionType` to `ChatButtonOptionType`
- Nutribot bloc completed
- Restore feedback loop as part of PetHealthChat process
- Add Assessment Short lived Export Url generation
- Add delete option in pet profile bloc
- Insurance screen copies
- Add required param on `ServiceLocator.setup()`
- Add ability to provide token in `AppStarted` event of `AuthBloc`
- Ask A Vet simple flow
- Update some translation strings, related to profile
- Rename Pet.gender to Pet.sex
- Fix regex for PhonePrefix
- Segregate AskAVet and AiVet specific consultation in history BLoC
- Add `NutribotHistoryBloc`

## [1.0.13]

- Add missing error for phone sign in

## [1.0.12]

- Upgraded pubspec dependencies
- Assessment report on chat
- Add AssessmentHistory bloc

## [1.0.11]

- Retrieve Active Chat use-case
- PhoneSignUp bloc
- Add `id` and `twilioIdentity` fields to User model

## [1.0.10]

- ChatWithVet bloc -Started event allow pre-initialized ChatService and ChannelSid
- Add `pet_parent_id` to analytics user properties
- VideoSharing capability Bloc

## [1.0.9]

- Update analytics events
- ChatWithVet bloc re-implementation
- Store unknown symptoms in aivet model
- Add Chat Text message with Help
- Simplify ChatWithVetBloc start event to only consultationId
- Add operation to retrieve all user properties at the same time on analytics
- Send initial message to the channel
- Added PetFormBloc
- Added translations for Pet edit details screen
- Ability to hide "Talk to a vet" options
- Separate chat with vet from aivet bot messages
- Make password repeat & last name not mandatory for sign up

## [1.0.8]

- Add ask symptom message to the state when user question is passed
- Restore password presence validation(only presence)
- Refactor profile bloc to get user from auth bloc
- Update analytics events
- Add support for analytics user properties
- Update translations to match google doc

## [1.0.6]

- Remove password validation from frontend

## [1.0.5]

- Modified chat flow to increase accessibility
- Symptoms information when AIVet can't give conditions results
- Ask for Age range in Patient definition step
- ChatWithVet / Twilio sub bloc

## [1.0.0]

- Added ability to configure bot message delays
- Changelog added
- Added i18n service
- Added service locator and dependencies management
- AIVET 2 and Talk with a vet
- Added analytics service
- Added AuthBloc
- Added Terms and Conditions config
- Added LocaleService
- Added ResetPasswordBloc
