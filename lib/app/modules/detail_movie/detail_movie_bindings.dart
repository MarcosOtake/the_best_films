import 'package:get/get.dart';
import 'package:the_best_films/app/repositories/movie_details_repository/movie_details_repository.dart';
import 'package:the_best_films/app/repositories/movie_details_repository/movie_details_repository_impl.dart';
import './detail_movie_controller.dart';

class DetailMovieBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailsRepository>(() => MovieDetailsRepositoryImpl());
    Get.put(DetailMovieController());
  }
}
