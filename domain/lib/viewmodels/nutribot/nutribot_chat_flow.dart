import 'package:common_barkibu_dart/viewmodels/chat/chat_flow.dart';

abstract class NutribotChatFlow extends ChatFlow {
  NutribotChatFlow();

  factory NutribotChatFlow.askWeightManagement() = AskWeightManagementNutribotChatFlow;
  factory NutribotChatFlow.askIsOutdoorCat() = AskIsOutdoorCatNutribotChatFlow;
  factory NutribotChatFlow.askDullCoatOrDrySkin() = AskDullCoatOrDrySkinNutribotChatFlow;
  factory NutribotChatFlow.askHipJointsIssues() = AskHipJointsNutribotChatFlow;
  factory NutribotChatFlow.askFoodSensitivity() = AskFoodSensitivityNutribotChatFlow;
  factory NutribotChatFlow.askPreferedFoodType() = AskPreferedFoodTypeNutribotChatFlow;
  factory NutribotChatFlow.askFeedback() = AskFeedbackNutribotChatFlow;
}

class AskWeightManagementNutribotChatFlow extends NutribotChatFlow {}

class AskIsOutdoorCatNutribotChatFlow extends NutribotChatFlow {}

class AskDullCoatOrDrySkinNutribotChatFlow extends NutribotChatFlow {}

class AskHipJointsNutribotChatFlow extends NutribotChatFlow {}

class AskFoodSensitivityNutribotChatFlow extends NutribotChatFlow {}

class AskPreferedFoodTypeNutribotChatFlow extends NutribotChatFlow {}

class AskFeedbackNutribotChatFlow extends NutribotChatFlow {}
