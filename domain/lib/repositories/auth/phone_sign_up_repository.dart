import 'package:common_barkibu_dart/common_barkibu_dart.dart';

abstract class PhoneSignUpOperationResult {}

class PhoneSignUpOperationSuccess extends PhoneSignUpOperationResult {
  String accessToken;

  PhoneSignUpOperationSuccess({this.accessToken});
}

class PhoneSignUpOperationError extends PhoneSignUpOperationResult {
  final PhoneSignUpOperationErrorType errorType;

  PhoneSignUpOperationError(this.errorType);
}

enum PhoneSignUpOperationErrorType { invalidPhone, incorrectCode, generalError }

abstract class PhoneSignUpRepository {
  Future<PhoneSignUpOperationResult> sendVerificationCode(AuthData authData);
  Future<PhoneSignUpOperationResult> signUp(AuthData authData);
}

class PhoneSignUpRepositoryImpl implements PhoneSignUpRepository {
  final PhoneSignUpDatasource _datasource;

  PhoneSignUpRepositoryImpl(this._datasource);

  @override
  Future<PhoneSignUpOperationResult> sendVerificationCode(AuthData authData) async {
    final response = await _datasource.sendVerificationCode(authData);
    if (response is PhoneVerificationResponse) {
      return PhoneSignUpOperationSuccess();
    } else {
      return _buildErrorOperationResult(response);
    }
  }

  @override
  Future<PhoneSignUpOperationResult> signUp(AuthData authData) async {
    final response = await _datasource.signUp(authData);
    if (response is PhoneSignUpResponse) {
      return PhoneSignUpOperationSuccess(accessToken: response.accessToken);
    } else {
      return _buildErrorOperationResult(response);
    }
  }

  PhoneSignUpOperationError _buildErrorOperationResult(ApiErrorResponse response) {
    return PhoneSignUpOperationError(_errorType(response.error));
  }

  PhoneSignUpOperationErrorType _errorType(String errorMessage) {
    return {
          'incorrect_code': PhoneSignUpOperationErrorType.incorrectCode,
          'invalid_phone_number': PhoneSignUpOperationErrorType.invalidPhone
        }[errorMessage] ??
        PhoneSignUpOperationErrorType.generalError;
  }
}
