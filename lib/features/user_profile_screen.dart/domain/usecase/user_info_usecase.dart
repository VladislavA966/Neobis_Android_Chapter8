import 'package:neobis_android_chapter8/features/user_profile_screen.dart/domain/entities/user_info_entity.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/domain/repo/user_info_repo.dart';

class UserInfoUseCase {
  final UserInfoRepo repository;

  UserInfoUseCase({required this.repository});
  Future<UserInfoEntity> call(
      String name, String surname, String lastName, String birthDate) async {
    await repository.updateUserData(name, surname, lastName, birthDate);
    return UserInfoEntity(
        name: name, surname: surname, lastname: lastName, birthdate: birthDate);
  }
}
