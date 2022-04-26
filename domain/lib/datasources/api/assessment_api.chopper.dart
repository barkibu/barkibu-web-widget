// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$AssessmentApiImpl extends AssessmentApiImpl {
  _$AssessmentApiImpl([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AssessmentApiImpl;

  @override
  Future<Response<dynamic>> getAssessment(String consultationId) {
    final $url = 'assessments/$consultationId';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
