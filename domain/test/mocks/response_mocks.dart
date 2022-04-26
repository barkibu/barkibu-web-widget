import 'dart:typed_data';

import 'package:chopper/chopper.dart';
import 'package:http/src/base_response.dart';

class _MockResponse implements Response {
  @override
  dynamic get body => {};

  @override
  bool get isSuccessful => true;

  @override
  BaseResponse get base => null;

  @override
  Uint8List get bodyBytes => null;

  @override
  String get bodyString => '{}';

  @override
  Object get error => null;

  @override
  Map<String, String> get headers => null;

  @override
  Response<NewBodyType> replace<NewBodyType>({BaseResponse base, NewBodyType body, Object bodyError}) {
    return copyWith(base: base, body: body, bodyError: bodyError);
  }

  @override
  Response<NewBodyType> copyWith<NewBodyType>({BaseResponse base, NewBodyType body, Object bodyError}) {
    return Response<NewBodyType>(
      base ?? this.base,
      body ?? (this.body as NewBodyType),
      error: bodyError ?? error,
    );
  }

  @override
  int get statusCode => 200;
}

class MockClinicsResponse extends _MockResponse {
  @override
  dynamic get body => [
        {
          'clinic': {
            'name': 'clinic_name',
            'address': '200',
            'phoneNumber': '123456789',
            'brand': 'vca',
            'brandIcon': {'full': 'image'},
            'hours': [
              {'day': 'monday', 'time': '02PM - 05PM'}
            ]
          },
          'distance': 2.555,
          'units': 'km'
        },
        {
          'clinic': {
            'name': 'clinic_name2',
            'address': '200',
            'phoneNumber': '123456789',
            'brand': 'vca',
            'brandIcon': {'full': 'image2'},
            'hours': [
              {'day': 'monday', 'time': '02PM - 05PM'}
            ]
          },
          'distance': 2.555,
          'units': 'km'
        }
      ];
}

class MockAnamnesisResponse extends _MockResponse {
  @override
  dynamic get body => {
        'shouldStop': false,
        'urgent': false,
        'conditions': [],
        'invalidSymptoms': [],
        'symptoms': [],
        'nextQuestion': null,
      };
}

class MockSymptomsFoundResponse extends _MockResponse {
  @override
  dynamic get body => [
        {'key': 'key1', 'name': 'name1', 'duration': false, 'frequency': false},
        {'key': 'key2', 'name': 'name2', 'duration': true, 'frequency': true},
      ];
}

class MockFeatureResponse extends _MockResponse {
  @override
  dynamic get body => {
        'telehealth': true,
        'insurance': true,
      };
}

class MockEmailResponse extends _MockResponse {
  @override
  dynamic get body => {};
}

class MockBreedsResponse extends _MockResponse {
  @override
  dynamic get body => [
        {'key': 'pug', 'nameEn': 'Pug', 'nameEs': 'Carlino', 'uuidKey': '1111'},
        {'key': 'alaskan_husky', 'nameEn': 'Alaskan Husky', 'nameEs': 'Husky de Alaska', 'uuidKey': '2222'},
      ];
}

class MockAssessmentReportFileResponse extends _MockResponse {
  @override
  Uint8List get bodyBytes => Uint8List.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]);
}

class MockAssessmentsResponse extends _MockResponse {
  @override
  dynamic get body => [
        {
          'consultationId': '5ed00f22ad5a18477365ab69',
          'shouldStop': true,
          'invalidSymptoms': [],
          'urgent': true,
          'conditions': [
            {
              'key': 'acute_gastritis',
              'name': 'Acute Gastritis',
              'score': 0.03139,
              'usualness': 4,
              'urgent': false,
              'information':
                  '\'Acute gastritis\' is a very common disease in pets. It consists of inflammation of the stomach lining and can be caused by a variety of things. The most common cause is eating something harmful. For example:\n- Garbage (food waste)\n- Poisonous plants\n- Medications\n- Random objects from around the home\n- Toxic substances such as: cleaning products, rodenticides, detergent, etc. \n\nWhen your pet has acute gastritis, the major symptoms will likely include:\n- Vomiting\n- Diarrhea\n- Stomach pain\n- Stomach swelling\n- Loss of appetite or decreased appetite\n- Bloody stool\n\nA veterinarian will diagnose acute gastritis after a full physical exam and reviewing your pet'
                      's history, including feeding habits and possible access to harmful substances. In some cases the veterinarian will need to take radiographs and/or perform certain blood tests to determine the cause of the gastritis. \n\nJust as in humans the initial treatment consists of an initial fasting period, commonly between 12 and 48 hours. During this fasting period it will also be important to control the amount of water your pet is drinking. Small amounts of water will usually be recommended so as to avoid continued vomiting and further irritation of the digestive system. Your veterinarian will indicate how long the fast should be and what your pet should drink during this period. \n\nFollowing a fasting period, the veterinarian may recommend a particular type of diet as well as some medications. These could include antibiotics, anti-nausea medication, medications to protect the stomach lining, etc..'
            },
            {
              'key': 'gastritis_cronica',
              'name': 'Chronic Gastritis',
              'score': 0.01047,
              'usualness': 2,
              'urgent': false,
              'information':
                  'Gastritis is inflammation of the lining of the stomach and is a very common intestinal condition. It is considered chronic when it does not resolve over time and develops slowly. Get your pet to the veterinarian in a timely manner so they may find a solution to the problem as soon as possible.'
            }
          ],
          'nextQuestion': {
            'symptomKey': 'yellow_eyes',
            'question': 'Are the whites of Tyson' 's eyes looking yellow?',
            'answersType': 'YesNoUnknown',
            'duration': true,
            'frequency': false
          },
          'symptoms': [
            {
              'key': 'vomit',
              'name': 'Vomit',
              'presence': 'yes',
              'duration': 'medium',
              'frequency': 'low',
              'urgent': true,
              'information': true
            },
            {
              'key': 'vomiting_blood',
              'name': 'Vomit with blood',
              'presence': 'no',
              'duration': null,
              'frequency': null,
              'urgent': false,
              'information': false
            }
          ],
          'createdAt': '2020-07-10T00:00:00.000Z'
        },
      ];
}
