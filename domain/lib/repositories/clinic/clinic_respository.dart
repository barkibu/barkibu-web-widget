import 'package:common_barkibu_dart/datasources/clinic/clinic_datasource.dart';
import 'package:common_barkibu_dart/models/clinic.dart';

abstract class ClinicRepository {
  Future<List<Clinic>> getClinicsByCoords(String latitude, String longitude);

  Future<List<Clinic>> getClinicsByAddress(String address);
}

class ClinicRepositoryImpl implements ClinicRepository {
  final ClinicDatasource _clinicDatasource;

  ClinicRepositoryImpl(this._clinicDatasource);

  @override
  Future<List<Clinic>> getClinicsByAddress(String address) {
    return _clinicDatasource.getClinicsByAddress(address);
  }

  @override
  Future<List<Clinic>> getClinicsByCoords(String latitude, String longitude) {
    return _clinicDatasource.getClinicsByCoords(latitude, longitude);
  }
}
