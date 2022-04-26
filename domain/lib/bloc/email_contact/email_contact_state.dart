abstract class EmailContactState {}

class EmailContactInitial extends EmailContactState {}

class EmailContactLoadInProgress extends EmailContactState {}

class EmailContactLoadFinished extends EmailContactState {}

class EmailContactLoadFailed extends EmailContactState {}
