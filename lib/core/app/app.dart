import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_android_chapter8/core/dependencies/dependency_injection.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/features/confirm_phone_number/domain/use_cases/confirm_phone_usecase.dart';
import 'package:neobis_android_chapter8/features/confirm_phone_number/presentation/bloc/confirm_phone_bloc.dart';
import 'package:neobis_android_chapter8/core/data/local_data_source.dart/local_data_source.dart';
import 'package:neobis_android_chapter8/features/favourite_items/domain/usecase/items_use_case.dart';
import 'package:neobis_android_chapter8/features/favourite_items/presentation/bloc/items_bloc.dart';
import 'package:neobis_android_chapter8/features/login/domain/usecases/login_usecase.dart';
import 'package:neobis_android_chapter8/features/login/presentation/bloc/log_in_bloc.dart';
import 'package:neobis_android_chapter8/features/login/presentation/login_screen.dart';
import 'package:neobis_android_chapter8/features/registration/domain/usecases/registration_use_case.dart';
import 'package:neobis_android_chapter8/features/registration/presentation/bloc/registration_bloc.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/domain/usecase/pick_image_usecase.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/domain/usecase/user_info_usecase.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/presentation/bloc/user_info_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _buildBlocProviders(),
      child: MaterialApp(
        theme: _buildAppTheme(),
        home: const LoginScreen(),
      ),
    );
  }

  List<BlocProvider> _buildBlocProviders() {
    return [
      BlocProvider<ItemsBloc>(
        create: (context) => ItemsBloc(
          getIt<ItemsUseCase>(),
        ),
      ),
      BlocProvider<UserInfoBloc>(
        create: (context) => UserInfoBloc(
          getIt<UserInfoUseCase>(),
          getIt<UploadImageUseCase>(),
        ),
      ),
      BlocProvider<ConfirmPhoneBloc>(
        create: (context) => ConfirmPhoneBloc(
          getIt<ConfirmPhoneUseCase>(),
          getIt<LocalDataSource>(),
        ),
      ),
      BlocProvider<LogInBloc>(
        create: (context) => LogInBloc(
          useCase: getIt<LogInUseCase>(),
          localDataSource: getIt<LocalDataSource>(),
        ),
      ),
      BlocProvider<RegistrationBloc>(
        create: (context) =>
            RegistrationBloc(useCase: getIt<RegistrationUseCase>()),
      ),
    ];
  }

  ThemeData _buildAppTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    );
  }
}
