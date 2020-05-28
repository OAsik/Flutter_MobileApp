import "package:flutter/material.dart";

final ThemeData appThemeDataDark = ThemeData(
  brightness: Brightness.light,
  primarySwatch: MaterialColor(AppColors.blackish[500].value, AppColors.blackish),
  primaryColor: AppColors.blackish[500],
  primaryColorLight: AppColors.blackish[400],
  primaryColorBrightness: Brightness.light,
  accentColor: AppColors.orangish[400],
  accentColorBrightness: Brightness.light,
  iconTheme: IconThemeData(color: AppColors.blackish[100]),
  primaryTextTheme: TextTheme(body1: TextStyle(), body2: TextStyle(), title: TextStyle()).apply(bodyColor: AppColors.blackish[100], displayColor: AppColors.blackish[100]),
  buttonColor: AppColors.blackish[50]
);

final ThemeData appThemeDataLight = ThemeData(
  brightness: Brightness.light,
  primarySwatch: MaterialColor(AppColors.whitish[100].value, AppColors.whitish),
  primaryColor: AppColors.whitish[100],
  primaryColorLight: AppColors.whitish[700],
  primaryColorBrightness: Brightness.light,
  accentColor: AppColors.bluish[700],
  accentColorBrightness: Brightness.light,
  iconTheme: IconThemeData(color: AppColors.whitish[100]),
  primaryTextTheme: TextTheme(body1: TextStyle(), body2: TextStyle(), title: TextStyle()).apply(bodyColor: AppColors.whitish[100], displayColor: AppColors.whitish[100]),
  buttonColor: AppColors.blackish[900]
);

class AppColors {
  AppColors._();

  static const Map<int, Color> blackish = const <int, Color> {
    50: Color(0xFFE3E3E3),
    100: Color(0xFFB9B9B9),
    200: Color(0xFF8B8B8B),
    300: Color(0xFF5C5C5C),
    400: Color(0xFF393939),
    500: Color(0xFF161616),
    600: Color(0xFF131313),
    700: Color(0xFF101010),
    800: Color(0xFF0C0C0C),
    900: Color(0xFF060606)
  };

  static const Map<int, Color> orangish = const <int, Color> {
    100: Color(0xFF422001),
    200: Color(0xFF3C1C01),
    400: Color(0xFF331801),
    700: Color(0xFF2B1301)
  };

  static const Map<int, Color> whitish = const <int, Color> {
    50: Color(0xFFF6F6F9),
    100: Color(0xFFE9E9F0),
    200: Color(0xFFDADAE6),
    300: Color(0xFFCBCBDB),
    400: Color(0xFFC0C0D4),
    500: Color(0xFFB5B5CC),
    600: Color(0xFFAEAEC7),
    700: Color(0xFFA5A5C0),
    800: Color(0xFF9D9DB9),
    900: Color(0xFF8D8DAD),
  };

  static const Map<int, Color> bluish = const <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(0xFFC9EDFF),
    400: Color(0xFFA2BEFF),
    700: Color(0xFF8686FF),
  };
}