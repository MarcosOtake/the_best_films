import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:the_best_films/app/modules/splash/splash_controller.dart';
import 'package:the_best_films/app/ui/helpers/size_extensions.dart';
import '../../ui/styles/app_colors.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});
  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: context.screenWidth,
              height: context.screenHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/splash-films.png'),
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6),
                    BlendMode.darken,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Image.asset(
                width: context.screenWidth,
                height: context.screenHeight,
                'assets/images/splash-cover.png',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: AppColors.colorsWhite,
                size: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
