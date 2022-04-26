import 'package:angular_router/angular_router.dart';

class RoutePaths {
  static final home = RoutePath(path: '');
  static final virtualVetInfo = RoutePath(path: '/virual_vet_info');
  static final termsOfService = RoutePath(path: '/terms_of_service');
  static final emailSender = RoutePath(path: '/email_sender');
  static final signIn = RoutePath(path: 'sign_in');
  static final signUp = RoutePath(path: 'sign_up');
  static final recoverPassword = RoutePath(path: 'recover_password');
  static final signOut = RoutePath(path: 'sign_out');
  static final chat = RoutePath(path: 'chat');
  static final profileHome = RoutePath(path: 'profile');
  static final profileEdit = RoutePath(path: 'profile/edit');
  static final myPets = RoutePath(path: 'my_pets');
  static final petCreate = RoutePath(path: 'pets/create');
  static final petEdit = RoutePath(path: 'pets/:id/edit');
  static final askAVet = RoutePath(path: 'ask_a_vet');
  static final nutribot = RoutePath(path: 'nutribot');
  static final clinicsFinder = RoutePath(path: 'clinics');
  static final petProfile = RoutePath(path: 'pets/:id');
  static final petAssessments = RoutePath(path: 'pets/:id/assessments');
  static final petNutritionHistory = RoutePath(path: 'pets/:id/nutrition_history');
}
