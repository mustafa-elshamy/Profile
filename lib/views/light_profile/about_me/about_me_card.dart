import 'package:flutter/material.dart';
import 'package:profile/constants/colors.dart';

class AboutMeCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;

  const AboutMeCard({Key key, this.title, this.content, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Icon(
                    icon,
                    color: MyColors.primaryColor,
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(
                content,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
