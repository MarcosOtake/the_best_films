import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_best_films/app/ui/styles/app_colors.dart';

class AppTextStyle {
  static final title = GoogleFonts.lato(
      color: AppColors.colorsBlack, fontSize: 24, fontWeight: FontWeight.w900);

  static final appBarTitle = GoogleFonts.lato(
      color: AppColors.colorsBlack, fontSize: 20, fontWeight: FontWeight.w700);

  static final subTitle = GoogleFonts.lato(
      color: AppColors.colorsBlack, fontSize: 18, fontWeight: FontWeight.w700);

  static final normalText =
      GoogleFonts.lato(color: AppColors.colorsBlack, fontSize: 16);

  static final smallText = GoogleFonts.lato(
      color: AppColors.colorsBlack, fontSize: 14, fontWeight: FontWeight.w700);

  static final titleWhite = GoogleFonts.lato(
      color: AppColors.colorsWhite, fontSize: 20, fontWeight: FontWeight.w500);

  static final subTitleWhite = GoogleFonts.lato(
      color: AppColors.colorsWhite, fontSize: 16, fontWeight: FontWeight.w300);
}
