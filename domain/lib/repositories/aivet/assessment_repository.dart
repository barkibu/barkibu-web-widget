import 'package:common_barkibu_dart/datasources/datasources.dart';
import 'package:common_barkibu_dart/models/models.dart';

abstract class AssessmentRepository {
  Future<Assessment> getAssessment(String consultationId);
}

class AssessmentRepositoryImpl implements AssessmentRepository {
  final AssessmentDatasource _assessmentDatasource;

  AssessmentRepositoryImpl(this._assessmentDatasource);

  @override
  Future<Assessment> getAssessment(String consultationId) {
    return _assessmentDatasource.getAssessment(consultationId);
  }
}
