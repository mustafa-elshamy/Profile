import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:profile/views/profile/cover/profile_circle_icon.dart';
import 'package:profile/views/profile/profile_home/actions/more_menu.dart';

import '../../../bloc/home_bloc/home_bloc.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileCircleIcon(
          radius: MediaQuery.of(context).size.width * .05,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
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
        const Spacer(),
        InkWell(
          onTap: () {
            context.read<HomeBloc>().setPageBlurring = true;
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.bottomToTop,
                child: MoreMenu(),
              ),
            );
          },
          child: const Icon(Icons.more_vert_rounded, size: 24),
        ),
      ],
    );
  }
}
