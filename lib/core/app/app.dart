import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_android_chapter8/core/dependencies/dependency_injection.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/features/login/domain/usecases/login_usecase.dart';
import 'package:neobis_android_chapter8/features/login/presentation/bloc/log_in_bloc.dart';
import 'package:neobis_android_chapter8/features/login/presentation/login_screen.dart';
import 'package:neobis_android_chapter8/features/registration/domain/usecases/registration_use_case.dart';
import 'package:neobis_android_chapter8/features/registration/presentation/bloc/registration_bloc.dart';

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
      BlocProvider<LogInBloc>(
        create: (context) => LogInBloc(useCase: getIt<LogInUseCase>()),
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
