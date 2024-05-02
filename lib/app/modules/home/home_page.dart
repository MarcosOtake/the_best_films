import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:the_best_films/app/ui/helpers/size_extensions.dart';
import 'package:the_best_films/app/ui/styles/app_colors.dart';
import 'package:the_best_films/app/ui/styles/app_text_styles.dart';
import 'package:the_best_films/app/ui/widgets/movie_card.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverAppBar(
          floating: true,
          flexibleSpace: SizedBox(
            width: context.screenWidth,
            child: Stack(
              alignment: Alignment.bottomCenter,
              fit: StackFit.passthrough,
              children: [
                Image.asset(
                  'assets/images/image-app-bar.png',
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: TextField(
                    onChanged: (value) {
                      controller.filterByName(value);
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      fillColor: AppColors.colorsWhite,
                      filled: true,
                      contentPadding: EdgeInsets.zero,
                      label: Text(
                        'Search movies',
                        style: AppTextStyle.smallText,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          expandedHeight: context.screenHeight * 0.27,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
            child: Text(
              'Top 10 EUA',
              style: AppTextStyle.title,
            ),
          ),
        ),
        Obx(() {
          return controller.loading.value
              ? SliverToBoxAdapter(
                  child: Align(
                    alignment: Alignment.center,
                    child: LoadingAnimationWidget.horizontalRotatingDots(
                      color: AppColors.colorsBlack,
                      size: 60,
                    ),
                  ),
                )
              : SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 18.0,
                    crossAxisSpacing: 2.0,
                    mainAxisExtent: context.screenHeight * 0.36,
                  ),
                  itemCount: controller.topListMovies.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: MovieCard(
                        labelName: controller.topListMovies[index].title ?? '',
                        imageUrl:
                            controller.topListMovies[index].posterPath ?? '',
                        ranking:
                            (controller.topListMovies[index].voteAverage ?? 0)
                                .toStringAsFixed(1),
                      ),
                      onTap: () {
                        controller.goToDetails(controller.topListMovies[index]);
                      },
                    );
                  },
                );
        }),
      ],
    ));
  }
}
