import 'package:flutter/material.dart';
import 'package:profile/constants/colors.dart';
import 'package:profile/views/light_profile/about_me/social_item.dart';

class SocialCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final List<String> socialLinks;

  const SocialCard(
      {Key key,
      this.title,
      this.content,
      this.icon,
      @required this.socialLinks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  SocialItem(
                    image: "assets/images/facebook.png",
                    socialLink: "facebook account link",
                  ),
                  SocialItem(
                    image: "assets/images/github.png",
                    socialLink: "github account link",
                  ),
                  SocialItem(
                    image: "assets/images/linkedin.png",
                    socialLink: "linkedin account link",
                  ),
                  SocialItem(
                    image: "assets/images/behance.png",
                    socialLink: "behance account link",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
