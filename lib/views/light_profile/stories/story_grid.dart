import 'package:flutter/material.dart';
import 'package:profile/views/light_profile/stories/story_avatar.dart';

class StoryGrid extends StatefulWidget {
  const StoryGrid({Key key}) : super(key: key);

  @override
  State<StoryGrid> createState() => _StoryGridState();
}

class _StoryGridState extends State<StoryGrid> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 75,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          for (int i = 0; i < 10; i++)
            StoryAvatar(
              radius: 30,
              roundPadding: 1,
            )
        ],
      ),
    );
  }
}
