import 'package:flutter/material.dart';
import 'package:profile/constants/colors.dart';
import 'package:profile/views/light_profile/widgets/custom_icon.dart';
import 'package:profile/views/light_profile/widgets/custom_text.dart';

class SideMenuCard extends StatefulWidget {
  final String text;
  final double elevation;
  final IconData icon;
  final double iconSize;
  final String image;
  final int imageContainerDifference;
  final Color iconColor;

  const SideMenuCard(
      {Key key,
      this.text,
      this.elevation = 0,
      this.icon,
      this.iconSize,
      this.image,
      this.imageContainerDifference = 0,
      this.iconColor})
      : super(key: key);

  @override
  _SideMenuCardState createState() => _SideMenuCardState();
}

class _SideMenuCardState extends State<SideMenuCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
      child: Material(
        elevation: widget.elevation,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.only(right: 10),
          height: MediaQuery.of(context).size.height / 15,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              CustomIcon(
                icon: widget.icon,
                color: widget.iconColor ?? MyColors.primaryColor,
                size: widget.iconSize,
                image: widget.image,
                imageContainerDifference: widget.imageContainerDifference,
              ),
              Text(
                widget.text,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
