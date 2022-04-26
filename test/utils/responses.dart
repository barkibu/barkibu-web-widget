import 'package:common_barkibu_dart/datasources/valueobjects/clinic/clinic.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'utils.dart';

export 'nutrition_responses.dart';

final Map<String, dynamic> assessmentResultResponseBody = {
  'consultationId': '5ebc134cecc6280253e6d804',
  'shouldStop': true,
  'invalidSymptoms': [],
  'urgent': true,
  'urgency': 'high',
  'nextQuestion': null,
  'symptoms': [
    {
      'article': 'Weight loss information',
      'key': 'weight_loss',
      'name': 'Weight loss',
      'presence': 'yes',
      'urgent': false,
      'urgency': 'low'
    }
  ],
  'conditions': [
    {'key': 'rinitis', 'name': 'Rhinitis', 'article': 'Rhinitis description', 'urgent': false, 'urgency': 'medium'},
    {'key': 'resfriado', 'name': 'Cold', 'article': 'Cold description', 'urgent': true, 'urgency': 'high'},
  ],
  'createdAt': '2020-06-10',
};

final Map<String, dynamic> assessmentResultResponseBody2 = {
  'consultationId': '5f156f5436d6e815a4211d03',
  'shouldStop': true,
  'invalidSymptoms': [],
  'urgent': true,
  'urgency': 'high',
  'nextQuestion': null,
  'symptoms': [
    {
      'article': 'Vomit information',
      'key': 'vomit',
      'name': 'Vomit',
      'presence': 'yes',
      'urgent': true,
      'urgency': 'high'
    },
    {
      'article': 'Poor appetite information',
      'key': 'poor_appetite',
      'name': 'Poor appetite',
      'presence': 'yes',
      'urgent': false,
      'urgency': 'low'
    }
  ],
  'conditions': [
    {
      'key': 'acute_gastritis',
      'name': 'Acute Gastritis',
      'article': 'Acute Gastritis description',
      'urgent': false,
      'urgency': 'low'
    }
  ],
  'createdAt': '2019-06-10',
};

final assessmentHitoryResponseBody = [assessmentResultResponseBody, assessmentResultResponseBody2];

final anamnesisNextQuetionResponseBody = <String, dynamic>{
  'consultationId': '5ebc134cecc6280253e6d804',
  'shouldStop': false,
  'invalidSymptoms': [],
  'urgent': false,
  'conditions': [],
  'symptoms': [],
  'nextQuestion': {
    'symptomKey': 'runny_nose',
    'symptomName': 'Runny nose',
    'hint': 'Runny nose description',
    'question': 'Does Snoopy have a runny nose?',
    'answersType': 'YesNoUnknown',
    'duration': false,
    'frequency': true
  }
};

final symptomSearchResponseBody = [
  {'key': 'sneezing', 'name': 'Sneezing', 'duration': true, 'frequency': true},
  {'key': 'wheezing', 'name': 'Wheezing', 'duration': false, 'frequency': false}
];

bool isClinicsRequest(Request request) => request.url.path == '/clinics';
final clinicsResponse = Future.value(Response(json.encode(clinicsResponseBody), 200));
var clinicResponse = ClinicResponse(1, 'irrelevant', 'irrelevant', 'irrelevant', 'irrelevant',
    ClinicBrandIconResponse('assets/images/icon_hospital.svg'), '1.2', [ClinicHoursResponse('day', 'time')]);
final clinicsResponseBody = [
  {
    'clinic': {
      'id': clinicResponse.id,
      'name': clinicResponse.name,
      'address': clinicResponse.address,
      'phoneNumber': clinicResponse.phoneNumber,
      'brandName': clinicResponse.brand,
      'distance': clinicResponse.distance,
      'brandIcon': clinicResponse.brandIcon,
      'hours': [ClinicHoursResponse('day', 'time').toJson()]
    },
    'distance': num.parse(clinicResponse.distance),
    'units': 'km'
  },
  {
    'clinic': {
      'id': clinicResponse.id,
      'name': clinicResponse.name,
      'address': clinicResponse.address,
      'phoneNumber': clinicResponse.phoneNumber,
      'brandName': clinicResponse.brand,
      'brandIcon': clinicResponse.brandIcon,
      'distance': clinicResponse.distance,
      'hours': [ClinicHoursResponse('day', 'time').toJson()]
    },
    'distance': num.parse(clinicResponse.distance),
    'units': 'km'
  }
];

bool isCurrentUserRequest(Request request) => request.url.path == '/auth';
final currentUserResponseBody = {
  'user': {'id': 1, 'email': 'john.doe@example.com', 'country': 'ES'}
};
final currentUserResponse = Future.value(Response(json.encode(currentUserResponseBody), 200));

bool isPetsListRequest(Request request) => request.url.path == '/pets' && request.method == 'GET';
final petsListResponseBody = [
  {
    'pet': {
      'id': 1,
      'name': 'Snoopy',
      'species': 'dog',
      'gender': 'male',
      'neutered': false,
      'birthdate': '2010-01-01',
      'healthPlanDetails': {}
    }
  },
  {
    'pet': {
      'id': 2,
      'name': 'Purry',
      'species': 'cat',
      'gender': 'female',
      'neutered': true,
      'birthdate': '2010-06-12',
      'healthPlanDetails': {}
    }
  }
];
final petsListResponse = Future.value(Response(json.encode(petsListResponseBody), 200));

bool isEmailSendRequest(Request request) => request.url.path == '/emails' && request.method == 'POST';
final emailSendResponse = Future.value(Response('', 204));

bool isActiveChatRequest(Request request) => request.url.path == '/chats' && request.method == 'GET';
final activeChatResponse = Future.value(Response('', 204)); // No active chat

final nutribotConsultationsResponse = Future.value(Response(json.encode(nutribotConsultationsResponseBody), 200));

bool isShortLivedTokenRequest(Request request) => request.url.path == '/tokens' && request.method == 'POST';
final shortLivedTokenResponseBody = {'token': 'short_lived_token'};
final shortLivedTokenResponse = Future.value(Response(json.encode(shortLivedTokenResponseBody), 200));

bool isSymptomSearchRequest(Request request) => request.url.pathSegments.last == 'symptoms';
final symptomSearchResponse = Future.value(Response(json.encode(symptomSearchResponseBody), 200));

final defaultResponse = Future.value(Response('', 500));
