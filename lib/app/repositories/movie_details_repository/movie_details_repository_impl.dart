import 'dart:developer';
import 'package:the_best_films/app/core/rest_client/custom_dio.dart';
import 'package:the_best_films/app/models/movie_detail_model.dart';
import 'package:the_best_films/app/repositories/movie_details_repository/movie_details_repository.dart';
import '../../config/env/env.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final dio = CustomDio();
  @override
  Future<MovieDetailModel?> getMovieDetail(String movieId) async {
    try {
      final result = await dio.get(
        '${Env.urlBase}/movie/$movieId',
        queryParameters: {
          'api_key': Env.apiKey,
          'language': 'pt-br',
          'append_to_response': 'images,credits',
          'include_image_language': 'en,pt-br'
        },
      );
      final details = result.data
          .map<MovieDetailModel>((d) => MovieDetailModel.fromMap(d))
          .toList();

      return details;
    } on Exception catch (e, s) {
      log('Erro ao recuperar detalhes do filme', error: e, stackTrace: s);
    }
    return null;
  }
}
