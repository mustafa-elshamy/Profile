import 'package:flutter/material.dart';
import 'package:profile/views/light_profile/cover/profile_circle_icon.dart';

class ReactionAvatars extends StatelessWidget {
  const ReactionAvatars({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 8;
    return SizedBox(
      width: width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: ProfileCircleIcon(
              elevation: 0,
              radius: 10,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ProfileCircleIcon(
              elevation: 0,
              radius: 10,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ProfileCircleIcon(
              elevation: 0,
              radius: 10,
            ),
          ),
        ],
      ),
    );
  }
}
