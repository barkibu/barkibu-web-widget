import 'package:common_barkibu_dart/models/clinic.dart';
import 'package:common_barkibu_dart/repositories/clinic/clinic_respository.dart';

abstract class GetClinicsUseCase {
  Future<List<Clinic>> getClinicsByAddress(String address);
  Future<List<Clinic>> getClinicsByPosition(String latitude, String longitude);
}

class GetClinicsUseCaseImpl implements GetClinicsUseCase {
  final ClinicRepository _clinicRepository;

  GetClinicsUseCaseImpl(this._clinicRepository);

  @override
  Future<List<Clinic>> getClinicsByAddress(String address) async =>
      await _clinicRepository.getClinicsByAddress(address);

  @override
  Future<List<Clinic>> getClinicsByPosition(String latitude, String longitude) async =>
      await _clinicRepository.getClinicsByCoords(latitude, longitude);
}
