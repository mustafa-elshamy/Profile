import 'package:flutter/material.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _cardHeight = MediaQuery.of(context).size.height / 8;
    double _cardWidth = MediaQuery.of(context).size.width * 3 / 4;
    return Container(
      width: _cardWidth,
      height: _cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red,
      ),
    );
  }
}
