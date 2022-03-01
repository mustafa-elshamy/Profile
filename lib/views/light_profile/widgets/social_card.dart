import 'package:flutter/material.dart';
import 'package:profile/constants/colors.dart';

class SocialCard extends StatelessWidget {
  final String image;
  final double size;
  final Color imageColor;
  final int imageContainerDifference;

  const SocialCard(
      {Key key,
      this.image,
      this.size = 20,
      this.imageColor,
      this.imageContainerDifference = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(size / 4),
        child: Container(
          width: size,
          height: size,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(size / 4)),
          child: Center(
            child: Image.asset(
              image,
              height: size - imageContainerDifference,
              width: size - imageContainerDifference,
              color: imageColor,
            ),
          ),
        ),
      ),
    );
  }
}
