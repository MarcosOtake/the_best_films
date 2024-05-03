import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:the_best_films/app/ui/helpers/size_extensions.dart';
import 'package:the_best_films/app/ui/styles/app_text_styles.dart';
import 'package:the_best_films/app/ui/widgets/movie_card.dart';
import '../../ui/styles/app_colors.dart';
import './detail_movie_controller.dart';

class DetailMoviePage extends GetView<DetailMovieController> {
  const DetailMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Filme'),
      ),
      body: Obx(
        () {
          return controller.loading.value
              ? Center(
                  child: LoadingAnimationWidget.fourRotatingDots(
                    color: AppColors.primary,
                    size: 60,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInImage.assetNetwork(
                        placeholder: 'assets/animations/loading.gif',
                        placeholderColorBlendMode: BlendMode.darken,
                        image: controller.movieDetailModel.value.backdropPath ??
                            '',
                        width: context.screenWidth,
                        fit: BoxFit.contain,
                        placeholderScale: 0.5,
                        placeholderCacheHeight: 150,
                        placeholderFit: BoxFit.fill,
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
                              controller.movieDetailModel.value.overview ?? '',
                              style: AppTextStyle.smallText,
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            const Divider(),
                            Text('Avaliação', style: AppTextStyle.title),
                            Text.rich(
                              TextSpan(
                                  text:
                                      'Nota: ${controller.movieDetailModel.value.voteAverage?.toStringAsFixed(1) ?? ''}',
                                  style: AppTextStyle.subTitle,
                                  children: [
                                    TextSpan(
                                      text:
                                          '\t\t\tde ${controller.movieDetailModel.value.voteCount} votos',
                                      style: AppTextStyle.smallText,
                                    )
                                  ]),
                            ),
                            const Divider(),
                            const SizedBox(height: 8),
                            Text('Elenco', style: AppTextStyle.title),
                            const SizedBox(height: 8),
                            SizedBox(
                              height: 300,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  // physics: const ClampingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.listCredits.length,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                      height: context.screenHeight,
                                      child: MovieCard(
                                          labelName: controller
                                                  .listCredits[index].name ??
                                              '',
                                          imageUrl: controller
                                                  .listCredits[index]
                                                  .profilePath ??
                                              ''),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
