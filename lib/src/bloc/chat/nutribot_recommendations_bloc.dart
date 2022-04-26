import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';

abstract class NutribotRecommendationEvent {}

class NutribotRecommendationOpened extends NutribotRecommendationEvent {
  final String title;
  final String petName;
  final FoodRecommended foodRecommended;

  NutribotRecommendationOpened({this.title, this.petName, this.foodRecommended});
}

class NutribotRecommendationClosed extends NutribotRecommendationEvent {}

abstract class NutribotRecommendationState {}

class NutribotRecommendationSetSuccess extends NutribotRecommendationState {
  final String title;
  final String petName;
  final FoodRecommended foodRecommended;

  NutribotRecommendationSetSuccess({this.title, this.petName, this.foodRecommended});
}

class NutribotRecommendationEmpty extends NutribotRecommendationState {}

class NutribotRecommendationBloc extends Bloc<NutribotRecommendationEvent, NutribotRecommendationState> {
  NutribotRecommendationBloc();

  @override
  NutribotRecommendationState get initialState => NutribotRecommendationEmpty();

  @override
  Stream<NutribotRecommendationState> mapEventToState(NutribotRecommendationEvent event) async* {
    if (event is NutribotRecommendationOpened) {
      yield NutribotRecommendationSetSuccess(
          title: event.title, petName: event.petName, foodRecommended: event.foodRecommended);
    } else if (event is NutribotRecommendationClosed) {
      yield initialState;
    }
  }
}
