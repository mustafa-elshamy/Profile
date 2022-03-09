import 'package:flutter/material.dart';
import 'package:dashed_circle/dashed_circle.dart';
import 'package:profile/constants/colors.dart';
import 'package:profile/views/light_profile/cover/profile_circle_icon.dart';
import 'package:page_transition/page_transition.dart';
import 'package:profile/views/light_profile/stories/story_screen.dart';

class StoryAvatar extends StatelessWidget {
  final double radius;
  final double roundPadding;

  const StoryAvatar({
    Key key,
    this.radius,
    this.roundPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.bottomToTop,
                  child: StoryScreen(),
                  duration: const Duration(milliseconds: 300),
                ),
              );
            },
            child: DashedCircle(
              dashes: 15,
              color: MyColors.primaryColor,
              child: Center(
                child: ProfileCircleIcon(
                  elevation: 0,
                  radius: radius,
                  padding: roundPadding,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
