import 'package:flutter/material.dart';
import 'package:profile/views/profile/about_me/about_page.dart';
import 'package:profile/views/profile/experience/experience_page.dart';
import 'package:profile/views/profile/skills/skills_page.dart';

class CVPage extends StatefulWidget {
  const CVPage({Key key}) : super(key: key);

  @override
  State<CVPage> createState() => _CVPageState();
}

class _CVPageState extends State<CVPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        AboutPage(),
        SizedBox(height: 50),
        SkillsPage(),
        SizedBox(height: 50),
        ExperiencePage(),
      ],
    );
  }
}
