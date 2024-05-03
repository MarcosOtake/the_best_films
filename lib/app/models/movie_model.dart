import 'dart:convert';

import '../config/env/env.dart';

class MovieModel {
  int? id;
  String? backdropPath;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  double? voteAverage;
  int? voteCount;

  MovieModel({
    this.id,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id']?.toInt(),
      backdropPath: '${Env.urlImage}${map['backdrop_path']}',
      originalLanguage: map['original_language'],
      originalTitle: map['original_title'],
      overview: map['overview'],
      popularity: map['popularity']?.toDouble(),
      posterPath: '${Env.urlImage}${map['poster_path']}',
      releaseDate: map['release_date'],
      title: map['title'],
      voteAverage: map['vote_average']?.toDouble(),
      voteCount: map['vote_count']?.toInt(),
    );
  }
}
