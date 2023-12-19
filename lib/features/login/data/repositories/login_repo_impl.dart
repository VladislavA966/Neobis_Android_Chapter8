import 'package:neobis_android_chapter8/features/login/data/data_source/remote_data_source.dart';
import 'package:neobis_android_chapter8/features/login/domain/entities/token_entity.dart';
import 'package:neobis_android_chapter8/features/login/domain/repo/login_repository.dart';

class LoginRepositoryImpl implements LogInRepo {
  final RemoteDataSource dataSource;

  LoginRepositoryImpl({required this.dataSource});
  @override
  Future<TokenEntity> logIn(String login, String password) async {
    final responce = await dataSource.logIn(login, password);
    return TokenEntity(
        token: responce.token ?? '',
        refreshToken: responce.refreshToken ?? '',
        authorities: responce.authorities ?? '',
        username: responce.username ?? '');
  }
}
