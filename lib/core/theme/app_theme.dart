import 'package:flutter/material.dart';
import 'package:tools_for_you/core/theme/app_color.dart';

ThemeData get appTheme {
  return ThemeData(
    scaffoldBackgroundColor: AppColor.kDarkBG,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColor.kWhite,
        fontSize: 32,
      ),
      displayMedium: TextStyle(
        color: AppColor.kWhite,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        color: AppColor.kWhite,
        fontSize: 14,
      ),
    ),
  );
}
