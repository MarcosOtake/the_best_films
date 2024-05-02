import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_best_films/app/ui/styles/app_colors.dart';
import 'package:the_best_films/app/ui/styles/app_text_styles.dart';

mixin Messages on GetxController {
  void showError(String title, String message) {
    Get.snackbar(
      title,
      message,
      titleText: Text(
        title,
        style: AppTextStyle.titleWhite,
        textAlign: TextAlign.center,
      ),
      messageText: Text(
        message,
        style: AppTextStyle.subTitleWhite,
        textAlign: TextAlign.center,
      ),
      backgroundColor: AppColors.colorsRedAcent,
    );
  }

  void showInfo(String title, String message) {
    Get.snackbar(
      title,
      message,
      titleText: Text(
        title,
        style: AppTextStyle.title,
        textAlign: TextAlign.center,
      ),
      messageText: Text(
        message,
        style: const TextStyle(color: AppColors.colorsWhite),
        textAlign: TextAlign.center,
      ),
      backgroundColor: AppColors.colorsBlueAccent,
    );
  }

  void showSuccess(String title, String message) {
    Get.snackbar(
      title,
      message,
      titleText: Text(
        title,
        style: const TextStyle(
          color: AppColors.colorsWhite,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
      messageText: Text(
        message,
        style: const TextStyle(color: AppColors.colorsWhite),
        textAlign: TextAlign.center,
      ),
      backgroundColor: AppColors.colorsGreenAccent,
    );
  }
}
