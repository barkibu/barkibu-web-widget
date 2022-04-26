import 'package:common_barkibu_dart/datasources/valueobjects/clinic/clinic.dart';
import 'package:test/test.dart';

void main() {
  var clinicResponse = ClinicResponse(1, 'irrelevant', 'irrelevant', 'irrelevant', 'irrelevant',
      ClinicBrandIconResponse('assets/images/icon_hospital.svg'), 'irrelevant', [ClinicHoursResponse('day', 'time')]);

  var clinicJsonResponse = <String, dynamic>{
    'id': clinicResponse.id,
    'name': clinicResponse.name,
    'address': clinicResponse.address,
    'phoneNumber': clinicResponse.phoneNumber,
    'brandName': clinicResponse.brand,
    'distance': clinicResponse.distance,
    'hours': [ClinicHoursResponse('day', 'time').toJson()]
  };

  var locatedClinicResponse = LocatedClinicResponse(
    clinicResponse,
    2222.22,
    'units',
  );

  var locatedClinicJsonResponse = <String, dynamic>{
    'clinic': locatedClinicResponse.clinic.toJson(),
    'distance': locatedClinicResponse.distance,
    'units': locatedClinicResponse.units,
  };

  group('ClinicResponse', () {
    test('transform Json to ClinicResponse', () async {
      expect(ClinicResponse.fromJson(clinicJsonResponse).name, clinicResponse.name);
    });
  });

  group('LocatedClinicResponse', () {
    test('transform Json to LocatedClinicResponse', () async {
      expect(LocatedClinicResponse.fromJson(locatedClinicJsonResponse).distance, locatedClinicResponse.distance);
    });
  });

  group('LocatedClinicsResponse', () {
    var locatedClinicsJsonResponse = [locatedClinicJsonResponse, locatedClinicJsonResponse];

    test('transform Json to list of petResponse', () async {
      var fromJson = LocatedClinicsResponse.fromJson(locatedClinicsJsonResponse);

      expect(fromJson[0].distance, locatedClinicResponse.distance);
      expect(fromJson.length, 2);
    });
  });
}
