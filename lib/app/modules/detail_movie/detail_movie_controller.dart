import 'package:get/get.dart';
import 'package:the_best_films/app/models/movie_detail_model.dart';
import 'package:the_best_films/app/models/movie_model.dart';
import 'package:the_best_films/app/repositories/movie_details_repository/movie_details_repository.dart';
import 'package:the_best_films/app/ui/helpers/messages.dart';
import '../../models/movie_credits_model.dart';

class DetailMovieController extends GetxController with Messages {
  final args = Get.arguments as MovieModel;
  final repository = Get.find<MovieDetailsRepository>();
  var movieDetailModel = MovieDetailModel().obs;
  var listCredits = <MovieCreditsModel>[];
  var loading = false.obs;

  @override
  onInit() {
    getDetailsMovies(movieId: args.id.toString());
    super.onInit();
  }

  Future<void> getDetailsMovies({String? movieId}) async {
    loading(true);
    listCredits.clear();
    final detailsData = await repository.getMovieDetail(movieId!);
    if (detailsData == null) {
      loading(false);
      return showError(
          'Ops...', 'Não foi possível acessar\n os detalhes do filmes!');
    }
    for (var credit in detailsData.credits!) {
      listCredits.add(credit);
    }
    movieDetailModel(detailsData);
    loading(false);
  }
}
