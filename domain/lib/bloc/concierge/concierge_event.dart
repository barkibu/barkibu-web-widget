import 'package:common_barkibu_dart/bloc/nutribot_chat/nutribot_chat_event.dart';
import 'package:common_barkibu_dart/bloc/pet_health_chat/pet_health_chat_event.dart';
import 'package:common_barkibu_dart/datasources/concierge/concierge_message.dart';
import 'package:meta/meta.dart';

abstract class ConciergeEvent implements PetHealthChatEvent, NutribotChatEvent {}

class ConciergeStarted implements ConciergeEvent {}

class ConciergeMessageSent<T> implements ConciergeEvent {
  final String message;

  final T payload;

  ConciergeMessageSent({@required this.message, this.payload});
}

class ConciergeMessageReceived implements ConciergeEvent {
  final String payload;

  ConciergeMessageReceived(this.payload);
}

class ConciergeHandoverReceived implements ConciergeEvent {
  final HandoverType type;
  final String payload;

  ConciergeHandoverReceived(this.type, {this.payload});
}

class ConciergeHandoverCompleted<T> implements ConciergeEvent {
  final T payload;

  ConciergeHandoverCompleted(this.payload);
}

class ConciergeRollbackAnswerPressed implements ConciergeEvent {
  final int answersCount;

  ConciergeRollbackAnswerPressed({this.answersCount = 1});
}

class ConciergeConnectionErrored implements ConciergeEvent {}
