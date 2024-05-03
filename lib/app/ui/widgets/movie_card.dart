import 'package:flutter/material.dart';
import 'package:the_best_films/app/ui/helpers/size_extensions.dart';
import 'package:the_best_films/app/ui/styles/app_colors.dart';
import 'package:the_best_films/app/ui/styles/app_text_styles.dart';

class MovieCard extends StatelessWidget {
  final String labelName;
  final String? ranking;
  final String imageUrl;
  const MovieCard({
    super.key,
    required this.labelName,
    this.ranking,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[200]!,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/animations/loading.gif',
                  placeholderColorBlendMode: BlendMode.darken,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      width: 150,
                      height: 200,
                      child: Icon(
                        Icons.question_mark,
                        size: 60,
                        color: AppColors.colorsGrey,
                      ),
                    );
                  },
                  image: imageUrl,
                  height: context.screenHeight * .28,
                  width: context.screenWidth * .45,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    labelName,
                    style: AppTextStyle.smallText,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(height: 6),
            ],
          ),
          ranking == null
              ? const SizedBox.shrink()
              : Positioned(
                  left: 8,
                  bottom: 50,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: AppColors.colorsGrey,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.colorsBlack,
                      child: Text(
                        ranking!,
                        style: const TextStyle(
                          color: AppColors.colorsWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
