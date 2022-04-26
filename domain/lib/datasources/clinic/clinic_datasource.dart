import 'package:common_barkibu_dart/datasources/api/clinic_api.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/clinic/clinic.dart';
import 'package:common_barkibu_dart/models/clinic.dart';

class ClinicDatasourceError extends Error {
  final dynamic error;

  ClinicDatasourceError(this.error);
}

abstract class ClinicDatasource {
  Future<List<Clinic>> getClinicsByCoords(String latitude, String longitude);

  Future<List<Clinic>> getClinicsByAddress(String address);
}

class ClinicDatasourceImpl implements ClinicDatasource {
  final ClinicApi _clinicApi;

  ClinicDatasourceImpl(this._clinicApi);

  @override
  Future<List<Clinic>> getClinicsByAddress(String address) async {
    var response = await _clinicApi.getClinicsByAddress(address);
    return response.isSuccessful
        ? LocatedClinicsResponse.fromJson(response.body)
            .map((LocatedClinicResponse locatedClinicsResponse) => locatedClinicsResponse.toClinic())
            .toList()
        : [];
  }

  @override
  Future<List<Clinic>> getClinicsByCoords(String latitude, String longitude) async {
    var response = await _clinicApi.getClinicsByCoords(latitude, longitude);
    return response.isSuccessful
        ? LocatedClinicsResponse.fromJson(response.body)
            .map((LocatedClinicResponse locatedClinicsResponse) => locatedClinicsResponse.toClinic())
            .toList()
        : [];
  }
}
