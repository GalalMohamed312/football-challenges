import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot/core/routing/routes.dart';
import 'package:foot/features/password_challenge/ui/paswword_challenge_view.dart';
import 'package:foot/features/rondo_challenge/rondo_challenge_view.dart';

import '../../features/start_game/games_list_view.dart';
import '../../features/start_game/start.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.startGame:
        return MaterialPageRoute(
          builder: (_) =>  StartGame(),
        );
      case Routes.gamesList:
        return MaterialPageRoute(
          builder: (_) =>  GamesListView(),
        );
      case Routes.passwordChallenge:
        return MaterialPageRoute(
          builder: (_) =>  PasswordChallengeView(),
        );
      case Routes.rondoChallenge:
        return MaterialPageRoute(
          builder: (_) =>  RondoChallengeView(),
        );
      default:
        return null;
    }
  }
}
