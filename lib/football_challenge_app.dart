import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/constants.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theming/colors.dart';
import 'features/password_challenge/logic/password_challenge_cubit.dart';
import 'features/start_game/start.dart';
import 'core/di/dependency_injection.dart'as di;

class FootBallChallengeApp extends StatelessWidget {
  final AppRouter appRouter;
  const FootBallChallengeApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => PasswordChallengeCubit(di.getIt(),di.getIt())..loadDataLocallyOrRemotely(),
            ),
          ],
          child: MaterialApp(
            title: 'Football Challenge',
            theme: ThemeData(
              primaryColor: ColorsManager.mainBlue,
              scaffoldBackgroundColor: Colors.white,
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: isLoggedInUser ? Routes.startGame : Routes.startGame,
            onGenerateRoute: appRouter.generateRoute,
          ),
        ));
  }
}
