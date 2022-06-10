import 'package:chopper/chopper.dart';
import 'package:common_barkibu_dart/bloc/autocomplete/autocomplete_bloc.dart';
import 'package:common_barkibu_dart/bloc/clinics_finder/clinics_finder_bloc.dart';
import 'package:common_barkibu_dart/bloc/email_contact/email_contact_bloc.dart';
import 'package:common_barkibu_dart/bloc/faq/faq.dart';
import 'package:common_barkibu_dart/datasources/api/breeds_api.dart';
import 'package:common_barkibu_dart/datasources/api/clinic_api.dart';
import 'package:common_barkibu_dart/datasources/api/email_api.dart';
import 'package:common_barkibu_dart/datasources/clinic/clinic_datasource.dart';
import 'package:common_barkibu_dart/datasources/email/email_datasource.dart';
import 'package:common_barkibu_dart/datasources/local/local_datasources.dart' as local_datasources;
import 'package:common_barkibu_dart/datasources/api/feature_flags_api.dart';
import 'package:common_barkibu_dart/datasources/api/presigned_url_api.dart';
import 'package:common_barkibu_dart/datasources/feature_flags/feature_flags_datasource.dart';
import 'package:common_barkibu_dart/datasources/pet/breeds_datasource.dart';
import 'package:common_barkibu_dart/datasources/presigned_url/presigned_url_datasource.dart';
import 'package:common_barkibu_dart/domain/clinic/get_clinics_use_case.dart';
import 'package:common_barkibu_dart/domain/email/send_email_use_case.dart';
import 'package:common_barkibu_dart/domain/features/get_features_use_case.dart';
import 'package:common_barkibu_dart/domain/pet/create_pet_prevention_events_use_case.dart';
import 'package:common_barkibu_dart/domain/pet/get_breeds_use_case.dart';
import 'package:common_barkibu_dart/domain/pet/get_pet_counters_use_case.dart';
import 'package:common_barkibu_dart/domain/pet/get_pet_features_use_case.dart';
import 'package:common_barkibu_dart/domain/pet/get_pet_interactions_use_case.dart';
import 'package:common_barkibu_dart/domain/user/set_user_country_use_case.dart';
import 'package:common_barkibu_dart/messages/messages_model_de.dart';
import 'package:common_barkibu_dart/repositories/clinic/clinic_respository.dart';
import 'package:common_barkibu_dart/repositories/email/email_repository.dart';
import 'package:common_barkibu_dart/repositories/pet/breeds_repository.dart';
import 'package:common_barkibu_dart/services/ip_tools_service.dart';
import 'package:common_barkibu_dart/services/upload_image_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'common_barkibu_dart.dart';
import 'configuration.dart';
import 'domain/aivet/triage_next_step_use_case.dart';
import 'domain/faq/get_faq_use_case.dart';

class ServiceLocator {
  static final GetIt container = GetIt.instance;

  static void setup({
    @required Configuration configuration,
    @required SecureStorage secureStorage,
    @required NavigationService navigationService,
    @required Future<MonitoringService> Function() monitoringServiceFactory,
    http.BaseClient httpClient,
    CacheStorage cacheStorage,
    TwilioChatService twilio,
    String locale = 'en',
    void Function(GetIt) config,
    MessagesModel messagesModelDefault,
    MessagesModel messagesModelEs,
    MessagesModel messagesModelDe,
    bool useLegacyAuthDatasource = true,
  }) {
    assert(configuration != null);
    assert(secureStorage != null);
    assert(navigationService != null);
    assert(monitoringServiceFactory != null);

    //http client
    httpClient ??= http.Client();
    container.registerSingleton<http.BaseClient>(httpClient);

    //Configuration
    container.registerSingleton<Configuration>(configuration);

    //I18N
    container.registerSingleton<MessagesModel>(messagesModelDe ?? MessagesModelDe(), instanceName: 'messages_de');

    container.registerSingleton<MessagesModel>(messagesModelEs ?? MessagesModelEs(), instanceName: 'messages_es');

    container.registerSingleton<MessagesModel>(messagesModelDefault ?? MessagesModelDefault(),
        instanceName: 'messages_default');

    container.registerSingleton<LocaleService>(LocaleServiceImpl(locale));

    container.registerSingleton<IpToolsService>(IpToolsServiceImpl());

    //External requirements
    container.registerSingleton<SecureStorage>(secureStorage);
    container.registerSingleton<CacheStorage>(cacheStorage ?? DummyCacheStorage());
    container.registerSingleton<NavigationService>(navigationService);
    container.registerSingletonAsync<MonitoringService>(monitoringServiceFactory);

    //Connectors
    container.registerFactory<ConciergeConnector>(() => ConciergeConnectorImpl(container<Configuration>()));

    //APIs
    container.registerSingleton<AssessmentApi>(AssessmentApiImpl.create(_createChopperClient(container)));
    container.registerSingleton<AuthApi>(AuthApiImpl.create(_createChopperClient(container)));
    container.registerSingleton<UserApi>(UserApiImpl.create(_createChopperClient(container)));
    container.registerSingleton<BarkibuApi>(BarkibuApiImpl.create(_createChopperClient(container)));
    container.registerSingleton<FeatureFlagApi>(FeatureFlagApiImpl.create(_createChopperClient(container)));
    container.registerSingleton<BreedsApi>(BreedsApiImpl.create(_createChopperClient(container)));
    container.registerSingleton<ClinicApi>(ClinicApiImpl.create(_createChopperClient(container)));
    container.registerSingleton<NutribotConsultationsApi>(
        NutribotConsultationsApiImpl.create(_createChopperClient(container)));
    container.registerSingleton<PetApi>(PetApiImpl.create(_createChopperClient(container)));
    container.registerSingleton<EmailApi>(EmailApiImpl.create(_createChopperClient(container)));
    container.registerSingleton<TokenApi>(TokenApiImpl.create(_createChopperClient(container)));
    container.registerSingleton<ChatApi>(ChatApiImpl.create(_createChopperClient(container)));
    container.registerSingleton<UserPropertiesApi>(UserPropertiesApiImpl.create(_createChopperClient(container)));
    container.registerSingleton<PresignedUrlApi>(PresignedUrlApiAmazonImpl.create(_createChopperClient(container)));
    container.registerSingleton<PhoneSignUpApi>(PhoneSignUpApiImpl.create(_createChopperClient(container)));
    container.registerSingleton<PhoneSignInApi>(PhoneSignInApiImpl.create(_createChopperClient(container)));
    container
        .registerSingleton<FoodRecommendationsApi>(FoodRecommendationsApiImpl.create(_createChopperClient(container)));
    container.registerSingleton<VideoChatApi>(VideoChatApiImpl.create(_createChopperClient(container)));

    //Datasources
    if (useLegacyAuthDatasource) {
      container.registerSingleton<AuthDatasource>(LegacyAuthDatasourceImpl(
        container<SecureStorage>(),
        container<AuthApi>(),
        container<UserApi>(),
      ));
    } else {
      container.registerSingleton<AuthDatasource>(AuthDatasourceImpl(
        container<SecureStorage>(),
        container<AuthApi>(),
        userPoolId: configuration.authServiceUserPoolId,
        appClientId: configuration.authServiceAppClientId,
      ));
    }

    container.registerSingleton<UserDatasource>(UserDatasourceImpl(container<UserApi>()));
    container.registerSingleton<BreedDatasource>(BreedsDatasourceImpl(container<BreedsApi>()));
    container.registerSingleton<ClinicDatasource>(ClinicDatasourceImpl(container<ClinicApi>()));
    container.registerSingleton<AiVetDatasource>(AiVetDatasourceImpl(container<BarkibuApi>()));
    container.registerSingleton<AssessmentDatasource>(AssessmentDatasourceImpl(container<AssessmentApi>()));
    container.registerSingleton<FeatureFlagsDatasource>(FeatureFlagsDatasourceImpl(container<FeatureFlagApi>()));
    container.registerSingleton<NutribotConsultationsDatasource>(
        NutribotConsultationsDatasourceImpl(container<NutribotConsultationsApi>()));
    container.registerSingleton<PetDatasource>(PetDatasourceImpl(container<PetApi>()));
    container.registerSingleton<TokenDatasource>(TokenDatasourceImpl(container<TokenApi>()));
    container.registerSingleton<EmailDatasource>(EmailDatasourceImpl(container<EmailApi>()));
    container.registerSingleton<ChatDatasource>(ChatDatasourceImpl(container<ChatApi>()));
    container.registerSingleton<UserPropertiesDatasource>(UserPropertiesDatasourceImpl(container<UserPropertiesApi>()));
    container.registerSingleton<PresignedUrlDatasource>(PresignedUrlAmazonDatasourceImpl(container<PresignedUrlApi>()));

    // Local DataSources
    container.registerSingleton<local_datasources.BreedDatasource>(
        local_datasources.BreedDatasourceImpl(container<CacheStorage>()));

    if (useLegacyAuthDatasource) {
      container.registerSingleton<PhoneSignInDatasource>(LegacyPhoneSignInDatasourceImpl(
        container<PhoneSignInApi>(),
      ));
      container.registerSingleton<PhoneSignUpDatasource>(LegacyPhoneSignUpDatasourceImpl(
        container<PhoneSignUpApi>(),
      ));
    } else {
      container.registerSingleton<PhoneSignInDatasource>(PhoneSignInDatasourceImpl(
        container<SecureStorage>(),
        userPoolId: configuration.authServiceUserPoolId,
        appClientId: configuration.authServiceAppClientId,
      ));
      container.registerSingleton<PhoneSignUpDatasource>(PhoneSignUpDatasourceImpl(
        container<SecureStorage>(),
        container<PhoneSignInDatasource>(),
        userPoolId: configuration.authServiceUserPoolId,
        appClientId: configuration.authServiceAppClientId,
      ));
    }

    container.registerSingleton<FoodRecommendationsDatasource>(
        FoodRecommendationsDatasourceImpl(container<FoodRecommendationsApi>()));
    container.registerSingleton<VideoChatDatasource>(VideoChatDatasourceImpl(container<VideoChatApi>()));

    //Repositories
    container.registerSingleton<AuthRepository>(AuthRepositoryImpl(container<AuthDatasource>()));
    container.registerSingleton<AssessmentRepository>(AssessmentRepositoryImpl(container<AssessmentDatasource>()));
    container.registerSingleton<ClinicRepository>(ClinicRepositoryImpl(container<ClinicDatasource>()));
    container.registerSingleton<UserRepository>(UserRepositoryImpl(container<UserDatasource>()));
    container.registerSingleton<PetRepository>(PetRepositoryImpl(container<PetDatasource>()));
    container.registerSingleton<BreedsRepository>(
        BreedsRepositoryImpl(container<BreedDatasource>(), container<local_datasources.BreedDatasource>()));
    container
        .registerSingleton<FeatureFlagsRepository>(FeatureFlagsRepositoryImpl(container<FeatureFlagsDatasource>()));
    container.registerSingleton<TokenRepository>(TokenRepositoryImpl(container<TokenDatasource>()));
    container.registerSingleton<EmailRepository>(EmailRepositoryImpl(container<EmailDatasource>()));
    container.registerSingleton<AiVetRepository>(
      AiVetRepositoryImpl(container<AiVetDatasource>(), container<PetDatasource>()),
    );
    container.registerSingleton<ChatRepository>(ChatRepositoryImpl(container<ChatDatasource>()));
    container.registerSingleton<UserPropertiesRepository>(
        UserPropertiesRepositoryImpl(container<UserPropertiesDatasource>()));
    container.registerSingleton<PhoneSignUpRepository>(PhoneSignUpRepositoryImpl(container<PhoneSignUpDatasource>()));
    container.registerSingleton<PhoneSignInRepository>(PhoneSignInRepositoryImpl(container<PhoneSignInDatasource>()));
    container.registerSingleton<VideoChatRepository>(VideoChatRepositoryImpl(container<VideoChatDatasource>()));
    container.registerSingleton<NutribotRepository>(NutribotRepositoryImpl(container<FoodRecommendationsDatasource>(),
        container<PetDatasource>(), container<NutribotConsultationsDatasource>()));

    //UseCases
    container.registerSingleton<SetUserUseCase>(SetUserUseCaseImpl(container<AuthRepository>()));
    container.registerSingleton<GetUserUseCase>(GetUserUseCaseImpl(container<AuthRepository>()));
    container.registerSingleton<GetBreedsUseCase>(GetBreedsUseCaseImpl(container<BreedsRepository>()));
    container.registerSingleton<SetUserCountryUseCase>(
        SetUserCountryUseCaseImpl(container<UserRepository>(), container<IpToolsService>()));

    container.registerSingleton<GetFeaturesUserUseCase>(
        GetFeaturesUserUseCaseImpl(container<FeatureFlagsRepository>(), container<Configuration>()));
    container.registerSingleton<GetPetCountersUseCase>(GetPetCountersUseCaseImpl(container<PetRepository>()));
    container.registerSingleton<GetPetInteractionsUseCase>(GetPetInteractionsUseCaseImpl(container<PetRepository>()));
    container.registerSingleton<GetPetFeaturesUseCase>(
        GetPetFeaturesUseCaseImpl(container<PetRepository>(), container<Configuration>()));
    container.registerSingleton<CreatePetPreventionEventsUseCase>(
        CreatePetPreventionEventsUseCaseImpl(container<PetRepository>()));
    container.registerSingleton<GetProfileUseCase>(
        GetProfileUseCaseImpl(container<AuthRepository>(), container<PetRepository>()));
    container.registerSingleton<NutribotHistoryUseCase>(NutribotHistoryUseCaseImpl(container<NutribotRepository>()));
    container.registerSingleton<UpdateUserUseCase>(UpdateUserUseCaseImpl(container<UserRepository>()));
    container.registerSingleton<ResetPasswordUseCase>(ResetPasswordUseCaseImpl(container<AuthRepository>()));
    container.registerSingleton<SendEmailUseCase>(SendEmailUseCaseImpl(container<EmailRepository>()));
    container.registerSingleton<SignOutUseCase>(SignOutUseCaseImpl(container<AuthRepository>()));
    container.registerSingleton<SignInUseCase>(SignInUseCaseImpl(container<AuthRepository>()));
    container.registerSingleton<SignInWithOTPUseCase>(SignInWithOTPUseCaseImpl(container<AuthRepository>()));
    container.registerSingleton<SignUpUseCase>(
      SignUpUseCaseImpl(container<UserRepository>(), container<AuthRepository>()),
    );
    container.registerSingleton<PetHealthNextStepUseCase>(PetHealthNextStepUseCaseImpl());
    container.registerSingleton<TriageNextStepUseCase>(
      TriageNextStepUseCaseImpl(container<PetRepository>(), container<AiVetRepository>()),
    );
    container.registerSingleton<NutribotNextStepUseCase>(
      NutribotNextStepUseCaseImpl(container<NutribotRepository>()),
    );
    container.registerSingleton<GetClinicsUseCase>(GetClinicsUseCaseImpl(container<ClinicRepository>()));
    container.registerSingleton<SearchSymptomUseCase>(SearchSymptomUseCaseImpl(container<PetRepository>()));
    container.registerSingleton<ConnectChatUseCase>(ConnectChatUseCaseImpl(twilio, container<ChatRepository>()));
    container.registerSingleton<CreatePetUseCase>(CreatePetUseCaseImpl(container<PetRepository>()));
    container.registerSingleton<GetPetsUseCase>(GetPetsUseCaseImpl(container<PetRepository>()));
    container.registerSingleton<GetPetAssessmentsUseCase>(GetPetAssessmentsUseCaseImpl(container<PetRepository>()));
    container.registerSingleton<UpdatePetUseCase>(UpdatePetUseCaseImpl(container<PetRepository>()));
    container.registerSingleton<DeletePetUseCase>(DeletePetUseCaseImpl(container<PetRepository>()));
    container.registerSingleton<PatientDefinitionNextStepUseCase>(
      PatientDefinitionNextStepUseCaseImpl(container<GetPetsUseCase>(), container<Configuration>()),
    );
    container.registerFactory<SetUserPropertiesUseCase>(
        () => SetUserPropertiesUseCaseImpl(container<UserPropertiesRepository>(), container<AnalyticsService>()));
    container.registerSingleton<GetPetAssessmentReportUseCase>(GetPetAssessmentReportUseCaseImpl(
        container<PetRepository>(), container<TokenRepository>(), container<AssessmentRepository>()));
    container.registerSingleton<PhoneSignUpUseCase>(PhoneSignUpUseCaseImpl(container<PhoneSignUpRepository>()));
    container.registerSingleton<PhoneSignInUseCase>(PhoneSignInUseCaseImpl(container<PhoneSignInRepository>()));
    container.registerSingleton<VideoChatUseCase>(VideoChatUseCaseImpl(container<VideoChatRepository>()));

    container.registerSingleton<UploadImageService>(UploadImageServiceImpl(container<PresignedUrlDatasource>()));
    container.registerSingleton<GetFaqUseCase>(GetFaqUseCaseImpl());

    //BLoCs
    container.registerFactory<AuthBloc>(() => AuthBloc(
          container<SetUserUseCase>(),
          container<GetUserUseCase>(),
          container<GetFeaturesUserUseCase>(),
          container<SignOutUseCase>(),
          container<SignInWithOTPUseCase>(),
          container<SetUserPropertiesUseCase>(),
          container<AnalyticsService>(),
          container<SetUserCountryUseCase>(),
        ));

    container.registerFactoryParam<ProfileBloc, AuthBloc, void>((_authBloc, _) => ProfileBloc(
          container<GetProfileUseCase>(),
          container<UpdateUserUseCase>(),
          container<AnalyticsService>(),
          _authBloc,
        ));

    container.registerFactoryParam<ResetPasswordBloc, AuthBloc, void>((AuthBloc _authBloc, _) => ResetPasswordBloc(
          container<ResetPasswordUseCase>(),
          container<SignInBloc>(param1: _authBloc),
          container<AnalyticsService>(),
        ));

    container.registerFactoryParam<SignInBloc, AuthBloc, void>((_authBloc, _) => SignInBloc(
          container<SignInUseCase>(),
          container<AnalyticsService>(),
          _authBloc,
        ));

    container.registerFactoryParam<SignUpBloc, AuthBloc, void>((_authBloc, _) => SignUpBloc(
          container<SignUpUseCase>(),
          container<AnalyticsService>(),
          _authBloc,
        ));

    container.registerFactory<NutribotHistoryBloc>(() => NutribotHistoryBloc(container<NutribotHistoryUseCase>()));

    container.registerFactoryParam<PhoneSignUpBloc, AuthBloc, void>((_authBloc, _) => PhoneSignUpBloc(
          container<PhoneSignUpUseCase>(),
          _authBloc,
        ));

    container.registerFactoryParam<PhoneSignInBloc, AuthBloc, void>((_authBloc, _) => PhoneSignInBloc(
          container<PhoneSignInUseCase>(),
          _authBloc,
        ));

    container.registerFactory<PetHealthChatBloc>(() => PetHealthChatBloc(
          container<PetHealthNextStepUseCase>(),
          container<AnalyticsService>(),
          container<GetPetAssessmentReportUseCase>(),
        ));

    container.registerFactory<NutribotChatBloc>(() => NutribotChatBloc(
          container<NutribotNextStepUseCase>(),
          container<AnalyticsService>(),
        ));

    container.registerFactoryParam<OnBoardingBloc, List<OnBoardingActioner>, void>((actioners, _) => OnBoardingBloc(
          container<SecureStorage>(),
          actioners,
        ));

    container.registerFactoryParam<ChatWithVetBloc, AuthBloc, void>((_authBloc, _) => ChatWithVetBloc(
          container<ConnectChatUseCase>(),
          container<AnalyticsService>(),
          _authBloc,
        ));

    container.registerFactory<PetProfileBloc>(() => PetProfileBloc(
          container<GetPetsUseCase>(),
          container<CreatePetUseCase>(),
          container<UpdatePetUseCase>(),
          container<DeletePetUseCase>(),
          container<AnalyticsService>(),
          container<SetUserPropertiesUseCase>(),
        ));

    container.registerFactory<PetDetailsBloc>(() => PetDetailsBloc(
          container<GetPetCountersUseCase>(),
        ));

    container.registerFactory<PetInteractionsBloc>(() => PetInteractionsBloc(
          container<GetPetInteractionsUseCase>(),
        ));

    container.registerFactory<ContactVetBloc>(() => ContactVetBloc(
          container<Configuration>(),
          container<UpdateUserUseCase>(),
        ));

    container.registerFactory<AssessmentReportBloc>(() => AssessmentReportBloc(
          container<GetPetAssessmentReportUseCase>(),
        ));

    container.registerFactory<AssessmentHistoryBloc>(() => AssessmentHistoryBloc(
          container<GetPetAssessmentsUseCase>(),
          container<GetPetFeaturesUseCase>(),
        ));

    container.registerFactory<EmailContactBloc>(() => EmailContactBloc(
          container<SendEmailUseCase>(),
        ));

    container.registerFactory<PetDefinitionBloc>(() => PetDefinitionBloc(
          container<PatientDefinitionNextStepUseCase>(),
          container<CreatePetUseCase>(),
          container<GetPetFeaturesUseCase>(),
          container<UpdatePetUseCase>(),
          container<AnalyticsService>(),
          container<SetUserPropertiesUseCase>(),
        ));

    container.registerFactory<SymptomDefinitionBloc>(() => SymptomDefinitionBloc(
          container<SearchSymptomUseCase>(),
          container<AnalyticsService>(),
        ));

    container.registerFactoryParam<AutoCompleteBloc, AutoCompletionUseCase, void>(
        (autoCompletionUseCase, _) => AutoCompleteBloc(autoCompletionUseCase));

    container.registerFactory<AutoCompleteBreedsBloc>(
      () => AutoCompleteBreedsBloc(GetBreedsUseCaseImpl(container<BreedsRepository>())),
    );

    container.registerFactory<TriageBloc>(
        () => TriageBloc(container<TriageNextStepUseCase>(), container<AnalyticsService>()));

    container.registerFactory<InsuranceBloc>(() => InsuranceBloc(container<AnalyticsService>()));

    container.registerFactoryParam<VideoStreamBloc, void Function(String), void>(
        (_streamSharingRequest, _) => VideoStreamBloc(
              container<VideoChatUseCase>(),
              _streamSharingRequest,
            ));

    container.registerFactory<ConciergeBloc>(() => ConciergeBloc(container<AuthDatasource>()));

    container.registerFactory<FaqBloc>(() => FaqBloc(container<GetFaqUseCase>(), container<AnalyticsService>()));

    container
        .registerFactory<PreventionEventBloc>(() => PreventionEventBloc(container<CreatePetPreventionEventsUseCase>()));

    container.registerFactory<ClinicsFinderBloc>(() => ClinicsFinderBloc(container<GetClinicsUseCase>()));
    //config
    if (config != null) config(container);
  }

  static ChopperClient _createChopperClient(GetIt container) {
    var configuration = container<Configuration>();
    var httpClient = container<http.BaseClient>();

    return ChopperClient(
        baseUrl: configuration.backendUrl,
        client: httpClient,
        converter: JsonConverter(),
        interceptors: [
          AuthInterceptor(),
          LocaleInterceptor(),
          HttpLoggingInterceptor(),
        ]);
  }
}
