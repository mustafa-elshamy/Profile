import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:profile/constants/colors.dart';

class ReactionIcon extends StatelessWidget {
  final Function onTap;
  final Icon likedIcon;
  final Icon unLikedIcon;
  final String text;
  final String toggleText;
  final bool withToggleText;
  final bool isLiked;

  const ReactionIcon({
    Key key,
    this.onTap,
    this.text,
    this.withToggleText = false,
    @required this.likedIcon,
    @required this.unLikedIcon,
    this.toggleText,
    this.isLiked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      isLiked: isLiked,
      likeCount: withToggleText ? 0 : int.parse(text),
      bubblesColor: BubblesColor(dotPrimaryColor: MyColors.primaryColor),
      circleColor:
          CircleColor(start: MyColors.primaryColor, end: MyColors.primaryColor),
      countBuilder: (int likeCount, bool isLiked, String text) {
        if (withToggleText) {
          return Text(
            isLiked ? this.text : toggleText,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          );
        }
        return Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        );
      },
      likeBuilder: (bool isLiked) {
        return isLiked ? likedIcon : unLikedIcon;
      },
      onTap: onLikeButtonTapped,
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    onTap != null ? onTap() : onTap;
    return !isLiked;
  }
}
