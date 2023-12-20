import 'package:neobis_android_chapter8/features/user_profile_screen.dart/data/data_source/remote_data_source.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/domain/entities/user_info_entity.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/domain/repo/user_info_repo.dart';

class UserInfoRepositoryImpl implements UserInfoRepo {
  final UserInfoRemoteDataSource dataSource;

  UserInfoRepositoryImpl({required this.dataSource});
  @override
  Future<UserInfoEntity> updateUserData(
      String name, String surname, String lastName, String birthDate) async {
    final responce =
        await dataSource.updateUserData(name, surname, lastName, birthDate);
    return UserInfoEntity(
        name: responce.name ?? '',
        surname: responce.surname ?? '',
        lastname: responce.lastname ?? '',
        birthdate: responce.birthDate ?? '');
  }
}
