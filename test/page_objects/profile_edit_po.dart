import 'package:pageloader/html.dart';
import 'profile_form_mixin.dart';

part 'profile_edit_po.g.dart';

@PageObject()
@CheckTag('profile-edit')
abstract class ProfileEditPO extends Object with ProfileFormMixin {
  ProfileEditPO();
  factory ProfileEditPO.create(PageLoaderElement context) = $ProfileEditPO.create;
  factory ProfileEditPO.lookup(PageLoaderSource context) = $ProfileEditPO.lookup;
}
