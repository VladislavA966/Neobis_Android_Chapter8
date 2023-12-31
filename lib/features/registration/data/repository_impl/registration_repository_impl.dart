import 'package:neobis_android_chapter8/features/registration/data/data_source.dart/remote_data_source.dart';
import 'package:neobis_android_chapter8/features/registration/domain/repo/register_repo.dart';

class RegistrationRepositoryImpl implements RegistrationRepo {
  final RemoteDataSourceRegistration dataSourceRegistration;

  RegistrationRepositoryImpl({required this.dataSourceRegistration});
  @override
  Future<void> registration(
    String email,
    String password,
    String login,
  ) async {
    await dataSourceRegistration.registration(email, login, password);
  }
}
