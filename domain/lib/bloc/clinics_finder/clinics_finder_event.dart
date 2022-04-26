import 'package:built_value/built_value.dart';

part 'clinics_finder_event.g.dart';

abstract class ClinicsFinderEvent {}

abstract class ClinicsFinderAddressStarted
    implements Built<ClinicsFinderAddressStarted, ClinicsFinderAddressStartedBuilder>, ClinicsFinderEvent {
  String get address;

  ClinicsFinderAddressStarted._();
  factory ClinicsFinderAddressStarted([void Function(ClinicsFinderAddressStartedBuilder) updates]) =
      _$ClinicsFinderAddressStarted;
}

abstract class ClinicsFinderPositionStarted
    implements Built<ClinicsFinderPositionStarted, ClinicsFinderPositionStartedBuilder>, ClinicsFinderEvent {
  String get latitude;
  String get longitude;

  ClinicsFinderPositionStarted._();
  factory ClinicsFinderPositionStarted([void Function(ClinicsFinderPositionStartedBuilder) updates]) =
      _$ClinicsFinderPositionStarted;
}

abstract class ClinicsFinderGeolocationRefused
    implements Built<ClinicsFinderGeolocationRefused, ClinicsFinderGeolocationRefusedBuilder>, ClinicsFinderEvent {
  ClinicsFinderGeolocationRefused._();
  factory ClinicsFinderGeolocationRefused([void Function(ClinicsFinderGeolocationRefusedBuilder) updates]) =
  _$ClinicsFinderGeolocationRefused;
}
