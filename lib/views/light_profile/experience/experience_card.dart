import 'package:flutter/material.dart';
import 'package:profile/constants/colors.dart';

class ExperienceCard extends StatelessWidget {
  final bool isLast;
  final String job;
  final String company;
  final String duration;

  const ExperienceCard(
      {Key key, @required this.isLast, this.job, this.company, this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _cardHeight = MediaQuery.of(context).size.height / 8;
    double _cardWidth = MediaQuery.of(context).size.width * 3 / 4;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: _cardHeight / 2 - 10,
            ),
            CircleAvatar(
              radius: 6,
              backgroundColor: MyColors.primaryColor,
            ),
            Visibility(
              visible: !isLast,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
            ),
            Visibility(
              visible: !isLast,
              child: Container(
                width: 2,
                height: MediaQuery.of(context).size.height * .1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: MyColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: _cardWidth,
            height: _cardHeight,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: _cardWidth / 2 - 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job,
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        company,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.black45,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Text(duration,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black45))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
