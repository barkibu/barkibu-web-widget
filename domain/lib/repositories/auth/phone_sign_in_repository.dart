import 'package:common_barkibu_dart/datasources/auth/phone_sign_in_datasource.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/api/api_errors.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/auth/phone_sign_in.dart';
import 'package:common_barkibu_dart/viewmodels/auth/auth_data.dart';

abstract class PhoneSignInOperationResult {}

class PhoneSignInOperationSuccess extends PhoneSignInOperationResult {
  String accessToken;

  PhoneSignInOperationSuccess({this.accessToken});
}

class PhoneSignInOperationError extends PhoneSignInOperationResult {
  final PhoneSignInOperationErrorType errorType;

  PhoneSignInOperationError(this.errorType);
}

enum PhoneSignInOperationErrorType { invalidPhone, incorrectCode, generalError, phoneNotFound }

abstract class PhoneSignInRepository {
  Future<PhoneSignInOperationResult> sendVerificationCode(AuthData authData);
  Future<PhoneSignInOperationResult> signIn(AuthData authData);
}

class PhoneSignInRepositoryImpl implements PhoneSignInRepository {
  final PhoneSignInDatasource _datasource;

  PhoneSignInRepositoryImpl(this._datasource);

  @override
  Future<PhoneSignInOperationResult> sendVerificationCode(AuthData authData) async {
    final response = await _datasource.sendVerificationCode(authData);
    if (response is PhoneVerificationResponse) {
      return PhoneSignInOperationSuccess();
    } else {
      return _buildErrorOperationResult(response);
    }
  }

  @override
  Future<PhoneSignInOperationResult> signIn(AuthData authData) async {
    final response = await _datasource.signIn(authData);
    if (response is PhoneSignInResponse) {
      return PhoneSignInOperationSuccess(accessToken: response.accessToken);
    } else {
      return _buildErrorOperationResult(response);
    }
  }

  PhoneSignInOperationError _buildErrorOperationResult(ApiErrorResponse response) {
    return PhoneSignInOperationError(_errorType(response.error));
  }

  PhoneSignInOperationErrorType _errorType(String errorMessage) {
    return {
          'incorrect_code': PhoneSignInOperationErrorType.incorrectCode,
          'invalid_phone_number': PhoneSignInOperationErrorType.invalidPhone,
          'Not Found': PhoneSignInOperationErrorType.phoneNotFound
        }[errorMessage] ??
        PhoneSignInOperationErrorType.generalError;
  }
}
