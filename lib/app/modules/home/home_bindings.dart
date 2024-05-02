import 'package:get/get.dart';
import 'package:the_best_films/app/repositories/movie_repository/movie_repository.dart';
import 'package:the_best_films/app/repositories/movie_repository/movie_repository_impl.dart';
import './home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieRepository>(() => MovieRepositoryImpl());
    Get.put(HomeController());
  }
}
