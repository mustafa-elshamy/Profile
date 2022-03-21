import 'package:flutter/material.dart';
import 'package:profile/views/profile/profile_home/post_body/post_body.dart';
import 'package:profile/views/profile/profile_home/post_header.dart';
import 'package:profile/views/profile/profile_home/post_tail/post_tail.dart';
import 'package:profile/views/profile/profile_home/post_tail/reaction_avatars.dart';
import 'package:page_transition/page_transition.dart';
import 'package:profile/views/profile/post_page/post_page.dart';

class Post extends StatefulWidget {
  final String text;
  final List<String> images;
  List<String> heroTags;
  String likesNumber;
  final String commentsNumber;
  final bool isClickable;
  final bool withHeader;
  final double verticalMargin;

  Post({
    Key key,
    this.text,
    this.images,
    @required this.likesNumber,
    @required this.commentsNumber,
    this.isClickable = true,
    this.withHeader = true,
    this.verticalMargin = 8,
    this.heroTags,
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
      padding: EdgeInsets.symmetric(vertical: widget.verticalMargin),
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
              widget.withHeader ? PostHeader() : Container(),
              PostBody(
                text: widget.text,
                images: widget.images,
                heroTags: widget.heroTags,
                onDoubleTap: likePost,
                onTap: widget.isClickable
                    ? () {
                        Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: PostPage(
                                text: widget.text,
                                images: widget.images,
                                heroTags: widget.heroTags,
                              ),
                              duration: const Duration(milliseconds: 500),
                            ));
                      }
                    : () {},
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
