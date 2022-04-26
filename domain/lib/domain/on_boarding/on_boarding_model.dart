import 'package:common_barkibu_dart/domain/on_boarding/on_boarding_actioner.dart';

class OnBoardingModel {
  final Map<String, dynamic> _state;

  Map<String, dynamic> get state => _state;

  OnBoardingModel([Map<String, dynamic> state]) : _state = state ?? {};

  Map<String, dynamic> getStateFor(OnBoardingActioner actioner) {
    return _state[actioner.key] is Map<String, dynamic> ? _state[actioner.key] : null;
  }

  void setStateFor(OnBoardingActioner actioner, dynamic value) async {
    _state[actioner.key] = value;
  }

  OnBoardingModel clone() => OnBoardingModel(Map.from(_state));

  @override
  String toString() {
    return state.toString();
  }
}
