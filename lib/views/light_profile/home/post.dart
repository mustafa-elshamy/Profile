import 'package:flutter/material.dart';
import 'package:profile/views/light_profile/cover/profile_circle_icon.dart';
import 'package:profile/views/light_profile/home/post_body/post_body.dart';
import 'package:profile/views/light_profile/home/post_header.dart';
import 'package:profile/views/light_profile/home/post_tail/post_tail.dart';

class Post extends StatefulWidget {
  final String text;
  final List<String> images;
  final String likesNumber;
  final String commentsNumber;

  const Post({
    Key key,
    this.text,
    this.images,
    @required this.likesNumber,
    @required this.commentsNumber,
  }) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              PostHeader(),
              PostBody(
                text: widget.text,
                images: widget.images,
              ),
              PostTail(
                likesNum: widget.likesNumber,
                commentsNum: widget.commentsNumber,
              )
            ],
          ),
        ),
      ),
    );
  }
}
