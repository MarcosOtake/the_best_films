import 'package:get/get.dart';
import 'package:the_best_films/app/config/router/app_routes_named.dart';

class SplashController extends GetxController {
  @override
  onInit() async {
    showLoading();
    super.onInit();
  }

  Future<void> showLoading() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offNamed(AppRoutesNamed.home);
  }
}
