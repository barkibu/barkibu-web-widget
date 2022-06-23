import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/email_attributes.dart';
import 'package:common_barkibu_dart/shared/chat/aivet_chat_title.dart';
import 'package:common_barkibu_dart/shared/chat/chat_message_type_mapping.dart';
import 'package:common_barkibu_dart/viewmodels/contact_vet/contact_vet_flow.dart';
import 'package:common_barkibu_dart/viewmodels/contact_vet/contact_vet_message_type.dart';
import 'package:web_widget/src/ask_a_vet/chat_with_vet_component.dart';
import 'package:web_widget/src/bloc/chat/info_bloc.dart';
import 'package:web_widget/src/chat/chat_control_events.dart';
import 'package:web_widget/src/chat/chat_controls_component.dart';
import 'package:web_widget/src/chat/chat_messages_component.dart';
import 'package:web_widget/src/chat/pet_definition_event_handler.dart';
import 'package:web_widget/src/email/email_sender_component.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/navigation/ask_a_vet_options_modal_component.dart';
import 'package:web_widget/src/navigation/auth_guard.dart';
import 'package:web_widget/src/navigation/feedback_form.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/report/assessment_report_screen_component.dart';
import 'package:web_widget/src/route_paths.dart';
import 'package:web_widget/src/symptom_info/has_info_screen.dart';
import 'package:web_widget/src/symptom_info/info_screen_component.dart';
import 'package:web_widget/src/tools/email_template_builder_tools.dart';
import 'package:web_widget/src/widget_configuration.dart';
import 'package:web_widget/src/widget_window/parent_window_service.dart';

PetRepository petRepositoryFactory() => ServiceLocator.container<PetRepository>();
PetHealthChatBloc chatBlocFactory() => ServiceLocator.container<PetHealthChatBloc>();
AssessmentReportBloc reportBlocFactory() => ServiceLocator.container<AssessmentReportBloc>();

@Component(
  selector: 'chat',
  templateUrl: 'chat_component.html',
  styleUrls: ['chat_component.css'],
  providers: [
    FactoryProvider(PetHealthChatBloc, chatBlocFactory),
    FactoryProvider(PetRepository, petRepositoryFactory),
    ClassProvider(InfoBloc),
    ClassProvider(ChatMessageTypeMapping),
    ClassProvider(FeedbackForm),
    FactoryProvider(AssessmentReportBloc, reportBlocFactory)
  ],
  directives: [
    coreDirectives,
    GoBackComponent,
    ChatMessagesComponent,
    ChatControlsComponent,
    AssessmentReportScreenComponent,
    WidgetButtonComponent,
    ChatWithVetComponent,
    InfoScreenComponent,
    EmailSenderComponent,
    AskAVetOptionsModalComponent,
    layoutDirectives,
  ],
  pipes: [BlocPipe],
  exports: [RoutePaths],
)
class ChatComponent extends AuthGuard with PetDefinitionEventHandler, HasInfoScreen implements OnActivate, OnDestroy {
  final PetHealthChatBloc _chatBloc;
  final AssessmentReportBloc _reportBloc;

  final MessagesModel messages;
  final ChatMessageTypeMapping _messageTypeMapping;
  final FeedbackForm _feedbackForm;
  final PetRepository _petRepository;
  @override
  final Router router;
  @override
  final WidgetConfiguration config;
  @override
  final ParentWindowService parentWindow;

  final analyticsService = ServiceLocator.container<AnalyticsService>();

  static const askAVetFlow = 'ask_a_vet';
  static const conciergeFlow = 'concierge';
  String _question;
  String _queryPetId;
  String _queryChatType;
  bool isEmailSended = false;
  bool chatWithVetStarted = false;
  bool showAskAVetModal = false;
  PetHealthChatState chatState;
  AssessmentIdentificationViewModel assessmentIdentification;
  Map<String, String> _currentQueryParams;
  final AnalyticsService _analyticsService;
  AssessmentReportViewModel assessment;
  bool isUrgent = false;

  ChatComponent(
    this.messages,
    this._chatBloc,
    this._messageTypeMapping,
    this._feedbackForm,
    this._petRepository,
    this.config,
    this.router,
    this.parentWindow,
    this._analyticsService,
    this._reportBloc,
    InfoBloc infoBloc,
    AuthBloc authBloc,
  ) : super(authBloc, router) {
    setInfoBloc(infoBloc);
    setCurrentScreen(CurrentChatScreen.aiVet);
  }

  @ViewChild(ChatMessagesComponent)
  ChatMessagesComponent chatMessagesComponent;

  @override
  void ngOnDestroy() {
    closeSymtomInfoBloc();
  }

  @override
  void onActivate(_, RouterState current) async {
    _currentQueryParams = current.queryParameters;
    _question = _currentQueryParams['question'] ?? '';
    _queryPetId = _currentQueryParams['petId'];
    _queryChatType = _currentQueryParams['chatType'];
    if (_chatBloc.state is PetHealthChatInitial) {
      _sendChatLaunchedEvent(question: _question, chatType: _chatType, pet: await _preselectedPet);
    }
    _chatBloc.listen(_chatBlocListener);
    _reportBloc.listen(_reportBlocListener);
  }

  PetHealthChatType get _chatType {
    if (isAskAVetFlow) {
      return PetHealthChatType.askAVet;
    } else if (isConciergeFlow) {
      return PetHealthChatType.concierge;
    } else {
      return PetHealthChatType.virtualVet;
    }
  }

  User get user => _chatBloc.state.user;
  Pet get pet => _chatBloc.state.aiVetModel.pet;
  String get emailSubject => messages.contactMessages.askAVetEmailTemplate.subject;

  bool get isAskAVetFlow => _queryChatType == askAVetFlow;
  String get calendlyUrl => config.chatOnPhoneCallUrl;
  String get emailLink => EmailTemplateBuilder.emailUri(
      config.emailAccount, messages.contactMessages.askAVetEmailTemplate.subject, emailBody);

  EmailAttributes get emailAttributes =>
      EmailAttributes(config.emailAccount, messages.contactMessages.askAVetEmailTemplate.subject, emailBody);

  String get emailBody => EmailTemplateBuilder.askAVetEmailBody(messages, _chatBloc.state.aiVetModel, config);

  bool get isBackButtonEnabled => config.backButtonEnabled;
  bool get isfooterChatCreditsEnabled => config.footerChatCreditsEnabled;
  bool get embeddedEmailClientEnabled => config.embeddedEmailClientEnabled ?? false;
  bool get isConciergeFlow => _queryChatType == conciergeFlow;
  bool get findClinicButtonInChatEnabled => config.findClinicButtonInChatEnabled;
  bool get askVetTitleEnabled => config.iconsTheme == 'thewildest' && isAskAVetFlow;

  String get chatTitle {
    if (isAskAVetFlow) {
      return messages.chatMessages.chatWithVet.title;
    } else {
      return messages.chatMessages.title;
    }
  }

  Future<Pet> get _preselectedPet {
    if (_queryPetId == null) {
      return null;
    }
    final petId = int.tryParse(_queryPetId);
    if (petId == null) {
      return null;
    }
    return _petRepository.getPet(petId);
  }

  void _chatBlocListener(PetHealthChatState state) {
    chatState = state;
    chatMessagesComponent?.scrollToTheLastMessage();
  }

  void _reportBlocListener(AssessmentReportState state) {
    if (state is AssessmentReportLoadSuccessful) {
      assessment =
          AssessmentReportViewModel.fromAssessment(pet: assessmentIdentification.pet, assessment: state.assessment);
      if (assessment.urgency == Urgency.high) {
        isUrgent = true;
        logFindClinicBtnAppearsAfterAiJourney();
      }
    }
  }

  @override
  void symptomInfoListener(InfoState state) {
    if (state is InfoSetSuccess) {
      infoState = state;
      setCurrentScreen(CurrentChatScreen.symptomInfo);
    } else {
      infoState = null;
      setCurrentScreen(CurrentChatScreen.aiVet);
    }
  }

  void _sendChatLaunchedEvent(
      {String question = '', PetHealthChatType chatType = PetHealthChatType.virtualVet, Pet pet}) {
    _chatBloc.add(PetHealthChatInitLaunched((b) => b
      ..type = chatType
      ..user = currentUser
      ..question = question
      ..pet = pet));
  }

  bool get isChatInitialized => chatState != null && _question != null;
  String get consultationId => chatState.aiVetModel.consultationId;

  void onChatControlEvent(ChatControlEvent event) {
    if (event.flow is PetDefinitionChatFlow) {
      return handlePetDefinitionEvent(event, _chatBloc);
    } else if (event is SelectOptionConfirmed) {
      return _onOptionSelected(event);
    } else if (event is TextEntered) {
      return _onTextEntered(event);
    } else if (event is YesNoUnkownConfirmed) {
      return _onYesNoConfirmed(event);
    } else if (event is ChatOptionButtonPressed) {
      return _onChatButtonPressed(event);
    } else if (event is ChatActionButtonPressed) {
      return _onActionButtonPressed(event);
    } else if (event is PhoneNumberEntered) {
      return _onPhoneNumberEntered(event);
    }
  }

  void _onOptionSelected(SelectOptionConfirmed event) {
    var flow = event.flow;
    if (flow is ConfirmSymptomAIVetChatFlow) {
      _chatBloc.add(PetHealthChatConfirmSymptomPressed((b) => b..symptomFoundViewModel.key = event.selected.key));
    } else if (flow is AskSymptomDurationCycleAIVetChatFlow) {
      _chatBloc.add(PetHealthChatSetSymptomDurationCyclePressed(
          (b) => b..optionDuration = _buildSelectDurationCycleModel(event.selected)));
    } else if (flow is AskSymptomFrequencyCycleAIVetChatFlow) {
      _chatBloc.add(PetHealthChatSetSymptomFrequencyCyclePressed(
          (b) => b.optionFrequency = _buildSelectFrequencycleModel(event.selected)));
    } else if (flow is InputSymptomAIVetChatFlow) {
      _chatBloc.add(PetHealthChatSkipSymptomPressed());
    } else if (flow is TalkToAVetAIVetChatFlow) {
      switch (event.selected.key) {
        case ContactVetMessageType.chat:
          _chatBloc.add(ContactVetChatOptionPressed());
          setCurrentScreen(CurrentChatScreen.chatWithVet);
          break;
        case ContactVetMessageType.email:
          _chatBloc.add(ContactVetEmailOptionPressed());
          break;
        case ContactVetMessageType.phoneCall:
          _chatBloc.add(ContactVetPhoneCallOptionPressed());
          break;
        default:
          _chatBloc.add(ContactVetNoThanksPressed());
      }
    } else if (flow is SelectOptionConciergeChatFlow) {
      final selectedOption = event.selected.key;
      if (selectedOption is MessagePayloadButtonDefinition) {
        _chatBloc.add(ConciergeMessageSent<ConciergePayloadButtonDetails>(
            message: event.selected.description, payload: selectedOption.payload));
      }
    }
  }

  void _onTextEntered(TextEntered event) {
    var flow = event.flow;
    if (flow is InputSymptomAIVetChatFlow) {
      _chatBloc.add(PetHealthChatSymptomNameSent((b) => b..symptom = event.text));
    }

    if (flow is InputTextConciergeChatFlow) {
      _chatBloc.add(ConciergeMessageSent<Null>(message: event.text));
    }
  }

  void _onPhoneNumberEntered(PhoneNumberEntered event) {
    var flow = event.flow;
    if (flow is InputPhoneNumberAIVetChatFlow) {
      _chatBloc.add(ContactVetAddPhoneNumberPressed((b) => b..phoneNumber = '${event.prefix} ${event.phone}'));
    }
  }

  void _onYesNoConfirmed(YesNoUnkownConfirmed event) {
    var flow = event.flow;
    if (flow is AskNextQuestionAIVetChatFlow) {
      _chatBloc.add(PetHealthChatSymptomPresencePressed((b) => b..presence = event.answer));
    } else if (flow is AskFeedbackAIVetChatFlow) {
      _launchFeedbackForm(event.answer);
      _chatBloc.add(PetHealthChatFeedbackPressed((b) => b..isAnswerYes = event.answer));
    } else if (flow is AddMoreSymptomsAIVetChatFlow) {
      _chatBloc.add(PetHealthChatAddMoreSymptomsPressed((b) => b..userWantsToAddMoreSymptoms = event.answer));
    } else if (flow is CheckPhoneNumberAIVetChatFlow) {
      _chatBloc.add(ContactVetCheckPhoneNumberPressed((b) => b..isPhoneNumberCorrect = event.answer));
    }
  }

  void _onChatButtonPressed(ChatOptionButtonPressed event) {
    if (event.optionType == ChatButtonOptionType.askAnotherQuestion && config.backButtonEnabled) {
      _chatBloc.add(PetHealthChatAskAnotherQuestionPressed());
      _sendChatLaunchedEvent(chatType: _chatType);
    } else if (event.optionType == ChatButtonOptionType.askAnotherQuestion) {
      _chatBloc.add(PetHealthChatAskAnotherQuestionPressed());
      _sendChatLaunchedEvent(chatType: _chatType);
      parentWindow.notifyWidgetWindowClosed();
    } else if (event.optionType == ChatButtonOptionType.talkWithAVet) {
      analyticsService.event.askAVet.logAskAVetStart('askAVet');
      _chatBloc.add(PetHealthChatTalkWithAVetPressed());
    } else if (event.optionType == ChatButtonOptionType.personalRecommendations) {
      _chatBloc.add(PetHealthChatPersonalRecommendationsPressed());
    } else if (event.optionType == ChatButtonOptionType.backHome) {
      router.navigate(RoutePaths.home.toUrl());
    } else if (event.optionType == ChatButtonOptionType.schedulePhoneCall) {
      _chatBloc.add(ContactVetPhoneAppointmentScheduled());
    } else if (event.optionType == ChatButtonOptionType.sendEmail) {
      analyticsService.event.askAVet.logAskAVetEmailClientOpened();
      if (embeddedEmailClientEnabled) {
        showEmailSenderScreen();
      }
      _chatBloc.add(ContactVetEmailRedirectionPressed());
    } else if (event.optionType == ChatButtonOptionType.noThanks) {
      _chatBloc.add(ContactVetNoThanksPressed());
    } else if (event.optionType == ChatButtonOptionType.openReport) {
      showAssessmentReport();
      _reportBloc.add(AssessmentReportStarted(assessmentIdentification.consultationId));
    }
  }

  void _onActionButtonPressed(ChatActionButtonPressed event) {
    if (event.buttonViewModel.action == ChatViewModelAction.openReport) {
      assessmentIdentification = event.buttonViewModel.dataResolver();
      showAssessmentReport();
      _reportBloc.add(AssessmentReportStarted(assessmentIdentification.consultationId));
    }
  }

  SymptomDurationCycle _buildSelectDurationCycleModel(OptionViewModel selected) {
    var label = _messageTypeMapping.getMessageByType(selected.key);
    return SymptomDurationCycle(key: selected.description, label: label);
  }

  SymptomFrequencyCycle _buildSelectFrequencycleModel(OptionViewModel selected) {
    var label = _messageTypeMapping.getMessageByType(selected.key);
    return SymptomFrequencyCycle(key: selected.description, label: label);
  }

  void _launchFeedbackForm(bool aivetHelpful) {
    if (!config.extendedFeedbackEnabled) {
      return;
    }
    _feedbackForm.open(
      _chatBloc.state.aiVetModel.pet,
      _chatBloc.state.user,
      true,
      _chatBloc.state.conditionsShown,
      aivetHelpful,
      _chatBloc.state.anamnesisResults.consultationId,
      _chatBloc.state.symptomArticlesShown,
    );
  }

  void continueAssessment() {
    _chatBloc.add(PetHealthAssessmentReportShowed());
    setCurrentScreen(CurrentChatScreen.aiVet);
  }

  void startVetChatFromReport() {
    continueAssessment();
    setCurrentScreen(CurrentChatScreen.chatWithVet);
    showAskAVetModal = false;
  }

  String get modalSendEmailText => messages.contactMessages.actions.sendEmail;

  void close() => showAskAVetModal = false;

  void showAssessmentReport() => setCurrentScreen(CurrentChatScreen.report);
  void showEmailSenderScreen() => setCurrentScreen(CurrentChatScreen.emailSender);
  void closeChatWithVet() => setCurrentScreen(CurrentChatScreen.aiVet);

  bool get isTelehealthEnabled => config.telehealthEnabled;

  void logFindClinicBtnAppearsAfterAiJourney() =>
      _analyticsService.event.clinicFinder.logFindClinicBtnAppearsAfterAiJourney();

  void logFindClinicAfterAiJourney() => _analyticsService.event.clinicFinder.logFindClinicAfterAiJourney();
}
