
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot/core/helpers/spacing.dart';
import 'package:foot/core/theming/styles.dart';
import 'package:foot/core/utils/assets.dart';
import 'package:foot/features/password_challenge/ui/widget/team_win._card.dart';

import '../../logic/password_challenge_cubit.dart';
import '../../logic/password_challenge_state.dart';
import '../models/models.dart';

class WhoIsTeamWin extends StatelessWidget {
  const WhoIsTeamWin({super.key});

  @override
  Widget build(BuildContext context) {
    List<TeamWinCardModel> teamWinCardList = [
      TeamWinCardModel(name: "team1", iconPath: ImageAssets.team1Logo),
      TeamWinCardModel(name: "team2", iconPath: ImageAssets.team2Logo),
      TeamWinCardModel(name: "withdraw", iconPath: ImageAssets.withdraw),
    ];

    // We use BlocBuilder to listen for state changes in PasswordChallengeCubit
    return BlocBuilder<PasswordChallengeCubit, PasswordChallengeState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<PasswordChallengeCubit>(context);

        // Get the current selected win index from the state if available
        int currentWinIndex = cubit.currentWinIndex; // This should be part of your cubit's state

        return Column(
          children: [
            Text(
              "Who is team win this round?",
              style: TextStyles.font12GrayRegular,
            ),
            verticalSpace(24),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      cubit.whoIsTeamWin(winIndex: 0);
                    },
                    child: TeamWinCard(
                      teamWinCardModel: teamWinCardList[0],
                      isSelected: currentSelectionWin(selectionNumber: 0, winIndex: currentWinIndex),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      cubit.whoIsTeamWin(winIndex: 1);
                    },
                    child: TeamWinCard(
                      teamWinCardModel: teamWinCardList[1],
                      isSelected: currentSelectionWin(selectionNumber: 1, winIndex: currentWinIndex),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      cubit.whoIsTeamWin(winIndex: 2);
                    },
                    child: TeamWinCard(
                      teamWinCardModel: teamWinCardList[2],
                      isSelected: currentSelectionWin(selectionNumber: 2, winIndex: currentWinIndex),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  bool currentSelectionWin({required int winIndex, required int selectionNumber}) {
    return winIndex == selectionNumber?true:false;
  }
}

