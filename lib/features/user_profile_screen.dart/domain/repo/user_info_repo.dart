import 'package:neobis_android_chapter8/features/user_profile_screen.dart/domain/entities/user_info_entity.dart';

abstract class UserInfoRepo {
  Future<UserInfoEntity> updateUserData(
      String name, String surname, String lastName, String birthDate);
}
