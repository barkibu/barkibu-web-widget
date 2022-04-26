import 'package:common_barkibu_dart/models/clinic_hours.dart';

class Clinic {
  int id;
  String name;
  String address;
  String phoneNumber;
  String brand;
  ClinicBrandIcon brandIcon;
  String distance;
  List<ClinicHours> hours;

  Clinic({this.id, this.name, this.address, this.phoneNumber, this.brand, this.brandIcon, this.distance, this.hours});
}

class ClinicBrandIcon {
  String full;

  ClinicBrandIcon({
    this.full,
  });
}
