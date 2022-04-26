import 'dart:async';

class RetryStrategy {
  static const failCountLimit = 5;
  static const initRetryDelay = 1000;
  static const assumeSuccessDelay = 2000;
  static const expFactor = 1.25;

  bool _cancelled = false;

  int failCount = 0;
  int retryDelayMilliseconds = initRetryDelay;

  final Future Function() futureResolvesWhenProcessFails;
  final Function onRepeatedFailure;

  RetryStrategy._(this.futureResolvesWhenProcessFails, this.onRepeatedFailure) {
    _tryProcess();
  }

  void _tryProcess() async {
    if (_cancelled) {
      return;
    }
    final scheduledReset = _scheduleFailCountResetIn(assumeSuccessDelay);
    await futureResolvesWhenProcessFails();
    await scheduledReset.cancel();
    failCount = failCount + 1;
    await Future.delayed(Duration(milliseconds: retryDelayMilliseconds));

    _incrementRetryDelay();

    if (failCount < failCountLimit) {
      _tryProcess();
    } else {
      onRepeatedFailure?.call();
    }
  }

  StreamSubscription<void> _scheduleFailCountResetIn(int seconds) {
    return Future.delayed(Duration(milliseconds: seconds)).asStream().listen((_) {
      failCount = 0;
      retryDelayMilliseconds = initRetryDelay;
    });
  }

  void _incrementRetryDelay() {
    retryDelayMilliseconds = (retryDelayMilliseconds * expFactor).round();
  }

  factory RetryStrategy.launch(Future Function() futureResolvingWhenProcessFails, {Function() onRepeatedFailure}) {
    return RetryStrategy._(futureResolvingWhenProcessFails, onRepeatedFailure);
  }

  void close() {
    _cancelled = true;
  }
}
