import 'package:flutter/material.dart';

class ReactionIcon extends StatelessWidget {
  final Function onTap;
  final String image;
  final String text;

  const ReactionIcon({
    Key key,
    this.onTap,
    @required this.image,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * .065;

    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            image,
            height: width,
            width: width,
          ),
          SizedBox(width: 2),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
