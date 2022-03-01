import 'package:flutter/material.dart';
import 'package:profile/constants/colors.dart';

class CustomIcon extends StatelessWidget {
  final Function onTap;
  final Color color;
  final double size;
  final IconData icon;
  final String image;
  final int imageContainerDifference;

  const CustomIcon(
      {Key key,
      this.onTap,
      this.color,
      this.size,
      this.icon,
      this.image,
      this.imageContainerDifference = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),
            child: Center(
              child: icon != null
                  ? Icon(
                      icon,
                      color: color,
                    )
                  : Image.asset(
                      image,
                      color: color,
                      width: size - imageContainerDifference,
                      height: size - imageContainerDifference,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
