import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:common_barkibu_dart/bloc/pet_health_chat/triage/triage_event.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:common_barkibu_dart/models/pet.dart';
import 'package:common_barkibu_dart/shared/chat/aivet_chat_title.dart';
import 'package:common_barkibu_dart/viewmodels/viewmodels.dart';

part 'pet_health_chat_event.g.dart';
part 'symptom_definition/symptom_definition_event.dart';

abstract class PetHealthChatEvent {}

abstract class PetHealthChatSubStateUpdated
    implements Built<PetHealthChatSubStateUpdated, PetHealthChatSubStateUpdatedBuilder>, PetHealthChatEvent {
  static Serializer<PetHealthChatSubStateUpdated> get serializer => _$petHealthChatSubStateUpdatedSerializer;

  PetHealthChatState get petHealthChatState;

  PetHealthChatSubStateUpdated._();

  factory PetHealthChatSubStateUpdated([void Function(PetHealthChatSubStateUpdatedBuilder) updates]) =
      _$PetHealthChatSubStateUpdated;
}

abstract class PetHealthChatViewModelAdded
    implements Built<PetHealthChatViewModelAdded, PetHealthChatViewModelAddedBuilder>, PetHealthChatEvent {
  @nullable
  ChatViewModel get viewModel;

  PetHealthChatViewModelAdded._();

  factory PetHealthChatViewModelAdded([void Function(PetHealthChatViewModelAddedBuilder) updates]) =
      _$PetHealthChatViewModelAdded;
}

class PetHealthTriageEnded extends PetHealthChatEvent {}

abstract class PetHealthChatInitLaunched
    implements Built<PetHealthChatInitLaunched, PetHealthChatInitLaunchedBuilder>, PetHealthChatEvent {
  static Serializer<PetHealthChatInitLaunched> get serializer => _$petHealthChatInitLaunchedSerializer;

  @nullable
  Pet get pet;

  User get user;

  String get question;

  PetHealthChatType get type;

  static void _initializeBuilder(PetHealthChatInitLaunchedBuilder builder) =>
      builder..type = PetHealthChatType.virtualVet;

  PetHealthChatInitLaunched._();

  factory PetHealthChatInitLaunched([void Function(PetHealthChatInitLaunchedBuilder) updates]) =
      _$PetHealthChatInitLaunched;
}

class PetHealthContactVetEnded extends PetHealthChatEvent {}

class PetHealthChatAskAnotherQuestionPressed extends PetHealthChatEvent {}

class PetHealthChatGoHomePressed extends PetHealthChatEvent {}

class PetHealthChatVirtualVetStarted extends PetHealthChatEvent {}

class PetHealthChatProcessStarted extends PetHealthChatEvent {
  final PetHealthChatType petHealthChatType;
  final String userQuestion;

  PetHealthChatProcessStarted(this.petHealthChatType, {this.userQuestion})
      : assert(petHealthChatType != PetHealthChatType.concierge);
}

class PetHealthChatTalkWithAVetPressed extends PetHealthChatEvent {
  final bool showQuestion;

  PetHealthChatTalkWithAVetPressed({this.showQuestion = false});
}

class PetHealthAssessmentReportShowed extends PetHealthChatEvent {}

class PetHealthChatPersonalRecommendationsPressed extends PetHealthChatEvent {}

abstract class PetHealthChatFeedbackPressed
    implements Built<PetHealthChatFeedbackPressed, PetHealthChatFeedbackPressedBuilder>, PetHealthChatEvent {
  static Serializer<PetHealthChatFeedbackPressed> get serializer => _$petHealthChatFeedbackPressedSerializer;

  bool get isAnswerYes;

  PetHealthChatFeedbackPressed._();

  factory PetHealthChatFeedbackPressed([void Function(PetHealthChatFeedbackPressedBuilder) updates]) =
      _$PetHealthChatFeedbackPressed;
}

class PetHealthChatEnd extends PetHealthChatEvent {}
