import 'package:flutter/material.dart';
import '../styles/app_colors.dart';
import '../styles/app_text_styles.dart';

class ThemeConfig {
  ThemeConfig._();

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: const BorderSide(color: AppColors.colorsWhite),
  );

  static final theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.colorsWhite,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.colorsWhite,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyle.appBarTitle,
      iconTheme: const IconThemeData(
        color: AppColors.colorsBlack,
      ),
    ),
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.colorsWhite,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: AppColors.colorsWhite),
      ),
      labelStyle: AppTextStyle.title,
      errorStyle: const TextStyle(color: AppColors.colorsRedAcent),
    ),
  );
}
