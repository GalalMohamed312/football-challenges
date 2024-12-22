import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot/core/utils/assets.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';




class PlayerCardView extends StatelessWidget {
  const PlayerCardView({super.key, required this.name,required this.index});
  final int index;
  final String name;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height*0.2,
      child: Card(
        color: ColorsManager.cardBackgroundGray,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "player ${index} is: ${name}",
                  style: TextStyles.font12GrayRegular,
                ),
              ),
             // const Spacer(),
              Image.asset(ImageAssets.player,fit: BoxFit.fill,width: MediaQuery.of(context).size.width*0.3,), // Use the desired icon


            ],
          ),
        ),
      ),
    );;
  }
}