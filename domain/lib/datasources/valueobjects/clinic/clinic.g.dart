// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocatedClinicResponse _$LocatedClinicResponseFromJson(
    Map<String, dynamic> json) {
  return LocatedClinicResponse(
    json['clinic'] == null
        ? null
        : ClinicResponse.fromJson(json['clinic'] as Map<String, dynamic>),
    (json['distance'] as num)?.toDouble(),
    json['units'] as String,
  );
}

Map<String, dynamic> _$LocatedClinicResponseToJson(
        LocatedClinicResponse instance) =>
    <String, dynamic>{
      'clinic': instance.clinic,
      'distance': instance.distance,
      'units': instance.units,
    };

ClinicResponse _$ClinicResponseFromJson(Map<String, dynamic> json) {
  return ClinicResponse(
    json['id'] as int,
    json['name'] as String,
    json['address'] as String,
    json['phoneNumber'] as String,
    json['brand'] as String,
    json['brandIcon'] == null
        ? null
        : ClinicBrandIconResponse.fromJson(
            json['brandIcon'] as Map<String, dynamic>),
    json['distance'] as String,
    (json['hours'] as List)
        ?.map((e) => e == null
            ? null
            : ClinicHoursResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ClinicResponseToJson(ClinicResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'brand': instance.brand,
      'brandIcon': instance.brandIcon,
      'distance': instance.distance,
      'hours': instance.hours,
    };

ClinicHoursResponse _$ClinicHoursResponseFromJson(Map<String, dynamic> json) {
  return ClinicHoursResponse(
    json['day'] as String,
    json['time'] as String,
  );
}

Map<String, dynamic> _$ClinicHoursResponseToJson(
        ClinicHoursResponse instance) =>
    <String, dynamic>{
      'day': instance.day,
      'time': instance.time,
    };

ClinicBrandIconResponse _$ClinicBrandIconResponseFromJson(
    Map<String, dynamic> json) {
  return ClinicBrandIconResponse(
    json['full'] as String,
  );
}

Map<String, dynamic> _$ClinicBrandIconResponseToJson(
        ClinicBrandIconResponse instance) =>
    <String, dynamic>{
      'full': instance.full,
    };
