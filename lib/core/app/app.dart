import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_android_chapter8/core/common_widgets/bottom_navigation_bar.dart';
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
      providers: [
        BlocProvider(
          create: (context) => LogInBloc(
            useCase: getIt<LogInUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => RegistrationBloc(
            useCase: getIt<RegistrationUseCase>(),
          ),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
         
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        ),
        home: const BottomBarNavigation(),
      ),
    );
  }
}
