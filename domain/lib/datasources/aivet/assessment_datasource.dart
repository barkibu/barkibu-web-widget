import 'package:common_barkibu_dart/datasources/api/assessment_api.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/aivet/assessment.dart';
import 'package:common_barkibu_dart/models/models.dart';

class AssessmentDatasourceError extends Error {
  final dynamic error;

  AssessmentDatasourceError(this.error);
}

abstract class AssessmentDatasource {
  Future<Assessment> getAssessment(String consultationId);
}

class AssessmentDatasourceImpl implements AssessmentDatasource {
  final AssessmentApi _assessmentApi;

  AssessmentDatasourceImpl(this._assessmentApi);

  @override
  Future<Assessment> getAssessment(String consultationId) async {
    var response = await _assessmentApi.getAssessment(consultationId);

    if (response.isSuccessful) {
      return AssessmentResponse.fromJson(response.body).toAssessment();
    }
    throw AssessmentDatasourceError(response.error);
  }
}
