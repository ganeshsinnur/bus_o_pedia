import 'package:bus_o_pedia/themes/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightMode =ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(

    surface: AppColors.lightBackground,
    primary:AppColors.lightPrimary,
      secondary: AppColors.lightSecondary
  )
);

ThemeData darkMode =ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        surface: AppColors.darkBackground,
        primary:AppColors.darkPrimary,
        secondary: AppColors.darkSecondary
    )
);