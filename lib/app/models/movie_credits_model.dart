import 'dart:convert';
import 'package:the_best_films/app/config/env/env.dart';

class MovieCreditsModel {
  final String? name;
  final String? originalName;
  final String? profilePath;

  MovieCreditsModel({
    this.name,
    this.originalName,
    this.profilePath,
  });

  factory MovieCreditsModel.fromMap(Map<String, dynamic> map) {
    return MovieCreditsModel(
      name: map['name'],
      originalName: map['original_name'],
      profilePath: '${Env.urlImage}${map['profile_path']}',
    );
  }
}
