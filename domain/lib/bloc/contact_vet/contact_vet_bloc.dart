import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/bloc/contact_vet/contact_vet.dart';
import 'package:common_barkibu_dart/configuration.dart';
import 'package:common_barkibu_dart/domain/account_profile/update_user_use_case.dart';
import 'package:common_barkibu_dart/messages/contactMessages.i18n.dart';
import 'package:common_barkibu_dart/models/user.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/services/analytics/event_analytics_service.dart';
import 'package:common_barkibu_dart/services/locale_service.dart';
import 'package:common_barkibu_dart/shared/chat/actions_chat.dart';
import 'package:common_barkibu_dart/viewmodels/chat/chat_viewmodel.dart';
import 'package:common_barkibu_dart/viewmodels/contact_vet/contact_vet_flow.dart';
import 'package:common_barkibu_dart/viewmodels/contact_vet/contact_vet_message_type.dart';
import 'package:common_barkibu_dart/services/monitoring_service.dart';
import 'package:pedantic/pedantic.dart';
import 'package:common_barkibu_dart/extensions/string_extensions.dart';

enum ChannelType { email, phone, video, chat }

class ContactVetBloc extends Bloc<ContactVetEvent, ContactVetState> {
  final Configuration _configuration;
  final UpdateUserUseCase _updateUserUseCase;

  final actionsChat = ActionsChat<ContactVetChatFlow>();

  ContactVetState currentState;

  ContactVetBloc(this._configuration, this._updateUserUseCase);

  ContactMessages get _contactMessages => ServiceLocator.container<LocaleService>().messagesModel().contactMessages;

  EventAnalyticsService get _eventService => EventAnalyticsService();

  @override
  ContactVetState get initialState => ContactVetState((b) => b..status = ContactVetStatus.initial);

  @override
  Stream<ContactVetState> mapEventToState(ContactVetEvent event) async* {
    currentState = state;
    if (!_configuration.telehealthEnabled) {
      unawaited(close());
      return;
    }

    if (event is ContactVetStarted) {
      currentState = currentState.rebuild((b) => b
        ..user = event.user
        ..pet = event.pet
        ..type = event.type
        ..symptoms = event.symptoms);

      if (_onlyEmailContactEnabled()) {
        _eventService.askAVet.logAskAVetEmail();
        currentState = currentState.rebuild((builder) => builder..channelType = ChannelType.email);

        yield* _addChatViewModelStreamToState(
          actionsChat
              .botMessageType(ContactVetMessageType.letsConnectEmail, data: {'brandName': _configuration.brandName}),
          ContactVetStatus.emailRedirectionInProgress,
        );

        final options = [ChatButtonOptionType.sendEmail, ChatButtonOptionType.noThanks];
        yield _addChatViewModelToState(actionsChat.buttonsInput(
          options,
          data: {},
        ));
      } else {
        final viewModel = event.withQuestion
            ? actionsChat.botMessageType(ContactVetMessageType.channelChoice)
            : Stream<ChatViewModel>.value(null);
        yield* _addChatViewModelStreamToState(viewModel, ContactVetStatus.presentChoiceInProgress);
        yield _addChatViewModelToState(_talkWithAVetViewModel(), ContactVetStatus.presentChoiceSuccess);
      }
    }

    if (event is ContactVetPhoneCallOptionPressed) {
      _eventService.askAVet.logAskAVetPhone();
      currentState = currentState.rebuild((b) => b..channelType = ChannelType.phone);
      yield _addChatViewModelToState(
          actionsChat.ownMessageType(ContactVetMessageType.phoneCall), ContactVetStatus.channelChoiceSuccess);

      final phoneNumberDefined = currentState.user.fullPhoneNumber;
      if (phoneNumberDefined != null && phoneNumberDefined.trim().isNotEmpty) {
        yield* _addChatViewModelStreamToState(
            actionsChat.botMessageType(
              ContactVetMessageType.checkPhoneNumber,
              data: {'phoneNumber': phoneNumberDefined},
            ),
            ContactVetStatus.verifyPhoneInProgress);
        yield _addChatViewModelToState(actionsChat.yesNo(ContactVetChatFlow.checkPhoneNumber()));
      } else {
        yield* _addChatViewModelStreamToState(
            actionsChat.botMessageType(ContactVetMessageType.emptyPhoneNumber), ContactVetStatus.verifyPhoneInProgress);
        yield _addChatViewModelToState(
            actionsChat.phoneNumberInput(ContactVetChatFlow.addPhoneNumber()), ContactVetStatus.askPhoneInProgress);
      }
    }

    if (event is ContactVetEmailOptionPressed) {
      _eventService.askAVet.logAskAVetEmail();
      currentState = currentState.rebuild((builder) => builder..channelType = ChannelType.email);
      yield _addChatViewModelToState(
        actionsChat.ownMessageType(ContactVetMessageType.email),
        ContactVetStatus.channelChoiceSuccess,
      );
      yield* _addChatViewModelStreamToState(
        actionsChat
            .botMessageType(ContactVetMessageType.letsConnectEmail, data: {'brandName': _configuration.brandName}),
        ContactVetStatus.emailRedirectionInProgress,
      );

      final options = [ChatButtonOptionType.sendEmail, ChatButtonOptionType.noThanks];
      yield _addChatViewModelToState(actionsChat.buttonsInput(
        options,
        data: {},
      ));
    }

    if (event is ContactVetCheckPhoneNumberPressed) {
      if (event.isPhoneNumberCorrect) {
        yield _addChatViewModelToState(
          actionsChat.ownMessageType(ContactVetMessageType.yes),
          ContactVetStatus.verifyPhoneSuccess,
        );
        yield* _addChatViewModelStreamToState(_onLaunchPhone());
      } else {
        yield _addChatViewModelToState(
          actionsChat.ownMessageType(ContactVetMessageType.no),
          ContactVetStatus.verifyPhoneFailure,
        );
        yield* _addChatViewModelStreamToState(actionsChat.botMessageType(ContactVetMessageType.changePhoneNumber));
        yield _addChatViewModelToState(
          actionsChat.phoneNumberInput(ContactVetChatFlow.addPhoneNumber()),
          ContactVetStatus.askPhoneInProgress,
        );
      }
    }

    if (event is ContactVetAddPhoneNumberPressed) {
      yield _addChatViewModelToState(actionsChat.ownMessage(event.phoneNumber), ContactVetStatus.askPhoneSuccess);
      final user = await _updateUserPhoneContact(event.phoneNumber);
      currentState = currentState.rebuild((b) => b..user = user);
      yield* _addChatViewModelStreamToState(_onLaunchPhone());
    }

    if (event is ContactVetPhoneAppointmentScheduled) {
      yield _addChatViewModelToState(
          actionsChat.ownMessageType(ContactVetMessageType.ok), ContactVetStatus.schedulePhoneSuccess);
      unawaited(close());
    }
    if (event is ContactVetEmailRedirectionPressed) {
      yield _addChatViewModelToState(
          actionsChat.ownMessageType(ContactVetMessageType.sendEmail), ContactVetStatus.emailRedirectionSuccess);
      unawaited(close());
    }

    if (event is ContactVetChatOptionPressed) {
      _eventService.askAVet.logAskAVetChat();
      currentState = currentState.rebuild((b) => b.channelType = ChannelType.chat);
      yield _addChatViewModelToState(
          actionsChat.ownMessageType(ContactVetMessageType.chat), ContactVetStatus.channelChoiceSuccess);
      unawaited(close());
    }

    if (event is ContactVetNoThanksPressed) {
      yield _addChatViewModelToState(
          actionsChat.ownMessageType(ContactVetMessageType.noThanks), ContactVetStatus.channelChoiceFailure);
      unawaited(close());
    }
  }

  Future<User> _updateUserPhoneContact(String phoneNumber) async {
    final currentUser = currentState.user;
    final hadPhoneDefined = !currentUser.fullPhoneNumber.isNullEmptyOrWhitespace;
    currentUser
      ..phoneNumberPrefix = phoneNumber.split(' ').first
      ..phoneNumber = phoneNumber.split(' ').last;

    if (hadPhoneDefined) {
      return Future.value(currentUser);
    }
    try {
      return await _updateUserUseCase.update(currentUser);
    } catch (error, stacktrace) {
      final monitoringService = ServiceLocator.container<MonitoringService>();
      monitoringService.capture(event: error, severityLevel: SeverityLevel.ERROR, stackTrace: stacktrace);
    }
    return Future.value(currentUser);
  }

  bool _onlyEmailContactEnabled() {
    final options = _talkWithAVetOptions();
    return options.length == 1 && options.first.key == ContactVetMessageType.email;
  }

  List<OptionViewModel<dynamic>> _talkWithAVetOptions() {
    var options = <OptionViewModel<dynamic>>[];

    if (_configuration.telehealthChatEnabled) {
      options.add(OptionViewModel<ContactVetMessageType>((b) => b
        ..key = ContactVetMessageType.chat
        ..description = ''));
    }
    if (_configuration.telehealthEmailEnabled) {
      options.add(OptionViewModel<ContactVetMessageType>((b) => b
        ..key = ContactVetMessageType.email
        ..description = ''));
    }

    if (_configuration.telehealthPhoneCallEnabled) {
      options.add(OptionViewModel<ContactVetMessageType>((b) => b
        ..key = ContactVetMessageType.phoneCall
        ..description = ''));
    }

    return options;
  }

  ChatViewModel _talkWithAVetViewModel() {
    return actionsChat.singleOptions(
        ContactVetChatFlow.talkToAVet(),
        _talkWithAVetOptions()
          ..add(OptionViewModel<ContactVetMessageType>((b) => b
            ..key = ContactVetMessageType.noThanks
            ..description = '')));
  }

  String _editCalendlyURL(String calendlyURL) {
    final species = currentState.pet?.species;
    return calendlyURL
        .replaceAll('{fullPhoneNumber}', currentState.user.fullPhoneNumber)
        .replaceAll('{userName}', currentState.user.fullName)
        .replaceAll('{userEmail}', currentState.user.email ?? '')
        .replaceAll('{petSpecies}', species == 'dog' ? '1' : '2')
        .replaceAll('{petName}', currentState.pet?.name ?? '')
        .replaceAll('{petAge}', currentState.pet?.fullAge ?? '');
  }

  Stream<ChatViewModel> _onLaunchPhone() async* {
    currentState = currentState.rebuild((builder) => builder
      ..channelType = ChannelType.phone
      ..status = ContactVetStatus.schedulePhoneInProgress);
    final _data = {'channel': _contactMessages.inputs.phone, 'brandName': _configuration.brandName};
    yield* actionsChat.botMessageType(ContactVetMessageType.letsConnectVideoOrPhone, data: _data);
    yield* actionsChat.botMessageType(ContactVetMessageType.letsConnectVideoOrPhoneInformation);

    final calendlyURL = _editCalendlyURL(_configuration.chatOnPhoneCallUrl);

    final options = [ChatButtonOptionType.schedulePhoneCall, ChatButtonOptionType.noThanks];
    yield actionsChat.buttonsInput(options, data: {'appointment_url': calendlyURL});
  }

  ContactVetState _addChatViewModelToState(ChatViewModel viewModel, [ContactVetStatus status]) {
    currentState = currentState.rebuild((b) => b
      ..viewModel = viewModel
      ..status = status ?? currentState.status
      ..status);

    return currentState;
  }

  Stream<ContactVetState> _addChatViewModelStreamToState(Stream<ChatViewModel> viewModelStream,
      [ContactVetStatus status]) {
    return viewModelStream.map((ChatViewModel viewModel) => _addChatViewModelToState(viewModel, status));
  }
}
