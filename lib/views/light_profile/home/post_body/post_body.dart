import 'package:flutter/material.dart';

import 'package:profile/constants/colors.dart';
import 'package:profile/views/light_profile/home/images_grid.dart';
import 'package:readmore/readmore.dart';

class PostBody extends StatelessWidget {
  final String text;
  final List<String> images;
  final List<String> heroTags;
  final Function onTap;
  final Function onDoubleTap;

  const PostBody({
    Key key,
    this.text,
    @required this.images,
    this.onTap,
    this.onDoubleTap,
    this.heroTags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text != null
                ? ReadMoreText(
                    text,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    trimLines: 2,
                    trimLength: 100,
                    trimCollapsedText: "Read more",
                    trimExpandedText: "Read less",
                    colorClickableText: MyColors.primaryColor,
                  )
                : Container(),
            SizedBox(height: 10),
            images != null
                ? ImagesGrid(
                    images: images,
                    onDoubleTap: onDoubleTap,
                    heroTags: heroTags,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
