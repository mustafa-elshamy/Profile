import 'package:flutter/material.dart';
import 'package:profile/views/light_profile/home/like_post_animation.dart';

class PostImage extends StatefulWidget {
  final String image;
  final double width;
  final double height;
  final bool withLikeAnimation;
  final Function onTap;

  const PostImage({
    Key key,
    this.image,
    this.width,
    this.height,
    this.withLikeAnimation = false,
    this.onTap,
  }) : super(key: key);

  @override
  State<PostImage> createState() => _PostImageState();
}

class _PostImageState extends State<PostImage> {
  bool isLikeAnimating = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: widget.withLikeAnimation
          ? () => setState(() {
                isLikeAnimating = true;
                widget.onTap(isAnimation: true);
              })
          : () {},
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: widget.height,
            width: widget.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.image,
                height: widget.height,
                width: widget.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          widget.withLikeAnimation
              ? Opacity(
                  opacity: isLikeAnimating ? 1 : 0,
                  child: LikePostAnimation(
                    isAnimating: isLikeAnimating,
                    onEnd: () => setState(() => isLikeAnimating = false),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
