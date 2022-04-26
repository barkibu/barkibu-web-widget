abstract class OnBoardingEvent {}

class OnBoardingStarted extends OnBoardingEvent {
  final String userIdentifier;
  final Map<String, dynamic> initState;

  OnBoardingStarted(this.userIdentifier, [Map<String, dynamic> _initState]) : initState = _initState ?? {};
}

class OnBoardingActionAnswer extends OnBoardingEvent {
  final dynamic answer;

  OnBoardingActionAnswer(this.answer);
}

class OnBoardingNextActionerTriggered extends OnBoardingEvent {}

class OnBoardingBackPressed extends OnBoardingEvent {}
