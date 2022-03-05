import 'package:flutter/material.dart';
import 'package:profile/views/light_profile/about_me/about_me_card.dart';
import 'package:profile/views/light_profile/about_me/social_card.dart';
import 'package:profile/views/light_profile/experience/experience_page.dart';
import 'package:profile/views/light_profile/skills/skills_page.dart';
import 'package:profile/views/light_profile/widgets/title_text.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          text: "About",
        ),
        AboutMeCard(
          title: "About me",
          content: "Hey, I am dfjsdlfjk alskfjasdlk alfkasd lkfjasdlkf l ka"
              "sdjflk jaldfkj lakj lakfj laksfjal jalkjf alsdkfjasl df"
              "jsdlfjk alskfjasdlk alfkasd lkfjasdlkf l kasdjflk jaldfkj lakj lakfj laksfj"
              "al jalkjf alsdkfjasl dfjsdlfjk alskfjasdlk alfkasd lkfjasdlkf l kasdjflk jaldfkj lakj lakfj laksfjal jalkjf alsdkfjasl"
              "jsdlfjk alskfjasdlk alfkasd lkfjasdlkf l kasdjflk jaldfkj lakj lakfj laksfj"
              "al jalkjf alsdkfjasl dfjsdlfjk alskfjasdlk alfkasd lkfjasdlkf l kasdjflk jaldfkj lakj lakfj laksfjal jalkjf alsdkfjasl",
          icon: Icons.info,
        ),
        AboutMeCard(
          title: "Location",
          content: "Cairo, Egypt",
          icon: Icons.location_on_rounded,
        ),
        AboutMeCard(
          title: "Birthdate",
          content: "1 / 1 / 2000",
          icon: Icons.date_range_rounded,
        ),
        AboutMeCard(
          title: "Gender",
          content: "Male",
          // Todo: check gender to show icon
          icon: Icons.male_rounded,
        ),
        SocialCard(
          title: "My Accounts",
          icon: Icons.account_circle_rounded,
        ),
      ],
    );
  }
}
