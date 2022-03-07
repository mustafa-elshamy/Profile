import 'package:flutter/material.dart';

class ProfileCircleIcon extends StatelessWidget {
  final double radius;
  final Function onTap;
  final Color circleColor;
  final double elevation;

  const ProfileCircleIcon({
    Key key,
    this.radius,
    this.onTap,
    this.circleColor = Colors.white,
    this.elevation = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(1.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: circleColor,
          ),
          child: CircleAvatar(
            radius: radius,
            backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1628563694622-5a76957fd09c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
            ),
          ),
        ),
      ),
    );
  }
}
