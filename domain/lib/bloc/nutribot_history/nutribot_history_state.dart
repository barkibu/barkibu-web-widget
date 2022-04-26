import 'package:common_barkibu_dart/models/nutribot_consultation.dart';

abstract class NutribotHistoryState {}

class NutribotHistoryInitial extends NutribotHistoryState {}

class NutribotHistoryLoadInProgress extends NutribotHistoryState {}

class NutribotHistoryLoadSuccess extends NutribotHistoryState {
  final List<NutribotConsultation> nutribotConsultations;

  NutribotHistoryLoadSuccess(this.nutribotConsultations);
}

class NutribotHistoryLoadFailure extends NutribotHistoryState {}
