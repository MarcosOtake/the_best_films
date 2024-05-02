import 'package:get/get.dart';
import 'package:the_best_films/app/config/router/app_routes_named.dart';
import 'package:the_best_films/app/models/movie_model.dart';
import 'package:the_best_films/app/repositories/movie_repository/movie_repository.dart';
import 'package:the_best_films/app/ui/helpers/messages.dart';

class HomeController extends GetxController with Messages {
  final repository = Get.find<MovieRepository>();
  final topListMovies = <MovieModel>[].obs;
  final baseListMovies = <MovieModel>[].obs;
  var loading = false.obs;

  @override
  void onInit() async {
    await getTopMovies();
    super.onInit();
  }

  Future<void> getTopMovies() async {
    topListMovies.clear();
    baseListMovies.clear();
    loading(true);
    final moviesData = await repository.getTopRated();
    if (moviesData.isEmpty) {
      loading(false);
      return showError(
          'Ops...', 'Não foi possível acessar\n o catálago de filmes!');
    }
    for (var movie in moviesData) {
      movie.voteAverage ?? 0 / 100.0;
      topListMovies.add(movie);
      baseListMovies.add(movie);
    }
    loading(false);
  }

  void filterByName(String movieName) async {
    if (movieName.isNotEmpty) {
      var newMoviesList = baseListMovies.where(
          (m) => m.title!.toLowerCase().contains(movieName.toLowerCase()));
      topListMovies.assignAll(newMoviesList.toSet());
    } else {
      await getTopMovies();
    }
  }

  goToDetails(MovieModel model) {
    Get.toNamed(AppRoutesNamed.filmsDetails, arguments: model);
  }
}
