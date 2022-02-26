import 'package:flutter/material.dart';
import 'package:profile/views/light_profile/experience/experience_card.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({Key key}) : super(key: key);

  @override
  _ExperiencePageState createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 1,
      mainAxisSpacing: 20,
      padding: EdgeInsets.only(
        top: 20,
        left: 50,
        right: 20,
      ),

      children: [
        ExperienceCard(),
        ExperienceCard(),
        ExperienceCard(),
        ExperienceCard(),
        ExperienceCard(),
      ],
    );
  }
}
