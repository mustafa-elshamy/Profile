import 'package:flutter/material.dart';
import 'package:profile/constants/colors.dart';
import 'package:profile/views/light_profile/stories/animated_bar_item.dart';

class AnimatedBar extends StatelessWidget {
  final AnimationController animController;
  final int position;
  final int currentIndex;

  const AnimatedBar({
    Key key,
    this.animController,
    this.position,
    this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                AnimatedBarItem(
                  width: double.infinity,
                  color: position < currentIndex
                      ? MyColors.darkPrimaryColor
                      : MyColors.primaryColor.withOpacity(0.5),
                ),
                position == currentIndex
                    ? AnimatedBuilder(
                        animation: animController,
                        builder: (context, child) {
                          return AnimatedBarItem(
                            width: constraints.maxWidth * animController.value,
                            color: MyColors.darkPrimaryColor,
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }
}
