import 'package:neobis_android_chapter8/features/login/domain/entities/token_entity.dart';

abstract class LogInRepo {
  Future<TokenEntity> logIn(String login, String password);
}
