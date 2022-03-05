import 'package:flutter/material.dart';
import 'package:profile/views/light_profile/home/post_tail/reaction_icon.dart';

class PostTail extends StatefulWidget {
  final String likesNum;
  final String commentsNum;

  const PostTail({
    Key key,
    @required this.likesNum,
    @required this.commentsNum,
  }) : super(key: key);

  @override
  State<PostTail> createState() => _PostTailState();
}

class _PostTailState extends State<PostTail> {
  bool isLiked = false;
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          isLiked
              ? ReactionIcon(
                  image: "assets/images/heart_filled.png",
                  text: widget.likesNum,
                  onTap: likePost)
              : ReactionIcon(
                  image: "assets/images/heart.png",
                  text: widget.likesNum,
                  onTap: likePost),
          ReactionIcon(
              image: "assets/images/message.png", text: widget.commentsNum),
          isSaved
              ? ReactionIcon(
                  image: "assets/images/star_filled.png",
                  text: "saved",
                  onTap: savePost)
              : ReactionIcon(
                  image: "assets/images/star.png",
                  text: "save",
                  onTap: savePost),
        ],
      ),
    );
  }

  void likePost() {
    setState(() => isLiked = !isLiked);
  }

  void savePost() {
    setState(() => isSaved = !isSaved);
  }
}
