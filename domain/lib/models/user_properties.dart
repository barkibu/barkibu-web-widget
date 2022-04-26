import 'package:meta/meta.dart';
import 'package:common_barkibu_dart/models/pet_properties.dart';

class UserProperties {
  final int userId;
  final String userKBKey;
  final int catsCount;
  final int dogsCount;
  final int consultationsCount;
  final String createdAt;
  final String phone;
  final String email;
  final List<PetProperties> pets;

  UserProperties({
    @required this.userId,
    @required this.userKBKey,
    @required this.catsCount,
    @required this.dogsCount,
    @required this.consultationsCount,
    @required this.createdAt,
    @required this.phone,
    @required this.email,
    @required this.pets,
  });
}
