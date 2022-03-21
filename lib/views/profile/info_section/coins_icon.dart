import 'package:flutter/material.dart';
import 'package:profile/constants/colors.dart';

class CoinsIcon extends StatelessWidget {
  final int coins;

  const CoinsIcon({
    Key key,
    @required this.coins,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    // double height = MediaQuery.of(context).size.height / 24;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Image.asset(
            "assets/images/su_coin.png",
            width: width,
            // height: height,
          ),
          SizedBox(width: 2),
          Text(
            coins.toString(),
            style: TextStyle(
                color: MyColors.primaryColor, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
