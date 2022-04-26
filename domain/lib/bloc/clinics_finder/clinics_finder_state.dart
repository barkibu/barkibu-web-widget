import 'package:built_value/built_value.dart';
import 'package:common_barkibu_dart/models/clinic.dart';

part 'clinics_finder_state.g.dart';

abstract class ClinicsFinderState {
  List<Clinic> get clinics;
  bool get geolocationAllowed;
}

abstract class ClinicsFinderInitial
    implements Built<ClinicsFinderInitial, ClinicsFinderInitialBuilder>, ClinicsFinderState {
  static void _initializeBuilder(ClinicsFinderInitialBuilder builder) => builder
    ..clinics = []
    ..geolocationAllowed = true;
  ClinicsFinderInitial._();
  factory ClinicsFinderInitial([void Function(ClinicsFinderInitialBuilder) updates]) = _$ClinicsFinderInitial;
}

abstract class ClinicsFinderLoadedSuccess
    implements Built<ClinicsFinderLoadedSuccess, ClinicsFinderLoadedSuccessBuilder>, ClinicsFinderState {
  static void _initializeBuilder(ClinicsFinderLoadedSuccessBuilder builder) => builder
    ..clinics = []
    ..geolocationAllowed = true;
  ClinicsFinderLoadedSuccess._();
  factory ClinicsFinderLoadedSuccess([void Function(ClinicsFinderLoadedSuccessBuilder) updates]) =
      _$ClinicsFinderLoadedSuccess;
}

abstract class ClinicsFinderLoading
    implements Built<ClinicsFinderLoading, ClinicsFinderLoadingBuilder>, ClinicsFinderState {
  static void _initializeBuilder(ClinicsFinderLoadingBuilder builder) => builder
    ..clinics = []
    ..geolocationAllowed = true;
  ClinicsFinderLoading._();
  factory ClinicsFinderLoading([void Function(ClinicsFinderLoadingBuilder) updates]) = _$ClinicsFinderLoading;
}