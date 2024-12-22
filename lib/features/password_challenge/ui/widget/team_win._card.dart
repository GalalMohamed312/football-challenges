import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../models/models.dart';



class TeamWinCard extends StatelessWidget {
  const TeamWinCard({super.key, required this.teamWinCardModel,required this.isSelected});
  final TeamWinCardModel teamWinCardModel;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width*0.4,
      height: MediaQuery.of(context).size.height*0.2,
      child: Card(
        color: isSelected?ColorsManager.mainBlue:ColorsManager.cardBackgroundGray,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Image.asset(teamWinCardModel.iconPath,fit: BoxFit.fill,)), // Use the desired icon
              verticalSpace(12),
              Text(
                teamWinCardModel.name,
                style: TextStyles.font12GrayRegular,
              ),
            ],
          ),
        ),
      ),
    );;
  }
}