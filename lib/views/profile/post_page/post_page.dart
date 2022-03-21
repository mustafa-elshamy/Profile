import 'package:flutter/material.dart';
import 'package:profile/views/profile/profile_home/post.dart';

import 'dart:math';

class PostPage extends StatefulWidget {
  final List<String> images;
  final List<String> heroTags;
  final String text;

  const PostPage({
    Key key,
    this.images,
    this.text,
    this.heroTags,
  }) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.direction == 0 && details.delta.distance > 10) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          children: [
            Post(
              isClickable: false,
              verticalMargin: 4,
              text: widget.text,
              commentsNumber: "10",
              likesNumber: "10",
            ),
            for (int i = 0; i < widget.images.length; i++)
              Post(
                isClickable: false,
                withHeader: false,
                verticalMargin: 4,
                commentsNumber: "10",
                likesNumber: "10",
                images: [widget.images[i]],
                heroTags: [widget.heroTags[i]],
              ),
          ],
        ),
      ),
    );
  }
}
