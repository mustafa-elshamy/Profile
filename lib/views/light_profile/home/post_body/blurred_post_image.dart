import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredPostImage extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final int number;

  const BlurredPostImage({
    Key key,
    this.image,
    this.width,
    this.height,
    this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                color: Colors.white.withOpacity(0.1),
                alignment: Alignment.center,
                child: Text(
                  "+${number.toString()}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
