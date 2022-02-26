import 'package:flutter/material.dart';
import 'package:profile/views/light_profile/skills/skill_card.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({Key key}) : super(key: key);

  @override
  _SkillsPageState createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.only(top: 40, right: 20, left: 20),
      children: [
        SkillCard(
          image: "assets/images/c++.png",
          text: "C++",
        ),
        SkillCard(
          image: "assets/images/c#.png",
          text: "C#",
        ),
        SkillCard(
          image: "assets/images/java.png",
          text: "Java",
        ),
        SkillCard(
          image: "assets/images/xd.png",
          text: "Adobe XD",
        ),
        SkillCard(
          image: "assets/images/python.png",
          text: "Python",
        ),
        SkillCard(
          image: "assets/images/organize.png",
          text: "Project Organization",
        ),
        SkillCard(
          image: "assets/images/problem_solving.png",
          text: "Problem Solving",
        ),
      ],
    );
  }
}
