import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tools_for_you/core/theme/app_color.dart';
import 'package:tools_for_you/core/utils/extensions/font_height_extension.dart';

class ResponsiveTheme {
  static ThemeData getTheme(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);

    if (breakpoint.isMobile) {
      return appMobileTheme;
    } else {
      return appWebTheme;
    }
  }
}

ThemeData get appMobileTheme {
  return ThemeData(
    scaffoldBackgroundColor: AppColor.kDarkBG,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.kLessDarkBG,
      iconTheme: IconThemeData(
        color: AppColor.kPrimary,
      ),
      titleTextStyle: TextStyle(
          color: AppColor.kPrimary, fontSize: 18, fontWeight: FontWeight.w700),
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
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        color: AppColor.kWhite,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 24.0.lineHeight,
      ),
      titleLarge: TextStyle(
        color: AppColor.kWhite,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 20.0.lineHeight,
      ),
      titleMedium: TextStyle(
        color: AppColor.kWhite,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: AppColor.kWhite,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        //height: 14.0.lineHeight,
      ),
      bodyLarge: TextStyle(
        color: AppColor.kWhite,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: AppColor.kWhite,
        letterSpacing: 0.5,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        //height: 14.0.lineHeight,
      ),
      bodySmall: TextStyle(
        color: AppColor.kWhite,
        fontSize: 9,
        fontWeight: FontWeight.w400,
        //height: 9.0.lineHeight,
      ),
    ),
  );
}

ThemeData get appWebTheme {
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
        fontSize: 48,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        color: AppColor.kWhite,
        fontSize: 40,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        color: AppColor.kWhite,
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: AppColor.kWhite,
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: AppColor.kWhite,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: AppColor.kWhite,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: AppColor.kWhite,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: AppColor.kWhite,
        letterSpacing: 0.5,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: AppColor.kWhite,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
