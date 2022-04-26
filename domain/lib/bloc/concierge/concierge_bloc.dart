import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/datasources/concierge/concierge_connector.dart';
import 'package:common_barkibu_dart/bloc/concierge/concierge_event.dart';
import 'package:common_barkibu_dart/bloc/concierge/concierge_state.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/configuration.dart';
import 'package:common_barkibu_dart/shared/chat/actions_chat.dart';
import 'package:common_barkibu_dart/viewmodels/chat/chat_viewmodel.dart';
import 'package:common_barkibu_dart/viewmodels/concierge/concierge_chat_flow.dart';

class ConciergeBloc extends Bloc<ConciergeEvent, ConciergeState> {
  final AnalyticsService _analyticsService = ServiceLocator.container<AnalyticsService>();
  final AuthDatasource authDatasource;
  ConciergeConnector _connector;
  ActionsChat<ConciergeChatFlow> conciergeActionsChat;
  Configuration config = ServiceLocator.container<Configuration>();

  ConciergeBloc(this.authDatasource) {
    conciergeActionsChat = ActionsChat<ConciergeChatFlow>();
  }

  @override
  ConciergeState get initialState => ConciergeInitial();

  ChatViewModel get _textInputViewModel => conciergeActionsChat.textInputSimple(ConciergeChatFlow.inputText());

  Future<Map<String, String>> initialPayload(ConciergeStarted event) async => {
        'locale': ServiceLocator.container<LocaleService>().currentLocale,
        'access_token': await authDatasource.getAccessToken(),
      };

  @override
  Stream<ConciergeState> mapEventToState(ConciergeEvent event) async* {
    if (event is ConciergeStarted) {
      _connector = ServiceLocator.container<ConciergeConnector>();
      _connector.onConnectionErrored = onConnectorErrored;
      _connector.onMessageReceived = onMessageReceived;
      _connector.send({'message': 'Hey concierge! What do you have for me?', 'payload': await initialPayload(event)});
      yield ConciergeTurnSuccessful();
    }

    if (event is ConciergeMessageReceived) {
      await for (final viewModel in _mapEventToViewModel(event.payload)) {
        yield ConciergeTurnSuccessful((b) => b..viewModel = viewModel);
      }
    }

    if (event is ConciergeMessageSent) {
      _connector.send({'message': event.message, 'payload': event.payload ?? {}});
      final viewModel = ChatViewModel.message(true, event.message, editable: true);
      yield ConciergeTurnSuccessful((b) => b..viewModel = viewModel);
    }

    if (event is ConciergeRollbackAnswerPressed) {
      _connector.send({
        'message': 'Answer Correction',
        'payload': {'type': 'rollback', 'rollback_count': event.answersCount}
      });
    }

    if (event is ConciergeHandoverReceived) {
      yield ConciergeHandoverSuccessful<String>((b) => b
        ..type = event.type
        ..payload = event.payload);
    }

    if (event is ConciergeHandoverCompleted) {
      _connector.send({'message': 'Handover Completed', 'payload': event.payload ?? {}});
    }

    if (event is ConciergeConnectionErrored) {
      yield ConciergeConnectionFailure();
    }
  }

  Stream<ChatViewModel> _mapEventToViewModel(eventStr) async* {
    final event = ConciergeMessage.fromJsonString(eventStr);

    if (event is ViewModelable) {
      yield (event as ViewModelable).messageViewModel;
    }
    if (event is ConciergeButtonsMessage) {
      _analyticsService.event.aivet.logShowsMenu();
      yield conciergeActionsChat.singleOptions(ConciergeChatFlow.selectOption(), event.options);
    }
    if (event is ConciergeHandoverMessage) {
      add(ConciergeHandoverReceived(event.handoverType, payload: event.handoverPayload));
    }
    if (event.type == ConciergeMessageType.TEXT) {
      yield _textInputViewModel;
    }
  }

  void onMessageReceived(dynamic event) {
    add(ConciergeMessageReceived(event));
  }

  void onConnectorErrored() {
    add(ConciergeConnectionErrored());
  }

  @override
  Future<void> close() {
    _connector?.close();
    return super.close();
  }
}
