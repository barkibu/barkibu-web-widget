import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/bloc/nutribot_chat/nutribot_chat.dart';
import 'package:common_barkibu_dart/viewmodels/contact_vet/contact_vet_flow.dart';
import 'package:common_barkibu_dart/viewmodels/contact_vet/contact_vet_message_type.dart';
import 'package:web_widget/src/chat/chat_phone_input_component.dart';
import 'package:web_widget/src/email/email_sender_component.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/navigation/spinner_component.dart';
import 'package:web_widget/src/navigation/auth_guard.dart';
import 'package:web_widget/src/ask_a_vet/chat_with_vet_component.dart';
import 'package:web_widget/src/chat/chat_messages_component.dart';
import 'package:web_widget/src/chat/chat_controls_component.dart';
import 'package:web_widget/src/chat/chat_control_events.dart';
import 'package:web_widget/src/chat/pet_definition_event_handler.dart';
import 'package:web_widget/src/bloc/chat/info_bloc.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/route_paths.dart';
import 'package:web_widget/src/symptom_info/has_info_screen.dart';
import 'package:web_widget/src/symptom_info/info_screen_component.dart';
import 'package:web_widget/src/tools/email_template_builder_tools.dart';
import 'package:web_widget/src/widget_configuration.dart';
import 'package:web_widget/src/widget_window/parent_window_service.dart';
import 'package:web_widget/src/bloc/chat/nutribot_recommendations_bloc.dart';
import 'package:web_widget/src/nutribot/nutribot_recommendation_screen_component.dart';

PetRepository petRepositoryFactory() => ServiceLocator.container<PetRepository>();
NutribotChatBloc nutribotBlocFactory() => ServiceLocator.container<NutribotChatBloc>();

@Component(
  selector: 'nutribot',
  templateUrl: 'nutribot_component.html',
  styleUrls: ['nutribot_component.css'],
  providers: [
    FactoryProvider(NutribotChatBloc, nutribotBlocFactory),
    FactoryProvider(PetRepository, petRepositoryFactory),
    ClassProvider(InfoBloc),
    ClassProvider(NutribotRecommendationBloc),
  ],
  directives: [
    coreDirectives,
    GoBackComponent,
    ChatMessagesComponent,
    ChatControlsComponent,
    SpinnerComponent,
    NutribotRecommendationScreenComponent,
    ChatPhoneInputComponent,
    EmailSenderComponent,
    InfoScreenComponent,
    WidgetButtonComponent,
    ChatWithVetComponent,
    layoutDirectives,
  ],
)
class NutribotComponent extends AuthGuard
    with PetDefinitionEventHandler, HasInfoScreen
    implements OnActivate, OnDestroy {
  final NutribotChatBloc _chatBloc;
  final NutribotRecommendationBloc _recommendationsBloc;
  final MessagesModel messages;
  final PetRepository _petRepository;
  @override
  final Router router;
  @override
  final WidgetConfiguration config;
  @override
  final ParentWindowService parentWindow;
  NutribotChatState chatState;
  bool chatWithVetStarted = false;
  NutribotRecommendationState recommendationState;
  String _queryPetId;

  NutribotComponent(
    this._chatBloc,
    this._recommendationsBloc,
    this.messages,
    this._petRepository,
    this.router,
    this.config,
    this.parentWindow,
    AuthBloc authBloc,
    InfoBloc infoBloc,
  ) : super(authBloc, router) {
    setInfoBloc(infoBloc);
    setCurrentScreen(CurrentChatScreen.nutribot);
  }

  @ViewChild(ChatMessagesComponent)
  ChatMessagesComponent chatMessagesComponent;

  @override
  void ngOnDestroy() {
    _recommendationsBloc.close();
  }

  @override
  void onActivate(_, RouterState current) async {
    _queryPetId = current.queryParameters['petId'];
    _recommendationsBloc.listen(recommendationsBlocListener);
    _chatBloc.listen(chatBlocListener);
    if (_chatBloc.state is NutribotChatInitial) {
      _sendChatStartedEvent(pet: await _preselectedPet);
    }
  }

  @override
  void symptomInfoListener(InfoState state) {
    if (state is InfoSetSuccess) {
      infoState = state;
      setCurrentScreen(CurrentChatScreen.symptomInfo);
    } else {
      infoState = null;
      setCurrentScreen(CurrentChatScreen.nutribot);
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

  void chatBlocListener(NutribotChatState state) {
    chatState = state;
    chatMessagesComponent?.scrollToTheLastMessage();
  }

  void recommendationsBlocListener(NutribotRecommendationState state) {
    recommendationState = state;
  }

  User get user => _chatBloc.state.user;
  Pet get pet => _chatBloc.state.model.pet;
  String get nutribotEmailBody => EmailTemplateBuilder.nutribotEmailBody(messages, pet);
  bool isEmailSended = false;
  bool get isRecommendationOpened => recommendationState is NutribotRecommendationSetSuccess;
  bool get isChatInitialized => chatState != null;
  bool get isEmailSenderScreenInitialized => currentScreen == CurrentChatScreen.emailSender;

  void onChatControlEvent(ChatControlEvent event) {
    if (event.flow is PetDefinitionChatFlow) {
      return handlePetDefinitionEvent(event, _chatBloc);
    } else if (event is SelectOptionConfirmed) {
      return _onOptionSelected(event);
    } else if (event is MultipleSelectOptionsConfirmed) {
      return _onMultipleOptionsSelected(event);
    } else if (event is YesNoUnkownConfirmed) {
      return _onYesNoConfirmed(event);
    } else if (event is ChatOptionButtonPressed) {
      return _onChatButtonPressed(event);
    } else if (event is PhoneNumberEntered) {
      return _onPhoneNumberEntered(event);
    }
  }

  void _onPhoneNumberEntered(PhoneNumberEntered event) {
    var flow = event.flow;
    if (flow is InputPhoneNumberAIVetChatFlow) {
      _chatBloc.add(ContactVetAddPhoneNumberPressed((b) => b..phoneNumber = '${event.prefix} ${event.phone}'));
    }
  }

  void _onOptionSelected(SelectOptionConfirmed event) {
    final flow = event.flow;
    if (flow is AskPreferedFoodTypeNutribotChatFlow) {
      _chatBloc.add(NutribotChatPreferedFoodTypePressed((b) => b..preferedFoodTypeOption.key = event.selected.key));
    } else if (flow is TalkToAVetAIVetChatFlow) {
      switch (event.selected.key) {
        case ContactVetMessageType.chat:
          chatWithVetStarted = true;
          setCurrentScreen(CurrentChatScreen.chatWithVet);
          _chatBloc.add(ContactVetChatOptionPressed());
          break;
        case ContactVetMessageType.phoneCall:
          _chatBloc.add(ContactVetPhoneCallOptionPressed());
          break;
        case ContactVetMessageType.email:
          _chatBloc.add(ContactVetEmailOptionPressed());
          break;
        default:
          _chatBloc.add(ContactVetNoThanksPressed());
      }
    }
  }

  void _onMultipleOptionsSelected(MultipleSelectOptionsConfirmed event) {
    final flow = event.flow;
    if (flow is AskFoodSensitivityNutribotChatFlow) {
      _chatBloc.add(NutribotChatFoodSensitivitiesPressed((b) => b..foodSensitivityOptions = event.selected));
    }
  }

  void _onYesNoConfirmed(YesNoUnkownConfirmed event) {
    final flow = event.flow;
    if (flow is AskWeightManagementNutribotChatFlow) {
      _chatBloc.add(NutribotChatWeightManagementPressed((b) => b..needsWeightManagementFood = event.answer));
    } else if (flow is AskDullCoatOrDrySkinNutribotChatFlow) {
      _chatBloc.add(NutribotDullCoatOrDrySkinPressed((b) => b..hasDullCoatOrDrySkin = event.answer));
    } else if (flow is AskHipJointsNutribotChatFlow) {
      _chatBloc.add(NutribotChatHipJointsPressed((b) => b..hasHipJointIssues = event.answer));
    } else if (flow is AskFeedbackNutribotChatFlow) {
      _chatBloc.add(NutribotChatFeedbackPressed((b) => b..feedback = event.answer));
    } else if (flow is CheckPhoneNumberAIVetChatFlow) {
      _chatBloc.add(ContactVetCheckPhoneNumberPressed((b) => b..isPhoneNumberCorrect = event.answer));
    }
  }

  void _onChatButtonPressed(ChatOptionButtonPressed event) {
    if (event.optionType == ChatButtonOptionType.askAnotherQuestion) {
      _chatBloc.add(NutribotAnotherQuestionPressed());
      _sendChatStartedEvent();
    } else if (event.optionType == ChatButtonOptionType.talkWithAVet) {
      _chatBloc.add(NutribotTalkWithAVetPressed());
    } else if (event.optionType == ChatButtonOptionType.backHome) {
      router.navigate(RoutePaths.home.toUrl());
    } else if (event.optionType == ChatButtonOptionType.schedulePhoneCall) {
      _chatBloc.add(ContactVetPhoneAppointmentScheduled());
    } else if (event.optionType == ChatButtonOptionType.sendEmail) {
      _chatBloc.add(ContactVetEmailRedirectionPressed());
      setCurrentScreen(CurrentChatScreen.emailSender);
    } else if (event.optionType == ChatButtonOptionType.noThanks) {
      _chatBloc.add(ContactVetNoThanksPressed());
    }
  }

  void _sendChatStartedEvent({Pet pet}) {
    _chatBloc.add(NutribotChatStarted((b) => b
      ..user = currentUser
      ..pet = pet));
  }

  void closeChatWithVet() => setCurrentScreen(CurrentChatScreen.nutribot);
}
