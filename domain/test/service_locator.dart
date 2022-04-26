import 'package:common_barkibu_dart/bloc/bloc.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/configuration.dart';
import 'package:common_barkibu_dart/datasources/datasources.dart';
import 'package:common_barkibu_dart/domain/domain.dart';
import 'package:common_barkibu_dart/messages/messages_model.dart';
import 'package:common_barkibu_dart/messages/messages_model_default.dart';
import 'package:common_barkibu_dart/services/locale_service.dart';
import 'package:common_barkibu_dart/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

import 'bloc/pet_health_chat/pet_health_chat_bloc_test.dart';
import 'mocks/mocks.dart';

final GetIt services = GetIt.instance;

class ServiceLocator {
  static void setup() {
    teardown();
    services.registerSingleton<Configuration>(MockConfiguration());
    services.registerSingleton<SecureStorage>(MockSecureStorage());
    services.registerSingleton<UpdateUserUseCase>(MockUpdateUserUseCase());
    services.registerSingleton<PetDefinitionBloc>(MockPetDefinitionBloc());
    services.registerSingleton<SearchSymptomUseCase>(MockSearchSymptomUseCase());
    services.registerSingleton<AnalyticsService>(MockAnalyticsService());
    services.registerFactory<SymptomDefinitionBloc>(
        () => SymptomDefinitionBloc(services<SearchSymptomUseCase>(), services<AnalyticsService>()));
    services.registerFactory<ContactVetBloc>(() => ContactVetBloc(
          services<Configuration>(),
          services<UpdateUserUseCase>(),
        ));

    services.registerSingleton<LocaleService>(LocaleServiceImpl('en'));
    services.registerSingleton<MessagesModel>(MessagesModelDefault(), instanceName: 'messages_default');
  }

  static void teardown() {
    if (services.isRegistered<Configuration>()) {
      services.unregister<Configuration>();
    }
    if (services.isRegistered<SecureStorage>()) {
      services.unregister<SecureStorage>();
    }
    if (services.isRegistered<NavigationService>()) {
      services.unregister<NavigationService>();
    }
    if (services.isRegistered<LocaleService>()) {
      services.unregister<LocaleService>();
    }
    if (services.isRegistered<MessagesModel>(instanceName: 'messages_default')) {
      services.unregister<MessagesModel>(instanceName: 'messages_default');
    }
  }
}
