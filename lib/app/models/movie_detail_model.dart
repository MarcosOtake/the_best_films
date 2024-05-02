import 'dart:convert';
import 'package:the_best_films/app/models/movie_credits_model.dart';
import '../config/env/env.dart';

class MovieDetailModel {
  final String? backdropPath;
  final int? id;
  final List<String>? originCountry;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final double? voteAverage;
  final int? voteCount;
  final List<MovieCreditsModel>? credits;

  MovieDetailModel({
    this.backdropPath,
    this.id,
    this.originCountry,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
    this.credits,
  });

  factory MovieDetailModel.fromMap(Map<String, dynamic> map) {
    return MovieDetailModel(
      backdropPath: '${Env.urlImage}${map['backdrop_path']}',
      id: map['id']?.toInt(),
      originCountry: List<String>.from(map['origin_country']),
      originalTitle: map['original_title'],
      overview: map['overview'],
      popularity: map['popularity']?.toDouble(),
      posterPath: map['poster_path'],
      voteAverage: map['vote_average']?.toDouble(),
      voteCount: map['vote_count']?.toInt(),
      credits: List<MovieCreditsModel>.from(
          map['credits']['cast']?.map((x) => MovieCreditsModel.fromMap(x)) ??
              const []),
    );
  }

  factory MovieDetailModel.fromJson(String source) =>
      MovieDetailModel.fromMap(json.decode(source));
}
