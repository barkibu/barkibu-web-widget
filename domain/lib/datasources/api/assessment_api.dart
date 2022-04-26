import 'package:chopper/chopper.dart';

part 'assessment_api.chopper.dart';

abstract class AssessmentApi {
  Future<Response> getAssessment(String consultationId);
}

@ChopperApi(baseUrl: 'assessments')
abstract class AssessmentApiImpl extends ChopperService implements AssessmentApi {
  static AssessmentApi create([ChopperClient client]) => _$AssessmentApiImpl(client);

  @Get(path: '/{consultationId}')
  @override
  Future<Response> getAssessment(@Path() String consultationId);
}
