import 'package:neobis_android_chapter8/features/add_user_data_screen/data/data_sources/add_user_data_data_source.dart';
import 'package:neobis_android_chapter8/features/add_user_data_screen/domain/repo/add_user_data_repo.dart';

class AddUserDataRepositoryImpl implements AddUserDataRepo {
  final AddUserDataDataSource dataDataSource;

  AddUserDataRepositoryImpl({required this.dataDataSource});
  @override
  Future<void> updateUserData(
      String name, String surname, String lastname, String birthday) async {
    await dataDataSource.sendUserData(name, surname, lastname, birthday);
  }
}
