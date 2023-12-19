import 'package:get_it/get_it.dart';
import 'package:neobis_android_chapter8/core/services/dio_settings.dart';
import 'package:neobis_android_chapter8/features/add_user_data_screen/data/data_sources/add_user_data_data_source.dart';
import 'package:neobis_android_chapter8/features/add_user_data_screen/data/repository_impl/add_user_data_repository_impl.dart';
import 'package:neobis_android_chapter8/features/add_user_data_screen/domain/usecases/add_user_data_use_case.dart';
import 'package:neobis_android_chapter8/features/favourite_items/data/data_source/remote_data_source.dart';
import 'package:neobis_android_chapter8/features/favourite_items/data/repository_impl/items_repository_impl.dart';
import 'package:neobis_android_chapter8/features/favourite_items/domain/usecase/items_use_case.dart';
import 'package:neobis_android_chapter8/features/login/data/data_source/remote_data_source.dart';
import 'package:neobis_android_chapter8/features/login/data/repositories/login_repo_impl.dart';
import 'package:neobis_android_chapter8/features/login/domain/usecases/login_usecase.dart';
import 'package:neobis_android_chapter8/features/registration/data/data_source.dart/remote_data_source.dart';
import 'package:neobis_android_chapter8/features/registration/data/repository_impl/registration_repository_impl.dart';
import 'package:neobis_android_chapter8/features/registration/domain/usecases/registration_use_case.dart';

final getIt = GetIt.instance;

void setupDependecies() {
  logInDependencies();
  registrationDependencies();
  favouriteItemsDependencies();
  updateUserDataDependencies();
}

void updateUserDataDependencies() {
  getIt.registerSingleton<AddUserDataDataSourceImpl>(
    AddUserDataDataSourceImpl(
      dio: getIt<DioSettings>().dio,
    ),
  );
  getIt.registerSingleton<AddUserDataRepositoryImpl>(
    AddUserDataRepositoryImpl(
      dataDataSource: getIt<AddUserDataDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<AddUserDataUseCase>(
    AddUserDataUseCase(
      repository: getIt<AddUserDataRepositoryImpl>(),
    ),
  );
}

void favouriteItemsDependencies() {
  getIt.registerSingleton<ItemsDataSoruceImpl>(
    ItemsDataSoruceImpl(
      dio: getIt<DioSettings>().dio,
    ),
  );
  getIt.registerSingleton<ItemsRepositoryImpl>(
    ItemsRepositoryImpl(
      dataSource: getIt<ItemsDataSoruceImpl>(),
    ),
  );
  getIt.registerSingleton<ItemsUseCase>(
    ItemsUseCase(
      repository: getIt<ItemsRepositoryImpl>(),
    ),
  );
}

void registrationDependencies() {
   getIt.registerSingleton<RemoteDataSourceRegistrationImpl>(
    RemoteDataSourceRegistrationImpl(
      dio: getIt<DioSettings>().dio,
    ),
  );
  getIt.registerSingleton<RegistrationRepositoryImpl>(
    RegistrationRepositoryImpl(
      dataSourceRegistration: getIt<RemoteDataSourceRegistrationImpl>(),
    ),
  );
  getIt.registerSingleton<RegistrationUseCase>(
    RegistrationUseCase(
      repository: getIt<RegistrationRepositoryImpl>(),
    ),
  );
}

void logInDependencies() {
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
