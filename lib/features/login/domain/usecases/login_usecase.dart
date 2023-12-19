import 'package:neobis_android_chapter8/features/login/domain/entities/token_entity.dart';
import 'package:neobis_android_chapter8/features/login/domain/repo/login_repository.dart';

class LogInUseCase {
  final LogInRepo repository;

  LogInUseCase({required this.repository});
  Future<TokenEntity> call(String logIn, String password) async {
    return await repository.logIn(logIn, password);
  }
}
