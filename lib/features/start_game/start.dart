import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot/core/helpers/spacing.dart';
import 'package:foot/core/routing/routes.dart';

import '../../core/theming/colors.dart';
import '../../core/theming/styles.dart';
import '../../core/utils/assets.dart';
import '../../core/widgets/app_text_button.dart';

class StartGame extends StatelessWidget {
  const StartGame({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(),
          backgroundColor: Colors.black,
          body: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height:16.h),
                Expanded(
                    child: Image.asset(
                      ImageAssets.logo,
                      fit: BoxFit.fill,
                      color: Colors.white,
                    )),
                // const Spacer(),
                SizedBox(height: 24.h),
                Center(
                  child:
                  // CustomButton(
                  //     onPress: () {
                  //       Navigator.pushNamed(context, Routes.startGameRoute);
                  //     },
                  //     text: "بدء اللعبة"),
                  AppTextButton(buttonText: 'start Game', textStyle: TextStyles.font20BlueBold, onPressed: () {
                    Navigator.pushNamed(context, Routes.gamesList);
                  },)
                ),
                verticalSpace(40),
              ],
            ),
          )),
    );
  }
}


