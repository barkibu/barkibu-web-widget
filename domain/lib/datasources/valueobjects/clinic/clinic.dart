import 'package:common_barkibu_dart/models/clinic.dart';
import 'package:common_barkibu_dart/models/clinic_hours.dart';
import 'package:json_annotation/json_annotation.dart';

part 'clinic.g.dart';

@JsonSerializable()
class LocatedClinicResponse {
  final ClinicResponse clinic;
  final double distance;
  final String units;

  const LocatedClinicResponse(
    this.clinic,
    this.distance,
    this.units,
  );

  factory LocatedClinicResponse.fromJson(Map<String, dynamic> json) => _$LocatedClinicResponseFromJson(json);

  Map<String, dynamic> toJson() => <String, dynamic>{'locatedClinic': _$LocatedClinicResponseToJson(this)};

  Clinic toClinic() => Clinic(
      id: clinic.id,
      name: clinic.name,
      address: clinic.address,
      phoneNumber: clinic.phoneNumber,
      brand: clinic.brand,
      brandIcon: clinic.brandIcon.toClinicBrandIcon(),
      distance: distance.toStringAsFixed(2) + ' ' + units,
      hours: (clinic.hours.map((hoursResponse) => hoursResponse.toClinicHours()))
          .where((hourResponse) => hourResponse.time != null && hourResponse.time.isNotEmpty)
          .toList());
}

@JsonSerializable()
class ClinicResponse {
  final int id;
  final String name;
  final String address;
  final String phoneNumber;
  final String brand;
  final ClinicBrandIconResponse brandIcon;
  final String distance;
  final List<ClinicHoursResponse> hours;

  const ClinicResponse(
    this.id,
    this.name,
    this.address,
    this.phoneNumber,
    this.brand,
    this.brandIcon,
    this.distance,
    this.hours,
  );

  factory ClinicResponse.fromJson(Map<String, dynamic> json) => _$ClinicResponseFromJson(json);

  Map<String, dynamic> toJson() => <String, dynamic>{'clinic': _$ClinicResponseToJson(this)};
}

class LocatedClinicsResponse {
  static List<LocatedClinicResponse> fromJson(List<dynamic> json) =>
      json?.map((dynamic locatedClinic) => LocatedClinicResponse.fromJson(locatedClinic))?.toList() ?? [];
}

@JsonSerializable()
class ClinicHoursResponse {
  final String day;
  final String time;

  const ClinicHoursResponse(
    this.day,
    this.time,
  );

  factory ClinicHoursResponse.fromJson(Map<String, dynamic> json) => _$ClinicHoursResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ClinicHoursResponseToJson(this);

  ClinicHours toClinicHours() => ClinicHours(
        day: day,
        time: time,
      );
}

@JsonSerializable()
class ClinicBrandIconResponse {
  final String full;

  ClinicBrandIconResponse(this.full);

  factory ClinicBrandIconResponse.fromJson(Map<String, dynamic> json) => _$ClinicBrandIconResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ClinicBrandIconResponseToJson(this);

  ClinicBrandIcon toClinicBrandIcon() => ClinicBrandIcon(full: full);
}
