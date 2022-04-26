import 'package:web_widget/src/bloc/chat/info_bloc.dart';

enum CurrentChatScreen {
  aiVet,
  report,
  chatWithVet,
  emailSender,
  symptomInfo,
  nutribot,
}

class HasInfoScreen {
  CurrentChatScreen currentScreen;
  InfoBloc _infoBloc;
  InfoSetSuccess infoState;

  void setInfoBloc(InfoBloc infoBloc) {
    _infoBloc = infoBloc;
    _infoBloc.listen(symptomInfoListener);
  }

  void closeSymtomInfoBloc() {
    _infoBloc.close();
  }

  void symptomInfoListener(InfoState state) {
    if (state is InfoSetSuccess) {
      infoState = state;
    } else {
      infoState = null;
    }
  }

  bool get infoIsEmpty => infoState == null;

  void setCurrentScreen(CurrentChatScreen screen) => currentScreen = screen;

  bool get isAivetScreenActive => currentScreen == CurrentChatScreen.aiVet;
  bool get isAssessmentReportScreenActive => currentScreen == CurrentChatScreen.report;
  bool get isNutribotScreenActive => currentScreen == CurrentChatScreen.nutribot;
  bool get isChatWithVetScreenActive => currentScreen == CurrentChatScreen.chatWithVet;
  bool get isEmailSenderScreenActive => currentScreen == CurrentChatScreen.emailSender;
  bool get isSymptomInfoScreenActive => currentScreen == CurrentChatScreen.symptomInfo;
}
