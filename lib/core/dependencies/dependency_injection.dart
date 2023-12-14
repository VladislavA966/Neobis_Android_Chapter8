import 'package:get_it/get_it.dart';
import 'package:neobis_android_chapter8/core/services/dio_settings.dart';
import 'package:neobis_android_chapter8/features/login/data/data_source/remote_data_source.dart';
import 'package:neobis_android_chapter8/features/login/data/repositories/login_repo_impl.dart';
import 'package:neobis_android_chapter8/features/login/domain/usecases/login_usecase.dart';

final getIt = GetIt.instance;

void setupDependecies() {
  getIt.registerSingleton<DioSettings>(DioSettings());
  getIt.registerSingleton<RemoteDataSourceImpl>(
    RemoteDataSourceImpl(dio: getIt<DioSettings>().dio),
  );
  getIt.registerSingleton<LoginRepositoryImpl>(
    LoginRepositoryImpl(
      dataSource: getIt<RemoteDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<LogInUseCase>(
    LogInUseCase(
      repository: getIt<LoginRepositoryImpl>(),
    ),
  );
}
