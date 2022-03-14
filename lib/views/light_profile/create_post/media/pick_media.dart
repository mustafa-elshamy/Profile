import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:profile/constants/colors.dart';
import 'package:profile/helpers/helper.dart';

import 'choose_media_menu.dart';

class PickMedia extends StatelessWidget {
  final bool isImagesSelected;
  final Function onTap;
  final String text;
  final double verticalPadding;

  const PickMedia({
    Key key,
    this.isImagesSelected = false,
    this.onTap,
    this.text,
    this.verticalPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 5),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            width: isImagesSelected ? 60 : MediaQuery.of(context).size.width,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            // duration: const Duration(milliseconds: 500),
            // curve: Curves.fastLinearToSlowEaseIn,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/image_gallery.png",
                  color: MyColors.primaryColor,
                  height: 35,
                  width: 35,
                ),
                const SizedBox(width: 10),
                !isImagesSelected
                    ? Text(
                        text,
                        style: TextStyle(
                            color: MyColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
