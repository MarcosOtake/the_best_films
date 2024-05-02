import 'package:get/get_navigation/get_navigation.dart';
import 'package:the_best_films/app/config/router/app_routes_named.dart';
import 'package:the_best_films/app/modules/detail_movie/detail_movie_bindings.dart';
import 'package:the_best_films/app/modules/detail_movie/detail_movie_page.dart';
import 'package:the_best_films/app/modules/home/home_bindings.dart';
import 'package:the_best_films/app/modules/home/home_page.dart';
import '../../modules/splash/splash_bindings.dart';
import '../../modules/splash/splash_page.dart';

class AppRoutes {
  AppRoutes._();
  static final routes = <GetPage>[
    GetPage(
      name: AppRoutesNamed.splash,
      binding: SplashBindings(),
      page: () => SplashPage(),
    ),
    GetPage(
      name: AppRoutesNamed.home,
      binding: HomeBindings(),
      page: () => HomePage(),
    ),
    GetPage(
      name: AppRoutesNamed.filmsDetails,
      binding: DetailMovieBindings(),
      page: () => const DetailMoviePage(),
    ),
  ];
}
