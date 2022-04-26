import 'package:angular_router/angular_router.dart';

import 'package:web_widget/src/route_paths.dart';
import 'package:web_widget/src/sign_in/sign_in_component.template.dart' as sign_in_template;
import 'package:web_widget/src/sign_up/sign_up_component.template.dart' as sign_up_template;
import 'package:web_widget/src/chat/chat_component.template.dart' as chat_template;
import 'package:web_widget/src/home/home_component.template.dart' as home_template;
import 'package:web_widget/src/home/virtual_vet_info_component.template.dart' as virtual_vet_info_template;
import 'package:web_widget/src/home/terms_of_service_component.template.dart' as terms_of_service_template;
import 'package:web_widget/src/email/email_sender_component.template.dart' as email_sender_template;
import 'package:web_widget/src/sign_out/sign_out_component.template.dart' as sign_out_template;
import 'package:web_widget/src/profile/profile_home_component.template.dart' as profile_home_template;
import 'package:web_widget/src/profile/profile_edit_component.template.dart' as profile_edit_template;
import 'package:web_widget/src/profile/pets/my_pets_component.template.dart' as my_pets_template;
import 'package:web_widget/src/profile/pets/pet_edit_component.template.dart' as pet_edit_template;
import 'package:web_widget/src/profile/pets/pet_profile_component.template.dart' as pet_profile_template;
import 'package:web_widget/src/profile/pets/pet_create_component.template.dart' as pet_create_template;
import 'package:web_widget/src/profile/pets/pet_assessment_history_component.template.dart' as pet_assessments_template;
import 'package:web_widget/src/profile/pets/pet_nutrition_history_component.template.dart'
    as pet_nutrition_history_template;
import 'package:web_widget/src/password_recovery/password_recovery_component.template.dart'
    as password_recovery_template;
import 'package:web_widget/src/ask_a_vet/ask_a_vet_component.template.dart' as ask_a_vet_template;
import 'package:web_widget/src/nutribot/nutribot_component.template.dart' as nutribot_template;
import 'package:web_widget/src/clinics/clinics_finder_component.template.dart' as clinics_finder_template;

export 'package:web_widget/src/route_paths.dart';

class Routes {
  static final home =
      RouteDefinition(routePath: RoutePaths.home, component: home_template.HomeComponentNgFactory, useAsDefault: true);

  static final virtualVetInfo = RouteDefinition(
      routePath: RoutePaths.virtualVetInfo, component: virtual_vet_info_template.VirtualVetInfoComponentNgFactory);

  static final termsOfService = RouteDefinition(
      routePath: RoutePaths.termsOfService, component: terms_of_service_template.TermsOfServiceComponentNgFactory);

  static final emailSender = RouteDefinition(
      routePath: RoutePaths.emailSender, component: email_sender_template.EmailSenderComponentNgFactory);

  static final signIn = RouteDefinition(
    routePath: RoutePaths.signIn,
    component: sign_in_template.SignInComponentNgFactory,
  );
  static final signUp = RouteDefinition(
    routePath: RoutePaths.signUp,
    component: sign_up_template.SignUpComponentNgFactory,
  );
  static final recoverPassword = RouteDefinition(
    routePath: RoutePaths.recoverPassword,
    component: password_recovery_template.PasswordRecoveryComponentNgFactory,
  );
  static final chat = RouteDefinition(
    routePath: RoutePaths.chat,
    component: chat_template.ChatComponentNgFactory,
  );
  static final askAVet = RouteDefinition(
    routePath: RoutePaths.askAVet,
    component: ask_a_vet_template.AskAVetComponentNgFactory,
  );
  static final signOut = RouteDefinition(
    routePath: RoutePaths.signOut,
    component: sign_out_template.SignOutComponentNgFactory,
  );
  static final profileHome = RouteDefinition(
    routePath: RoutePaths.profileHome,
    component: profile_home_template.ProfileHomeComponentNgFactory,
  );
  static final profileEdit = RouteDefinition(
    routePath: RoutePaths.profileEdit,
    component: profile_edit_template.ProfileEditComponentNgFactory,
  );
  static final myPets = RouteDefinition(
    routePath: RoutePaths.myPets,
    component: my_pets_template.MyPetsComponentNgFactory,
  );
  static final petEdit = RouteDefinition(
    routePath: RoutePaths.petEdit,
    component: pet_edit_template.PetEditComponentNgFactory,
  );
  static final petProfile = RouteDefinition(
    routePath: RoutePaths.petProfile,
    component: pet_profile_template.PetProfileComponentNgFactory,
  );
  static final petCreate = RouteDefinition(
    routePath: RoutePaths.petCreate,
    component: pet_create_template.PetCreateComponentNgFactory,
  );
  static final nutribot = RouteDefinition(
    routePath: RoutePaths.nutribot,
    component: nutribot_template.NutribotComponentNgFactory,
  );

  static final petAssessments = RouteDefinition(
    routePath: RoutePaths.petAssessments,
    component: pet_assessments_template.PetAssessmentHistoryComponentNgFactory,
  );
  static final petNutritionHistory = RouteDefinition(
    routePath: RoutePaths.petNutritionHistory,
    component: pet_nutrition_history_template.PetNutritionHistoryComponentNgFactory,
  );

  static final clinicsFinder = RouteDefinition(
    routePath: RoutePaths.clinicsFinder,
    component: clinics_finder_template.ClinicsFinderComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    home,
    virtualVetInfo,
    termsOfService,
    emailSender,
    signIn,
    signUp,
    signOut,
    recoverPassword,
    chat,
    askAVet,
    profileHome,
    profileEdit,
    myPets,
    petCreate,
    petEdit,
    petProfile,
    petAssessments,
    petNutritionHistory,
    nutribot,
    clinicsFinder,
  ];
}
