
import 'package:flutter/material.dart';
import 'package:foot/core/theming/styles.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customScaffoldMessenger({required BuildContext context,required  message}){
  return  ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(content: Text(message.toString(),style: TextStyles.font12GrayMedium,),backgroundColor: Colors.red,),
  );
}
