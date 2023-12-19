import 'package:neobis_android_chapter8/features/add_user_data_screen/domain/repo/add_user_data_repo.dart';

class AddUserDataUseCase {
  final AddUserDataRepo repository;

  AddUserDataUseCase({required this.repository});
  Future<void> call(
      String name, String surname, String lastname, String birthday) async {
    return await repository.updateUserData(name, surname, lastname, birthday);
  }
}
