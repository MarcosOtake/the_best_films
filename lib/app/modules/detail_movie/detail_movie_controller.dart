import 'package:get/get.dart';
import 'package:the_best_films/app/models/movie_detail_model.dart';
import 'package:the_best_films/app/models/movie_model.dart';
import 'package:the_best_films/app/repositories/movie_details_repository/movie_details_repository.dart';
import 'package:the_best_films/app/ui/helpers/messages.dart';

class DetailMovieController extends GetxController with Messages {
  final args = Get.arguments as MovieModel;
  final repository = Get.find<MovieDetailsRepository>();
  var movieDetailModel = MovieDetailModel().obs;
  var loading = false.obs;

  Future<void> getDetailsMovies(String movieId) async {
    loading(true);
    final detailsData = await repository.getMovieDetail(movieId);
    if (detailsData == null) {
      loading(false);
      return showError(
          'Ops...', 'Não foi possível acessar\n o catálago de filmes!');
    }
    movieDetailModel(detailsData);
    loading(false);
  }
}
