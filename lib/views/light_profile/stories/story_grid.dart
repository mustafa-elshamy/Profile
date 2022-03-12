import 'package:flutter/material.dart';
import 'package:profile/constants/enums.dart';
import 'package:profile/models/story.dart';
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
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 75,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          StoryAvatar(
            isMyStory: true,
            radius: 30,
            roundPadding: 1,
            stories: [
              Story(
                mediaType: StoryMediaType.image,
                url:
                "https://upload.wikimedia.org/wikipedia/commons/9/91/F-15_vertical_deploy.jpg",
                storyImageDuration: const Duration(seconds: 5),
              ),
              Story(
                mediaType: StoryMediaType.video,
                url:
                "https://biteable.com/static-assets/homepage/HubpageVideo_Short_16x9_01.mp4",
              ),
            ],
          ),
          for (int i = 0; i < 9; i++)
            StoryAvatar(
              radius: 30,
              roundPadding: 1,
              stories: [
                Story(
                  mediaType: StoryMediaType.image,
                  url:
                  "https://upload.wikimedia.org/wikipedia/commons/9/91/F-15_vertical_deploy.jpg",
                  storyImageDuration: const Duration(seconds: 5),
                ),
                Story(
                  mediaType: StoryMediaType.video,
                  url:
                  "https://biteable.com/static-assets/homepage/HubpageVideo_Short_16x9_01.mp4",
                ),
              ],
            )
        ],
      ),
    );
  }
}
