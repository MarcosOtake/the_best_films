import 'package:the_best_films/app/models/movie_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> getTopRated();
}
