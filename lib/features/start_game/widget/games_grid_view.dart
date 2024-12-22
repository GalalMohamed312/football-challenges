import 'package:flutter/cupertino.dart';
import 'package:foot/core/routing/routes.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/text.dart';
import '../models/models.dart';
import 'games_card_view.dart';

class GamesGridView extends StatelessWidget {
  const GamesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    List<GamesCardModel> gamesCardModel=[
      GamesCardModel(name:  TextApp.passwordChallenge,iconPath:  ImageAssets.password, screenRoute: Routes.passwordChallenge),
      GamesCardModel(name:  TextApp.rondo,iconPath:  ImageAssets.round,screenRoute: Routes.rondoChallenge),
    ];
    return  GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:  2, // Adjust the count for number of columns
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: gamesCardModel.length, // Number of items in the grid
      itemBuilder: (context, index) {
        return GamesCardView(gamesCardModel: gamesCardModel[index],);
      },
    );
  }
}
