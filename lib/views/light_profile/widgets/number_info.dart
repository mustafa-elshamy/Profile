import 'package:flutter/material.dart';
import 'package:profile/constants/colors.dart';

class NumberInfo extends StatelessWidget {
  final String info;
  final String number;
  final Function onTap;
  final bool isSelected;

  const NumberInfo(
      {Key key,
      this.info,
      this.number,
      @required this.onTap,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _cardHeight = MediaQuery.of(context).size.height * .1;
    double _cardWidth = MediaQuery.of(context).size.width * .25;

    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(_cardWidth / 7),
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          height: _cardHeight,
          width: _cardWidth,
          decoration: BoxDecoration(
              color: isSelected ? MyColors.primaryColor : Colors.white,
              borderRadius: BorderRadius.circular(_cardWidth / 8)),
          duration: Duration(milliseconds: 700),
          curve: Curves.decelerate,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                info,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: isSelected ? Colors.white70 : Colors.black45),
              ),
              SizedBox(height: 10),
              Text(
                number,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: isSelected ? Colors.white : Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
