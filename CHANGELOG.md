## [Unreleased]
## 1.3.15
- Added embedded email for IAMS
## 1.3.14
- New dot badge in Nutribot menu option
## 1.3.13
- Changes in Nutribot copies
## 1.3.12
- Fix camera being ON all the time (Flex issue)
- Added KPI Workflow
## 1.3.11
- Include segment tagging for Video calls
- Nutribot - fix ResultWarning copy font weight

## 1.3.10
- Disable Send Email button in Ask a vet flow to prevent send multiple emails.
- IAMs - enable videochat with vet
- New Copy For the Start of the AI Vet Journey
- Walmart css changes
- Updated "No vet is available for chat" screen

## 1.3.9
- Chat with Vet - Fix video call being blocked by iframe

## 1.3.8
- Added ability to config icons per partner
- New logo for GreaterGood
- New ask a vet report screen
- Add config value ´authByPhoneEnabled´
- Added new copies for nutribot and styles for the button
- Solved issue with the Videochat message when the call is established

##  1.3.7
- Fressnapf widget
- T&C for Walmart

##  1.3.6
- Copy changes to urgentBodySymptom and urgentBodyCondition in TSC's translation.
- Add line break to Virtual Vet's description copy.
- Enable video/phone calls for GreaterGood
- Created walmart T&C
##  1.3.5
- Improve Nutribot UI - Redesign Buy Now screen

##  1.3.4
- Send user country to KB
- Update docs explaining how config works on web-widget project
- Add greatergood configuration for staging and production envs
- Added ability to config botPreMessageDelay botPostMessageDelay per widget
- New widget icons
- Copy changes to TSC's translation of My Pets title and subtitle in the Main menu
- Copy changes to AIVet's noConditionTitle and noConditionBody messages.

##  1.3.3
- Fix Ask A Vet Modal contact options to comunicate events via ParentWindowService
- FIx pet name not being populated
##  1.3.2+hotfix.1
- Add opacity to email container in email sender component
##  1.3.2
- Add notification via ParentWindowService to notify of user adding phone number in ask a vet via phone flow
- Update copys
- Fix styles of email sender component for email field
- Track event of view recommendation in new recommendations design of nutribot
- By pass contact options when only email enabled
- Remove ñapa condition checking ´null´ strings

##  1.3.1
- Improve UI of food recommendations
- Fix EmptyChatViewModel showing message on nutribot flow
- Add option to send email over the widget without being redirected to email client via mailto links
- General update of copys
- Fix bug that show question to confirm phone number on ask a vet over null value in phone number of users

##  1.3.0
- Fix loader styles to make widget bigger on desktop
- Add error handling to widget profile update page
- Extract components from HomeComponent
- Move common lib inside widget repository
- Update CI/CD to run test from inner common lib
- Remove isCeliac question from nutribot
- Add German language support

##  1.2.4
- Trigger ask a vet and aivet starts events when user click to start a chat
- Add tooltip message for warning users of possible no browser compatibilities
- Fix bug that was not fetching size in pet definition flow when selecting breed
- Fix nutribot recommendations for breaking when backImages are null
- Add weight management question for nutribot flow
- Fix issue with video chat not having sound
- Make breed field mandatory in chat
- Added Dogo widget setup, featuring `backButtonEnabled` and `footerChatCreditsEnabled` flags
- Show contact vet options when user taps in ask a vet button from report
- Add configurable translations per client using `useSpecialTranslations` flag
- Show contact vet options when user taps in ask a vet button from report
- Update Iams icons & add custom close icon
- Add chat icon for The Wildest widget
- Add `isIndoor` question to nutribot

##  1.2.3
- OTP Automatic Sign In
- Modify styles for media sharing components
- Add email account value to floof & IAMS config files
- New IAMS cats theme
- Support product back images in nutribot
- Add UserDescriptor API to the js2dart twilio chat sdk wrapper
- Create a breeds search component
- Add breed config value for petBreedEnabled
- Fix test & events after common breaking changes
- Implement breed question into PetDefinition Flow
- Send sizes based on breed size to backend
- Fix info screen showing into nutribot flow
- Support video files sharing into chat with a vet
##  1.2.2
- Update the version in the right way

##  1.2.1

- Send new user attributes to Segment
- Add video sharing MVP(disabled by the config value)
- Add photo sharing MVP(disabled by the config value)
- Switch to fetching single assessment information(Requires API deploy)
- Add age input instead of limited options for age
- New widget build files for IAMS
- Added to new events and states for symptom info bloc
- Show different terms pending if is a vetinsight client or barkibu one
- Add config variable for if last name is required in widget

##  1.2.0

- Add whitelabel widget deployment
- Remove `preventLandingBackNavigationEnabled` option
- Fix profile initials when last name is empty
- Add ability to skip symptom definition
- Add ability to sign in using phone
- Add ability to disable sign in/sign up by email
- Remove `goBackHomeOptionEnabled` option
- Enforce config_build options list
- Add ability to override config for specific client_id
- Extract `isVetinsightClient` into config files

##  1.1.3

- Disabled email option for floof prod

##  1.1.2

- Fix widget loader for mobile(Removed moderd ES syntax usage)

##  1.1.1

- Add logo for widget button in floof theme

## 1.1.0

- Hide sign in/sign up home when `externalProfileData` is enabled
- Fixes for analytics events tracking
- New question for nutribot: "Does {petname} have dry skin and/or a dull coat?"
- Removed "Freeze dried" option from nutribot preferred food options
- Removed "GMO" question for nurtibot
- Update "noVetsAvailable" copy for TSC
- Add ability to gather feedback after chat with a vet
- Fix anonymous users in analytics

## 1.0.19+hotfix.1

- Fix storage factory fallback for incognito mode
- Remove "Add pet" button for floof

## 1.0.19

- Fixed a scroll issue in the chat. Because app element had overflow: auto - scrolling widget-body was causing an overflow.
- Added dependecy on telehealthEnabled for "Ask a vet" button in assessment report
- Fixed incorrect typform spanish link
- Removed "What is virtual vet" link from home page for barkibu. Restored an original + icon
- Refactor "Chat with vet" component to reuse it in all 3 flows(AIVet, Ask A Vet, Nutribot)
- Add Floof theme/configuration
- Themify button that is created by inject script
- Allow `auth_token` to be provided by the loader

## 1.0.18+hotfix.4

- Fix symptom articles formatting support

## 1.0.18+hotfix.3

- Prevent long pet names to overflow in Pet Title

## 1.0.18+hotfix.2

- Prevent long pet names to overflow in My Pets screen

## 1.0.18+hotfix.1

- Add default phone prefix for TSC
- Update common lib

## 1.0.18

- Fix a bug with Ask A Vet chat state not cleared after conversation is completed
- Removed "castrated" for TSC
- Fixed "Ingredients" typo
- Added "Unknown" copy when pet's gender/neutered is not set
- Add terms and conditions link
- Restore vetinsight logo with some text that mentions TSC
- Fixed focus issues for home component(nav and text) in IOS screenreader
- Fixed non-focusable back button and logo in IOS screenreader
- Fixed focus issues for chat messages, pet card component, history links, history titles
- Add ellipsis pipe to nutribot recommendations for description and ingredients
- Remove sr-only label from home screen input as it was focused by Android screenreader
- Added pet-title component and used it in pet profile and history screens
- Fixed an issue of with reading out icon title on pet history links
- Add "Read More/Read Less" buttons for nutribot products' description/ingredients
- Add "aria-label" to the symptom input on home screen

## 1.0.17

- Add logging for unhandled bloc errors

## 1.0.16+hotfix.1

- Disabled `preventLandingBackNavigationEnabled` for TSC
- Fixed an error for not asking for pet gender, when its the only field missing
- Fixed an error with appointment url generation when user has no email

## 1.0.16

- Don't ask for active chat connection if telehealth is disabled
- Ability to change symptoms/conditions order by urgency
- Copy changes for TSC

## 1.0.15

- Add special case for parent window events, when parent is ReactNative webview
- External links can navigate/emit an event depending on feature flag
- Add parent window notification for "Email", "Phone Call" option in contact vet
- Added logo to tsc theme
- Added ability to hide close button
- Added ability to override default copies
- Added ability to set date format for assessment
- Changes to nutribot recommendation message UI
- Add bot logo for "Ask a vet" messages
- Add correct header to Virtual Vet/Ask A Vet chat
- Accessibility improvements
- Set segment configuration for TSC
- Add productId to nutribot recommendation requested event
- Change "castrated" copy
- Add nutribot events and screens to analytics

## 1.0.14

- Open Report from menu in chat
- Fix pet definition flow to allow updates on incomplete pet profile
- Fix inability to go back from nutribot recommendation/symptom info screen
- Change styles of multiple select component
- Add ability to provide custom brand name

## 1.0.13

- Add phone/email contact options
- Completed theme support for TSC
- Prevent navigating for create/edit screens for external user & pets
- Add ability to preselect a pet for nutribot and ask a vet flows
- Add ability to disable typeform feedback
- Remove "Powered by vetinsight" logo from tsc theme
- Add ability to prevent navigating back from landing screen
- Post message to the window itself when parent is not present

## 1.0.12

- Fix home screen item being empty when features are disabled

## 1.0.11

- Add feedback as step of aivet process
- Provide MonitoringService implementation to ServiceLocator
- Add ability to provide external auth token in query params
- Add ability to get back on the health chat after direct messaging with vet
- Split Pet History according to enabled features
- Add NutritionHistoryScreen
- Add export PDF link
- Hide profile button for TSC

## 1.0.10

- Add pet profile screen
- Add ability to Ask A Vet
- Add ability to sign up using phone
- Add typeform feedback
- Add nutribot component(accessible only via direct link)
- Add assessment report to pet profile
- Add assessment report to aivet consultation
- Add support for theming
- Add initial implementation of TSC theme
- Add ability to reconnect with a vet
- Add AskAVet flow
- Add AskAVet and Nutrition links guarded by flags

## 1.0.9+hotfix.2

- Fix for events propagation params serialization in dev mode

## 1.0.9+hotfix.1

- Propagate common barkibu library events to the parent window of the web widget

## 1.0.9

- Add symptom info component
- Center assistant icon button

## 1.0.8

- Switch analytics vendor from google analytics to segment
- Add support for `telehealthEnabled` option
- Simplify sign up form
- Add terms and condition link for mars colombia

## 1.0.7

- Add fixed header layout
- Remove bootstrap dependency
- Add widget lazy loading
- Add alt image translations
- Add pet list to the profile page
- Add error tracking to Sentry
- Add analytics user properties tracking
- Apply fixed copies versions from common lib
- Remove usage of mockito from non-test code
- Change `dart2js` compile options for prod/staging/dev
- Fix a bug with widget size in iOS for symptom cards component

## 1.0.6

- Remove phone inputs from sign up form

## 1.0.5

- Fixed widget not working in incognito mode
- Fix an issue with user info not updated after profile is updated

## 1.0.4

- Set correct cache-control headers
- Remove "x" icon from invalid inputs
- Fixed inability to scroll inside full-view condition card in ios
- Fixed occasional focus styles occurring on buttons and select options in ios
- Increased widget container for closed state by 4px not to crop focus shadow
- Aligned close icon position on full-view condition card by setting button's size

## 1.0.3

- Restored password validation

## 1.0.2

- Error messages on sign in/sign up are now translated
- "You" message in chat is now translated
- Fixed a bug with result message being shown as "user" message
- Fixed a bug with predefined question being repeated when restarting chat
- Password is not validated now due to changes in common lib
- Restore button styles on hover & active states

## 1.0.1

- Added styles for focused elements

## 1.0.0

- Added version file to web root
- Added assets map to improve cache busting
- Added production build config
- Added support for selecting a pet age option
- Added design for chat page and home page
- Added screen to recover user's password
- Added ability to provide locale via `init` call
- Added ability to toggle widget from parent window
- Added profile edit screen
- Added integration with `AuthBloc` from `common_barkibu_dart`
- Added `built_html` package to the build pipeline in order to append assets digest for effective caching
- Specified cache headers in `static.json` which will be used when serving assets
- Added <widget-button> component
- Added `sass_builder` to the build pipeline
- Added ability to provide custom url in `config.dart`
- Initial version, created by Stagehand
- Added `AnalyticsService` implementation
