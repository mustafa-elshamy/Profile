import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:profile/constants/colors.dart';
import 'package:profile/models/story.dart';
import 'package:profile/views/profile/cover/profile_circle_icon.dart';
import 'package:profile/views/profile/stories/story_screen.dart';

class StoryAvatar extends StatelessWidget {
  final double radius;
  final double roundPadding;
  final List<Story> stories;
  final bool isMyStory;

  const StoryAvatar({
    Key key,
    this.radius,
    this.roundPadding,
    @required this.stories,
    this.isMyStory = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.bottomToTop,
                      child: StoryScreen(stories: stories),
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
            isMyStory
                ? Positioned(
                    top: 40,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.add_circle,
                        color: MyColors.primaryColor,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
