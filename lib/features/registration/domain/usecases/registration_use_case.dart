import 'package:neobis_android_chapter8/features/registration/domain/repo/register_repo.dart';

class RegistrationUseCase {
  final RegistrationRepo repository;

  RegistrationUseCase({required this.repository});
  Future<void> call(String logIn, String email, String password) async {
    await repository.registration(email, logIn, password);
  }
}
