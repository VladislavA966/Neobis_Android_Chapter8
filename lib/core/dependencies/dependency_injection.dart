import 'package:get_it/get_it.dart';
import 'package:neobis_android_chapter8/core/services/dio_settings.dart';
import 'package:neobis_android_chapter8/features/confirm_phone_number/data/data_sources/remote_data_source.dart';
import 'package:neobis_android_chapter8/features/confirm_phone_number/data/repository_impl/confirm_phone_repository_impl.dart';
import 'package:neobis_android_chapter8/features/confirm_phone_number/domain/use_cases/confirm_phone_usecase.dart';
import 'package:neobis_android_chapter8/features/favourite_items/data/data_source/remote_data_source.dart';
import 'package:neobis_android_chapter8/features/favourite_items/data/repository_impl/items_repository_impl.dart';
import 'package:neobis_android_chapter8/features/favourite_items/domain/usecase/items_use_case.dart';
import 'package:neobis_android_chapter8/core/data/local_data_source.dart/local_data_source.dart';
import 'package:neobis_android_chapter8/features/login/data/data_source/remote_data_source.dart';
import 'package:neobis_android_chapter8/features/login/data/repositories/login_repo_impl.dart';
import 'package:neobis_android_chapter8/features/login/domain/usecases/login_usecase.dart';
import 'package:neobis_android_chapter8/features/registration/data/data_source.dart/remote_data_source.dart';
import 'package:neobis_android_chapter8/features/registration/data/repository_impl/registration_repository_impl.dart';
import 'package:neobis_android_chapter8/features/registration/domain/usecases/registration_use_case.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/data/data_source/pick_image_remote_data_source.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/data/data_source/remote_data_source.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/data/repository_impl/pick_image_repository_impl.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/data/repository_impl/user_info_repository_impl.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/domain/repo/pick_image_repository.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/domain/usecase/pick_image_usecase.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/domain/usecase/user_info_usecase.dart';

final getIt = GetIt.instance;

void setupDependecies() {
  logInDependencies();
  registrationDependencies();
  favouriteItemsDependencies();
  updateUserDataDependencies();
  sendPhoneDependencies();
  uploadImageDependencies();
}

void uploadImageDependencies() {
  getIt.registerSingleton<ImageRemoteDataSourceImpl>(
    ImageRemoteDataSourceImpl(
      dio: getIt<DioSettings>().dio,
    ),
  );
  getIt.registerSingleton<ImageRepositoryImpl>(
    ImageRepositoryImpl(
      remoteDataSource: getIt<ImageRemoteDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<UploadImageUseCase>(
    UploadImageUseCase(
      getIt<ImageRepositoryImpl>(),
    ),
  );
}

void sendPhoneDependencies() {
  getIt.registerSingleton<ConfirmPhoneRemoteDataSourceImpl>(
    ConfirmPhoneRemoteDataSourceImpl(dio: getIt<DioSettings>().dio),
  );
  getIt.registerSingleton<LocalDataSource>(
    LocalDataSource(),
  );
  getIt.registerSingleton<ConfirmPhoneNumberImpl>(
    ConfirmPhoneNumberImpl(
      dataSource: getIt<ConfirmPhoneRemoteDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<ConfirmPhoneUseCase>(
    ConfirmPhoneUseCase(
      repo: getIt<ConfirmPhoneNumberImpl>(),
    ),
  );
}

void updateUserDataDependencies() {
  getIt.registerSingleton<UserInfoRemoteDataSourceImpl>(
    UserInfoRemoteDataSourceImpl(
      dio: getIt<DioSettings>().dio,
    ),
  );
  getIt.registerSingleton<UserInfoRepositoryImpl>(
    UserInfoRepositoryImpl(
      dataSource: getIt<UserInfoRemoteDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<UserInfoUseCase>(
    UserInfoUseCase(
      repository: getIt<UserInfoRepositoryImpl>(),
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
