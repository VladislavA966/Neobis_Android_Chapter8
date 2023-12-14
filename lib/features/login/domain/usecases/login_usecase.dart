import 'package:neobis_android_chapter8/features/login/domain/repo/login_repository.dart';

class LogInUseCase {
  final LogInRepo repository;

  LogInUseCase({required this.repository});
  Future<void> call(String logIn, String password) async {
    await repository.logIn(logIn, password);
  }
}
