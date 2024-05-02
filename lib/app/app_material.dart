import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_best_films/app/config/router/app_routes.dart';
import 'package:the_best_films/app/ui/theme/theme_config.dart';

class AppMaterial extends StatelessWidget {
  const AppMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeConfig.theme,
      getPages: AppRoutes.routes,
    );
  }
}
