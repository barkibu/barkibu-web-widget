abstract class UserActionException implements Exception {
  Map<String, List<String>> get errors;

  @override
  String toString() {
    return errors.keys.map((k) => '$k ${errors[k].join(" ,")}').join('. ');
  }
}

class UserSignUpException extends UserActionException {
  @override
  Map<String, List<String>> errors;
  UserSignUpException(this.errors);
}

class UserUpdateException extends UserActionException {
  @override
  Map<String, List<String>> errors;
  UserUpdateException(this.errors);
}
