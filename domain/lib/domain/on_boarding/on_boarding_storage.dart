import 'dart:convert';

import 'package:common_barkibu_dart/datasources/datasources.dart';
import 'package:merge_map/merge_map.dart';

import 'on_boarding_model.dart';

class OnBoardingStorage {
  final SecureStorage storage;
  String identifier;

  OnBoardingStorage(this.storage);

  String get storageKey => '$identifier.OnBoarding';

  Future<Map<String, dynamic>> _getStateFromStorage() async {
    try {
      final state = await storage.read(storageKey);
      return Map<String, dynamic>.from(jsonDecode(state));
    } catch (_) {
      return <String, dynamic>{};
    }
  }

  Future<void> persistModel(OnBoardingModel model) async {
    await storage.write(storageKey, jsonEncode(model.state));
  }

  Future<OnBoardingModel> fetchModel(Map<String, dynamic> overrides) async {
    final state = await _getStateFromStorage();
    return OnBoardingModel(mergeMap([state, overrides]));
  }
}
