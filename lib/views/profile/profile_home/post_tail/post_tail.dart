import 'package:flutter/material.dart';
import 'package:profile/constants/colors.dart';
import 'package:profile/views/profile/profile_home/post_tail/reaction_icon.dart';
import 'package:like_button/like_button.dart';

class PostTail extends StatefulWidget {
  final String likesNum;
  final String commentsNum;
  final Function onTapLike;
  final Function onTapSave;
  final bool isLiked;
  final bool isSaved;

  const PostTail({
    Key key,
    @required this.likesNum,
    @required this.commentsNum,
    this.onTapLike,
    this.isLiked,
    this.isSaved,
    this.onTapSave,
  }) : super(key: key);

  @override
  State<PostTail> createState() => _PostTailState();
}

class _PostTailState extends State<PostTail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ReactionIcon(
            isLiked: widget.isLiked,
            likedIcon: Icon(
              Icons.favorite_rounded,
              color: Colors.red,
              size: 25,
            ),
            unLikedIcon: Icon(
              Icons.favorite_outline_rounded,
              size: 25,
            ),
            text: widget.likesNum,
            onTap: widget.onTapLike,
          ),
          ReactionIcon(
            likedIcon: Icon(Icons.comment_rounded, size: 25),
            unLikedIcon: Icon(Icons.comment_rounded, size: 25),
            text: widget.commentsNum,
          ),
          ReactionIcon(
            isLiked: widget.isSaved,
            likedIcon: Icon(Icons.star_rounded,
                color: MyColors.primaryColor, size: 30),
            unLikedIcon: Icon(Icons.star_border_rounded, size: 30),
            text: "saved",
            toggleText: "save ",
            withToggleText: true,
            onTap: widget.onTapSave,
          ),
        ],
      ),
    );
  }
}
