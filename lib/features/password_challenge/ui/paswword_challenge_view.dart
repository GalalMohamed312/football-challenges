import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot/core/helpers/extensions.dart';
import 'package:foot/features/password_challenge/logic/password_challenge_state.dart';
import 'package:foot/features/password_challenge/ui/widget/player_card_view.dart';
import 'package:foot/features/password_challenge/ui/widget/score_row.dart';
import 'package:foot/features/password_challenge/ui/widget/who_is_team_win.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import '../logic/password_challenge_cubit.dart';
import 'all_levels_completed_view.dart';
import 'congratulation_view.dart';


class PasswordChallengeView extends StatelessWidget {
  const PasswordChallengeView({super.key});

  @override
  Widget build(BuildContext context) {
    // int team1Score = 0;
    // int team2Score = 0;

      return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: BlocBuilder<PasswordChallengeCubit, PasswordChallengeState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<PasswordChallengeCubit>(context);
            return state.maybeWhen(
          initial: () => const Center(child: Text('Welcome!')),
          loading: () => const Center(child: CircularProgressIndicator()),
          goToNextLevelState: () => CongratulationsView(onNextLevel: () {
            cubit.updateLoadedState();// Go back or navigate to the next level screen
          },),
          increaseCurrentPlayerIdState: () => AllLevelsCompletedView(onExit: () {
            context.pop();
          },),
          error: (message) => Center(child: Text('Error: $message',style:TextStyles.font12BlueRegular,)), orElse: () {
           return Padding(
             padding: EdgeInsets.all(20.sp),
             child: SingleChildScrollView(
               physics: const BouncingScrollPhysics(),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   IconButton(onPressed: (){
                     context.pop();
                   }, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
                   verticalSpace(24),

                state.maybeWhen(
               loaded: (items) {
                 return Column(
                   children: [
                     const ScoreRow(),
                     verticalSpace(24),
                     PlayerCardView(
                       name: items[cubit.currentLevel].myArrayColumn[cubit.currentPlayerIndex],
                       index: cubit.currentPlayerIndex,
                     ),
                   ],
                 );
               },
           orElse: () => const SizedBox(), // Handle other states
           ),
           // PlayerCardView(name: state.items[cubit.currentPlayerIndex].myArrayColumn[1], index: 1,),
                   verticalSpace(24),
                   const WhoIsTeamWin(),


                 ],
               ),
             ),
           );
         },
         );
      }
            )),
      );
  }
}

// ListView.builder(
// itemCount: items.length,
// itemBuilder: (context, index) {
// final item = items[index];
// return ListTile(
// title: Text('ID: ${item.id}'),
// subtitle: Text('Array: ${item.myArrayColumn.join(', ')}'),
// );
// },
// ),