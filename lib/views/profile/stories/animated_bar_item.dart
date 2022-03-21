import 'package:flutter/material.dart';

class AnimatedBarItem extends StatelessWidget {
  final double width;
  final Color color;

  const AnimatedBarItem({
    Key key,
    this.width,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.0,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black26,
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}
