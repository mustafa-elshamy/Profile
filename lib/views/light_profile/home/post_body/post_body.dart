import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile/constants/colors.dart';
import 'package:profile/views/light_profile/home/images_grid.dart';
import 'package:readmore/readmore.dart';

class PostBody extends StatelessWidget {
  final String text;
  final List<String> images;

  const PostBody({
    Key key,
    this.text,
    @required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text != null
              ? ReadMoreText(
                  text,
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                  trimLines: 2,
                  trimLength: 100,
                  trimCollapsedText: "Read more",
                  trimExpandedText: "Read less",
                  colorClickableText: MyColors.primaryColor,
                )
              : Container(),
          SizedBox(height: 10),
          ImagesGrid(
            images: images,
          )
        ],
      ),
    );
  }
}
