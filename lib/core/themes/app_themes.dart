import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/core/bloc/theme_bloc/theme_bloc.dart';
import 'package:salon_app/core/themes/colors.dart';
import 'package:salon_app/core/constants/font_const.dart';

enum AppTheme {
  lightTheme,
  darkTheme,
  systemTheme,
}

abstract class AppThemes {
  static final themeData = {
    AppTheme.lightTheme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        useMaterial3: true,
        primaryColor: AppColors.primary,
        brightness: Brightness.light,
        fontFamily: FontConstants.manrope,
        cardTheme: const CardTheme(
            color: AppColors.white, surfaceTintColor: Colors.white),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: AppColors.grey100),
          titleSmall: TextStyle(color: AppColors.grey70),
        ),
        dialogTheme: const DialogTheme(surfaceTintColor: Colors.white),
        bottomSheetTheme: const BottomSheetThemeData(surfaceTintColor: Colors.white)),
    AppTheme.darkTheme: ThemeData(
        scaffoldBackgroundColor: AppColors.darkBg,
        useMaterial3: true,
        primaryColor: AppColors.primary,
        brightness: Brightness.dark,
        fontFamily: FontConstants.manrope,
        cardTheme: const CardTheme(
            color: AppColors.grey100, surfaceTintColor: Colors.white),
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: AppColors.light80),
          titleSmall: TextStyle(color: AppColors.light60),
        ),
        dialogTheme: const DialogTheme(
            surfaceTintColor: Colors.black, backgroundColor: Colors.black))
  };

  static ThemeData getThemeData(AppTheme appTheme) {
    return themeData[appTheme]!;
  }
}

bool checkIsDarkTheme(BuildContext context) {
  final themeState = context.read<ThemeBloc>().state;
  final isDarkTheme = themeState.themeData.brightness == Brightness.dark;
  return isDarkTheme;
}

/// Checks whether the provided theme state represents a dark theme.
bool isDarkTheme(BuildContext context) {
  final themeState = BlocProvider.of<ThemeBloc>(context).state;
  return themeState.themeData.brightness == Brightness.dark;
}
