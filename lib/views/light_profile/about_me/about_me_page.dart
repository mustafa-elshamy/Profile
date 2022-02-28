import 'package:flutter/material.dart';
import 'package:profile/views/light_profile/about_me/about_me_card.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({Key key}) : super(key: key);

  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    final double aspectRatio = MediaQuery.of(context).size.aspectRatio * 3.5;
    return Column(
      children: const [
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
          icon: Icons.male_rounded,
        ),
      ],
    );
  }
}
