import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helper/colorConstant.dart';

ThemeData lightThemeData(BuildContext context){
  return ThemeData(
      appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: ColorConstant.themeColor, // Set your desired status bar color here
  ),),

    primaryColor: ColorConstant.themeColor,
    indicatorColor: Colors.white,
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    fontFamily: "Inter",useMaterial3: false,
    shadowColor: Theme.of(context).disabledColor,
    dividerColor: Color.fromARGB(255, 112, 112, 112),
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Color.fromARGB(255, 245, 245, 245),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
    cardColor: Colors.red,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    tabBarTheme: const TabBarTheme(
      //unselectedLabelStyle: AppTextStyle.normalGrey12,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      indicatorSize: TabBarIndicatorSize.tab,
      // labelStyle: AppTextStyle.normalBlack12,
    ), colorScheme: ColorScheme.light(
        primary: ColorConstant.themeColor, secondary:ColorConstant.themeColor).copyWith(background: Color.fromARGB(255, 255, 255, 255)),
  );
}