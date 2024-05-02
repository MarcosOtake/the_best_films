import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:the_best_films/app/ui/helpers/size_extensions.dart';
import 'package:the_best_films/app/ui/styles/app_text_styles.dart';
import './detail_movie_controller.dart';

class DetailMoviePage extends GetView<DetailMovieController> {
  const DetailMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Filme'),
      ),
      body: Column(
        children: [
          FadeInImage.assetNetwork(
            placeholder: 'assets/animations/loading.gif',
            placeholderColorBlendMode: BlendMode.darken,
            image: controller.args.backdropPath ?? '',
            width: context.screenWidth,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Descrição do filme',
                  style: AppTextStyle.title,
                ),
                const SizedBox(height: 8),
                Text(
                  controller.args.overview ?? '',
                  style: AppTextStyle.normalText,
                ),
                const SizedBox(height: 16),
                Text(
                  'Nota / Avaliação',
                  style: AppTextStyle.title,
                ),
                const SizedBox(height: 8),
                Text(
                  (controller.args.voteAverage?.toStringAsFixed(1) ?? ''),
                  style: AppTextStyle.appBarTitle,
                ),
              ],
            ),
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       controller.getDetailsMovies(controller.args.id.toString());
          //     },
          //     child: const Text('Detalhes')),
        ],
      ),
    );
  }
}
