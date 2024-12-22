import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot/features/password_challenge/logic/password_challenge_cubit.dart';
import 'package:foot/features/password_challenge/ui/widget/score_card_view.dart';

import '../../../../core/utils/assets.dart';
import '../../logic/password_challenge_state.dart';
import '../models/models.dart';


class ScoreRow extends StatelessWidget {
  const ScoreRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordChallengeCubit, PasswordChallengeState>(
      builder: (context, state) {
        final cubit = context.read<PasswordChallengeCubit>();
        List<ScoreCardModel> scoreCardTeam = [
          ScoreCardModel(cubit.team1Score, name: "Team1", iconPath: ImageAssets.team1Logo),
          ScoreCardModel(cubit.team2Score, name: "Team2", iconPath: ImageAssets.team2Logo)
        ];

        debugPrint("${scoreCardTeam[1].score} ====== score=${scoreCardTeam[0].score}");

        return Row(
          children: [
            ScoreCardView(scoreCardModel: scoreCardTeam[0]),
            const Spacer(),
            ScoreCardView(scoreCardModel: scoreCardTeam[1]),
          ],
        );
      },
    );
  }
}
