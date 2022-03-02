import 'package:flutter/material.dart';
import 'package:profile/constants/colors.dart';

class SocialItem extends StatelessWidget {
  final String image;
  final String socialLink;

  const SocialItem({Key key, this.image, this.socialLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 8;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: MyColors.primaryColor, width: 1.5)),
          width: size,
          height: size,
          child: Center(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
