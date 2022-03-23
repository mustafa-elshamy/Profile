import 'package:flutter/material.dart';
import 'package:profile/views/profile/profile_home/post_body/blurred_post_image.dart';
import 'dart:math';

import 'package:profile/views/profile/profile_home/post_body/post_image.dart';

class ImagesGrid extends StatefulWidget {
  final List<String> images;
  final List<String> heroTags;
  final Function onDoubleTap;

  const ImagesGrid({
    Key key,
    @required this.images,
    this.onDoubleTap,
    this.heroTags,
  }) : super(key: key);

  @override
  State<ImagesGrid> createState() => _ImagesGridState();
}

class _ImagesGridState extends State<ImagesGrid> {
  double mainPhotoWidth;
  double mainPhotoHeight;

  double smallPhotoWidth;
  double smallPhotoHeight;

  @override
  Widget build(BuildContext context) {
    int totalPhotos = widget.images.length;
    mainPhotoHeight = MediaQuery.of(context).size.height * .25;
    smallPhotoHeight = mainPhotoHeight / min(totalPhotos - 1, 2);

    mainPhotoWidth = MediaQuery.of(context).size.width * .85;
    smallPhotoWidth = mainPhotoWidth / min(totalPhotos - 1, 3);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PostImage(
              image: widget.images[0],
              height: mainPhotoHeight,
              width: mainPhotoWidth,
              withLikeAnimation: widget.images.length == 1,
              onDoubleTap: widget.onDoubleTap,
              heroTag: widget.heroTags[0],
            ),
          ],
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 1; i < min(totalPhotos, 4); i++)
                (i == 3 && totalPhotos > 4)
                    ? BlurredPostImage(
                        image: widget.images[i],
                        height: smallPhotoHeight,
                        width: smallPhotoWidth,
                        number: totalPhotos - i,
                        heroTag: widget.heroTags[i],
                      )
                    : PostImage(
                        image: widget.images[i],
                        height: smallPhotoHeight,
                        width: smallPhotoWidth,
                        heroTag: widget.heroTags[i],
                      ),
            ],
          ),
        )
      ],
    );
  }
}
