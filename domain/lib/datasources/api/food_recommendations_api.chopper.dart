// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_recommendations_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$FoodRecommendationsApiImpl extends FoodRecommendationsApiImpl {
  _$FoodRecommendationsApiImpl([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = FoodRecommendationsApiImpl;

  @override
  Future<Response<dynamic>> getFoodRecommendation(int petId) {
    final $url = 'food_recommendations';
    final $params = <String, dynamic>{'petId': petId};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
