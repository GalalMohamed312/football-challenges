import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot/core/helpers/spacing.dart';
import 'package:foot/core/routing/routes.dart';
import 'package:foot/features/start_game/widget/games_grid_view.dart';

class GamesListView extends StatelessWidget {
  const GamesListView({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    Navigator.popAndPushNamed(context, Routes.startGame);
                  }, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
                  verticalSpace(24),
                  const GamesGridView(),
                ],
              ),
            ),
          )),
    );
  }
}
