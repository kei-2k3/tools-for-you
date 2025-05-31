import 'package:flutter/material.dart';
import 'package:tools_for_you/core/theme/app_color.dart';

ThemeData get appTheme {
  return ThemeData(
    scaffoldBackgroundColor: AppColor.kDarkBG,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.kDarkBG,
      selectedIconTheme: IconThemeData(
        color: AppColor.kPrimary,
      ),
      selectedLabelStyle: TextStyle(
        color: AppColor.kOpposite,
        fontSize: 14,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColor.kWhite,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColor.kWhite,
        fontSize: 14,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColor.kWhite,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        color: AppColor.kWhite,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: AppColor.kWhite,
        fontSize: 14,
      ),
    ),
  );
}
