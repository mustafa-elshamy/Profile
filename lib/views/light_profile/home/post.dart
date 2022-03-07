import 'package:flutter/material.dart';
import 'package:profile/views/light_profile/cover/profile_circle_icon.dart';
import 'package:profile/views/light_profile/home/post_body/post_body.dart';
import 'package:profile/views/light_profile/home/post_header.dart';
import 'package:profile/views/light_profile/home/post_tail/post_tail.dart';
import 'package:profile/views/light_profile/home/post_tail/reaction_avatars.dart';

class Post extends StatefulWidget {
  final String text;
  final List<String> images;
  String likesNumber;
  final String commentsNumber;

  Post({
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
  bool isPostLiked = false;
  bool isPostSaved = false;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostHeader(),
              PostBody(
                text: widget.text,
                images: widget.images,
                onTap: likePost,
              ),
              SizedBox(height: 10),
              ReactionAvatars(),
              Divider(color: Colors.black, thickness: .5),
              PostTail(
                likesNum: widget.likesNumber,
                commentsNum: widget.commentsNumber,
                onTapLike: likePost,
                isLiked: isPostLiked,
                isSaved: isPostSaved,
                onTapSave: savePost,
              )
            ],
          ),
        ),
      ),
    );
  }

  void likePost({bool isAnimation}) {
    if (isAnimation != null && isPostLiked) return;
    setState(() {
      isPostLiked = !isPostLiked;
      widget.likesNumber =
          (int.parse(widget.likesNumber) + (isPostLiked ? 1 : -1)).toString();
    });
  }

  void savePost() => setState(() => isPostSaved = !isPostSaved);
}
