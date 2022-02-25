import 'package:flutter/material.dart';
import 'package:profile/views/light_profile/widgets/social_card.dart';

class InfoSection extends StatefulWidget {
  const InfoSection({Key key}) : super(key: key);

  @override
  _InfoSectionState createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 2 / 3,
            child: Text(
              "Username",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 2 / 3,
            child: Text(
              "Username@gmail.com",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black54),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialCard(
                image: "assets/images/facebook.png",
                size: 40,
              ),
              SocialCard(
                image: "assets/images/linkedin.png",
                size: 40,
              ),
              SocialCard(
                image: "assets/images/github.png",
                size: 40,
              ),
              SocialCard(
                image: "assets/images/behance.png",
                size: 40,
              )
            ],
          ),
          Divider(
            height: 50,
            color: Colors.black,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
