import 'package:flutter/material.dart';
import 'package:profile/constants/colors.dart';

class SettingsIcon extends StatelessWidget {
  final Function onTap;
  final Color iconColor;
  final Color backgroundColor;

  const SettingsIcon(
      {Key key, this.onTap, this.iconColor, this.backgroundColor})
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
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: backgroundColor
            ),
            child: Icon(
              Icons.settings,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
