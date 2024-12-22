import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot/core/helpers/extensions.dart';
import 'package:foot/core/helpers/spacing.dart';
import 'package:foot/core/theming/styles.dart';
import 'package:foot/core/utils/assets.dart';
import 'package:foot/features/start_game/models/models.dart';

import '../../../core/theming/colors.dart';

class GamesCardView extends StatelessWidget {
  const GamesCardView({super.key, required this.gamesCardModel});
  final GamesCardModel gamesCardModel;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        context.pushNamed(gamesCardModel.screenRoute);
      },
      child: Card(
        color: ColorsManager.cardBackgroundGray,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Image.asset(gamesCardModel.iconPath,fit: BoxFit.fill,)), // Use the desired icon
              verticalSpace(12),
              Text(
                gamesCardModel.name,
                style: TextStyles.font12GrayRegular,
              ),
            ],
          ),
        ),
      ),
    );;
  }
}
