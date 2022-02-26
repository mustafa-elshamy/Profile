import 'package:flutter/material.dart';

class NumberInfo extends StatelessWidget {
  final String info;
  final String number;
  final double _cardWidth = 100;
  final double _cardHeight = 90;

  const NumberInfo({Key key, this.info, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(_cardWidth / 7),
      child: Container(
        height: _cardHeight,
        width: _cardWidth,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(_cardWidth / 7)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              info,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45),
            ),
            SizedBox(height: 10),
            Text(
              number,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
