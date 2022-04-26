import 'package:common_barkibu_dart/models/pet.dart';
import 'package:common_barkibu_dart/models/user.dart';

class Profile {
  final User user;
  final List<Pet> pets;

  const Profile(this.user, this.pets);
}
