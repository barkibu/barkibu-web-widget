import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:common_barkibu_dart/bloc/nutribot_chat/nutribot_chat.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/models/models.dart';

part 'nutribot_chat_event.g.dart';

abstract class NutribotChatEvent {}

abstract class NutribotChatSubStateUpdated
    implements Built<NutribotChatSubStateUpdated, NutribotChatSubStateUpdatedBuilder>, NutribotChatEvent {
  static Serializer<NutribotChatSubStateUpdated> get serializer => _$nutribotChatSubStateUpdatedSerializer;

  NutribotChatState get nutribotChatState;

  NutribotChatSubStateUpdated._();
  factory NutribotChatSubStateUpdated([void Function(NutribotChatSubStateUpdatedBuilder) updates]) =
      _$NutribotChatSubStateUpdated;
}

class NutribotPetDefinitionEndedEvent extends NutribotChatEvent {}

abstract class NutribotChatStarted
    implements Built<NutribotChatStarted, NutribotChatStartedBuilder>, NutribotChatEvent {
  static Serializer<NutribotChatStarted> get serializer => _$nutribotChatStartedSerializer;

  @nullable
  Pet get pet;

  User get user;

  bool get shouldAskFeedback;

  static void _initializeBuilder(NutribotChatStartedBuilder builder) => builder..shouldAskFeedback = true;

  NutribotChatStarted._();
  factory NutribotChatStarted([void Function(NutribotChatStartedBuilder) updates]) = _$NutribotChatStarted;
}

abstract class NutribotChatWeightManagementPressed
    implements
        Built<NutribotChatWeightManagementPressed, NutribotChatWeightManagementPressedBuilder>,
        NutribotChatEvent {
  static Serializer<NutribotChatWeightManagementPressed> get serializer =>
      _$nutribotChatWeightManagementPressedSerializer;

  bool get needsWeightManagementFood;

  NutribotChatWeightManagementPressed._();
  factory NutribotChatWeightManagementPressed([void Function(NutribotChatWeightManagementPressedBuilder) updates]) =
      _$NutribotChatWeightManagementPressed;
}

abstract class NutribotChatIsOutdoorCatPressed
    implements Built<NutribotChatIsOutdoorCatPressed, NutribotChatIsOutdoorCatPressedBuilder>, NutribotChatEvent {
  static Serializer<NutribotChatIsOutdoorCatPressed> get serializer => _$nutribotChatIsOutdoorCatPressedSerializer;

  bool get isOutdoor;

  NutribotChatIsOutdoorCatPressed._();
  factory NutribotChatIsOutdoorCatPressed([void Function(NutribotChatIsOutdoorCatPressedBuilder) updates]) =
      _$NutribotChatIsOutdoorCatPressed;
}

abstract class NutribotDullCoatOrDrySkinPressed
    implements Built<NutribotDullCoatOrDrySkinPressed, NutribotDullCoatOrDrySkinPressedBuilder>, NutribotChatEvent {
  bool get hasDullCoatOrDrySkin;

  NutribotDullCoatOrDrySkinPressed._();
  factory NutribotDullCoatOrDrySkinPressed([void Function(NutribotDullCoatOrDrySkinPressedBuilder) updates]) =
      _$NutribotDullCoatOrDrySkinPressed;
}

abstract class NutribotChatHipJointsPressed
    implements Built<NutribotChatHipJointsPressed, NutribotChatHipJointsPressedBuilder>, NutribotChatEvent {
  static Serializer<NutribotChatHipJointsPressed> get serializer => _$nutribotChatHipJointsPressedSerializer;

  bool get hasHipJointIssues;

  NutribotChatHipJointsPressed._();
  factory NutribotChatHipJointsPressed([void Function(NutribotChatHipJointsPressedBuilder) updates]) =
      _$NutribotChatHipJointsPressed;
}

abstract class NutribotChatFoodSensitivitiesPressed
    implements
        Built<NutribotChatFoodSensitivitiesPressed, NutribotChatFoodSensitivitiesPressedBuilder>,
        NutribotChatEvent {
  static Serializer<NutribotChatFoodSensitivitiesPressed> get serializer =>
      _$nutribotChatFoodSensitivitiesPressedSerializer;

  List<OptionViewModel> get foodSensitivityOptions;

  NutribotChatFoodSensitivitiesPressed._();
  factory NutribotChatFoodSensitivitiesPressed([void Function(NutribotChatFoodSensitivitiesPressedBuilder) updates]) =
      _$NutribotChatFoodSensitivitiesPressed;
}

abstract class NutribotChatPreferedFoodTypePressed
    implements
        Built<NutribotChatPreferedFoodTypePressed, NutribotChatPreferedFoodTypePressedBuilder>,
        NutribotChatEvent {
  static Serializer<NutribotChatPreferedFoodTypePressed> get serializer =>
      _$nutribotChatPreferedFoodTypePressedSerializer;

  OptionViewModel<FoodType> get preferedFoodTypeOption;

  NutribotChatPreferedFoodTypePressed._();
  factory NutribotChatPreferedFoodTypePressed([void Function(NutribotChatPreferedFoodTypePressedBuilder) updates]) =
      _$NutribotChatPreferedFoodTypePressed;
}

abstract class NutribotFoodRecommendationsRequested
    implements
        Built<NutribotFoodRecommendationsRequested, NutribotFoodRecommendationsRequestedBuilder>,
        NutribotChatEvent {
  NutribotFoodRecommendationsRequested._();

  factory NutribotFoodRecommendationsRequested([void Function(NutribotFoodRecommendationsRequestedBuilder) updates]) =
      _$NutribotFoodRecommendationsRequested;
}

abstract class NutribotFoodRecommendationsDisplayed
    implements
        Built<NutribotFoodRecommendationsDisplayed, NutribotFoodRecommendationsDisplayedBuilder>,
        NutribotChatEvent {
  NutribotFoodRecommendationsDisplayed._();

  factory NutribotFoodRecommendationsDisplayed([void Function(NutribotFoodRecommendationsDisplayedBuilder) updates]) =
      _$NutribotFoodRecommendationsDisplayed;
}

abstract class NutribotChatFeedbackPressed
    implements Built<NutribotChatFeedbackPressed, NutribotChatFeedbackPressedBuilder>, NutribotChatEvent {
  static Serializer<NutribotChatFeedbackPressed> get serializer => _$nutribotChatFeedbackPressedSerializer;

  bool get feedback;

  NutribotChatFeedbackPressed._();
  factory NutribotChatFeedbackPressed([void Function(NutribotChatFeedbackPressedBuilder) updates]) =
      _$NutribotChatFeedbackPressed;
}

class NutribotAnotherQuestionPressed extends NutribotChatEvent {}

class NutribotTalkWithAVetPressed extends NutribotChatEvent {
  final bool showQuestion;

  NutribotTalkWithAVetPressed({this.showQuestion = false});
}

class NutribotContactVetEnded extends NutribotChatEvent {}
