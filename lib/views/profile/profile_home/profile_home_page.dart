import 'package:flutter/material.dart';
import 'package:profile/views/profile/create_post/create_post_card.dart';
import 'package:profile/views/profile/profile_home/post.dart';
import 'package:profile/views/profile/stories/story_grid.dart';
import 'package:profile/views/profile/widgets/custom_grid_view.dart';

class ProfileHomePage extends StatefulWidget {
  final double horizontalPadding;

  const ProfileHomePage({
    Key key,
    this.horizontalPadding,
  }) : super(key: key);

  @override
  _ProfileHomePageState createState() => _ProfileHomePageState();
}

class _ProfileHomePageState extends State<ProfileHomePage> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return CustomGridView(
      horizontalPadding: widget.horizontalPadding,
      horizontalAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 5),
        StoryGrid(),
        CreatePost(),

        /// this is dummy data
        for (int p = 1; p <= 10; p++)
          Post(
            heroTags: [for (int j = 0; j < p; j++) (i++).toString()],
            text: "$p photo(s)",
            images: [
              for (int j = 0; j < p; j++)
                "https://cdn.vox-cdn.com/thumbor/iKqbD98GVm9t-VgiKdSjA2oHomE=/0x0:2439x1625/920x613/filters:focal(1025x618:1415x1008):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/69123675/5.0.png",
            ],
            likesNumber: "10",
            commentsNumber: "200",
          ),
      ],
    );
  }
}
