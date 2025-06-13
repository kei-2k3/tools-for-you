import 'package:flutter/material.dart';
import 'package:tools_for_you/core/theme/app_color.dart';

ThemeData get appTheme {
  return ThemeData(
    scaffoldBackgroundColor: AppColor.kDarkBG,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.kLessDarkBG,
      iconTheme: IconThemeData(
        color: AppColor.kPrimary,
      ),
      titleTextStyle: TextStyle(
          color: AppColor.kPrimary, fontSize: 24, fontWeight: FontWeight.w700),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColor.kDarkBG,
    ),
    iconTheme: IconThemeData(
      color: AppColor.kPrimary,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColor.kWhite,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        color: AppColor.kWhite,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: TextStyle(
        color: AppColor.kWhite,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: AppColor.kWhite,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: AppColor.kWhite,
        fontSize: 14,
      ),
    ),
  );
}
