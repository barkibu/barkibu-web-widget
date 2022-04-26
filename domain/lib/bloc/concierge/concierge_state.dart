import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:common_barkibu_dart/datasources/concierge/concierge_message.dart';
import 'package:common_barkibu_dart/viewmodels/chat/chat_viewmodel.dart';

part 'concierge_state.g.dart';

abstract class ConciergeState {
  @nullable
  ChatViewModel get viewModel;
}

class ConciergeInitial extends ConciergeState {
  @override
  ChatViewModel get viewModel => null;
}

abstract class ConciergeTurnSuccessful
    implements Built<ConciergeTurnSuccessful, ConciergeTurnSuccessfulBuilder>, ConciergeState {
  static Serializer<ConciergeTurnSuccessful> get serializer => _$conciergeTurnSuccessfulSerializer;

  ConciergeTurnSuccessful._();
  factory ConciergeTurnSuccessful([Function(ConciergeTurnSuccessfulBuilder builder) updates]) =
      _$ConciergeTurnSuccessful;
}

abstract class ConciergeHandoverSuccessful<T>
    implements Built<ConciergeHandoverSuccessful<T>, ConciergeHandoverSuccessfulBuilder<T>>, ConciergeState {
  static Serializer<ConciergeHandoverSuccessful> get serializer => _$conciergeHandoverSuccessfulSerializer;

  HandoverType get type;

  @nullable
  T get payload;

  ConciergeHandoverSuccessful._();
  factory ConciergeHandoverSuccessful([Function(ConciergeHandoverSuccessfulBuilder<T> builder) updates]) =
      _$ConciergeHandoverSuccessful<T>;
}

abstract class ConciergeConnectionFailure
    implements Built<ConciergeConnectionFailure, ConciergeConnectionFailureBuilder>, ConciergeState {
  static Serializer<ConciergeConnectionFailure> get serializer => _$conciergeConnectionFailureSerializer;

  ConciergeConnectionFailure._();
  factory ConciergeConnectionFailure([Function(ConciergeConnectionFailureBuilder builder) updates]) =
      _$ConciergeConnectionFailure;
}
