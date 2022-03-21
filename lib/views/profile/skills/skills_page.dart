import 'package:flutter/material.dart';
import 'package:profile/views/profile/widgets/custom_grid_view.dart';
import 'package:profile/views/profile/skills/skill_card.dart';
import 'package:profile/views/profile/widgets/title_text.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({Key key}) : super(key: key);

  @override
  _SkillsPageState createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  @override
  Widget build(BuildContext context) {
    // final double aspectRatio = MediaQuery.of(context).size.width /
    //     MediaQuery.of(context).size.height *
    //     1.7;
    // return GridView.count(
    //   physics: NeverScrollableScrollPhysics(),
    //   crossAxisCount: 3,
    //   crossAxisSpacing: 10,
    //   mainAxisSpacing: 10,
    //   childAspectRatio: aspectRatio,
    //   padding: EdgeInsets.only(top: 40, right: 20, left: 20),
    //   children: [
    //     SkillCard(
    //       image: "assets/images/c++.png",
    //       text: "C++",
    //     ),
    //     SkillCard(
    //       image: "assets/images/c#.png",
    //       text: "C#",
    //     ),
    //     SkillCard(
    //       image: "assets/images/java.png",
    //       text: "Java",
    //     ),
    //     SkillCard(
    //       image: "assets/images/xd.png",
    //       text: "Adobe XD",
    //     ),
    //     SkillCard(
    //       image: "assets/images/python.png",
    //       text: "Python",
    //     ),
    //     SkillCard(
    //       image: "assets/images/organize.png",
    //       text: "Project Organization",
    //     ),
    //     SkillCard(
    //       image: "assets/images/problem_solving.png",
    //       text: "Problem Solving",
    //     ),
    //   ],
    // );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          text: "Skills",
        ),
        CustomGridView(
          columnsCount: 3,
          verticalPadding: 5,
          horizontalPadding: 10,
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
        ),
      ],
    );
  }
}
