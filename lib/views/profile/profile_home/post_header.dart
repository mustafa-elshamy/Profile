import 'package:flutter/material.dart';
import 'package:profile/views/profile/cover/profile_circle_icon.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileCircleIcon(
          radius: MediaQuery.of(context).size.width * .05,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
            ),
            Text(
              "Time",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                  fontSize: 12),
            ),
          ],
        ),
        Spacer(),
        InkWell(
          onTap: () {},
          child: Icon(Icons.more_vert_rounded, size: 24),
        ),
      ],
    );
  }
}
