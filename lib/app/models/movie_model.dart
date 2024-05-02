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

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));
}


            // "id": 238,
            // "original_language": "en",
            // "original_title": "The Godfather",
            // "overview": "Em 1945, Don Corleone é o chefe de uma mafiosa família italiana de Nova York. Ele costuma apadrinhar várias pessoas, realizando importantes favores para elas, em troca de favores futuros. Com a chegada das drogas, as famílias começam uma disputa pelo promissor mercado. Quando Corleone se recusa a facilitar a entrada dos narcóticos na cidade, não oferecendo ajuda política e policial, sua família começa a sofrer atentados para que mudem de posição. É nessa complicada época que Michael, um herói de guerra nunca envolvido nos negócios da família, vê a necessidade de proteger o seu pai e tudo o que ele construiu ao longo dos anos.",
            // "popularity": 199.537,
            // "poster_path": "/oJagOzBu9Rdd9BrciseCm3U3MCU.jpg",
            // "release_date": "1972-03-14",
            // "title": "O Poderoso Chefão",
            // "video": false,
            // "vote_average": 8.7,
            // "vote_count": 19760
       





