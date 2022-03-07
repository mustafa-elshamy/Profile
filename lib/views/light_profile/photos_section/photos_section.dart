import 'package:flutter/material.dart';
import 'package:profile/constants/colors.dart';
import 'package:profile/views/light_profile/home/post_body/post_image.dart';
import 'package:profile/views/light_profile/widgets/custom_grid_view.dart';
import 'package:profile/views/light_profile/widgets/custom_text.dart';

class PhotosSection extends StatefulWidget {
  final List<PostImage> images;
  final Function onTap;

  const PhotosSection({
    Key key,
    @required this.images,
    this.onTap,
  }) : super(key: key);

  @override
  State<PhotosSection> createState() => _PhotosSectionState();
}

class _PhotosSectionState extends State<PhotosSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Photos",
                    textAlign: TextAlign.start,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                  Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(5),
                    child: InkWell(
                      onTap: widget.onTap,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                        decoration: BoxDecoration(
                            color: MyColors.primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "See all",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5),
              CustomGridView(
                columnsCount: 3,
                verticalPadding: 1,
                horizontalPadding: 1,
                children: [
                  for (int i = 0; i < widget.images.length; i++)
                    widget.images[i]
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
