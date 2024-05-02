import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:the_best_films/app/config/env/env.dart';
import 'package:the_best_films/app/core/rest_client/custom_dio.dart';
import 'package:the_best_films/app/models/movie_model.dart';
import 'package:the_best_films/app/repositories/movie_repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final dio = CustomDio();
  @override
  Future<List<MovieModel>> getTopRated() async {
    try {
      final result = await dio.get('${Env.urlBase}/movie/top_rated',
          queryParameters: {'api_key': Env.apiKey, 'page': '1'});
      final topMovies = result.data['results']
          .map<MovieModel>((m) => MovieModel.fromMap(m))
          .toList();
      return topMovies;
    } on DioException catch (e, s) {
      log('Erro ao recuperar filmes', error: e, stackTrace: s);
    }
    return <MovieModel>[];
  }
}
