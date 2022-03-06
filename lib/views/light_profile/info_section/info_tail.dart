import 'package:flutter/material.dart';

class InfoTail extends StatelessWidget {
  final String text;
  final Color textColor;

  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  const InfoTail({
    Key key,
    @required this.text,
    this.textColor,
    this.icon,
    this.iconColor,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 3 - 15;

    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        width: width,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon, color: iconColor),
            SizedBox(width: 5),
            text != null
                ? Text(text, style: TextStyle(color: textColor))
                : Container(),
          ],
        ),
      ),
    );
  }
}
