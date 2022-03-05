import 'package:flutter/material.dart';

class LikePost extends StatefulWidget {
  final bool isAnimating;
  final VoidCallback onEnd;

  const LikePost({
    Key key,
    this.isAnimating,
    this.onEnd,
  }) : super(key: key);

  @override
  State<LikePost> createState() => _LikePostState();
}

class _LikePostState extends State<LikePost>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scale;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    scale = Tween<double>(begin: 1, end: 1.3).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,
      child: const Icon(
        Icons.favorite_rounded,
        color: Colors.white,
        size: 50,
      ),
    );
  }

  @override
  void didUpdateWidget(LikePost oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAnimating != oldWidget.isAnimating) animateWidget();
  }

  Future animateWidget() async {
    if (widget.isAnimating) {
      await controller.forward();
      await controller.reverse();
      await Future.delayed(Duration(milliseconds: 100));
      if (widget.onEnd != null) widget.onEnd();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
