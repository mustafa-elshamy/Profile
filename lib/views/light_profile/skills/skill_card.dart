import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  double _cardWidth;
  double _cardHeight;
  final String image;
  final String text;

  SkillCard({Key key, this.image, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _cardWidth = MediaQuery.of(context).size.width / 8;
    _cardHeight = MediaQuery.of(context).size.height / 8;
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: _cardHeight,
        width: _cardWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: _cardHeight - 30,
              width: _cardWidth - 10,
              child: Center(
                child: Image.asset(
                  image,
                  height: _cardHeight,
                  width: _cardWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                text,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
