import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:profile/bloc/home_bloc/home_bloc.dart';
import 'package:profile/helpers/helper.dart';
import 'package:profile/views/profile/create_post/media/pick_media.dart';

class ChooseMediaMenu extends StatelessWidget {
  const ChooseMediaMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PickMedia(
          text: "Photo",
          icon: Icons.image_rounded,
          onTap: () {
            Helper.pickImages().then((value) {
              context.read<HomeBloc>().modifyMedia = value ?? [];
            });
          },
        ),
        PickMedia(
          text: "Video",
          icon: Icons.video_library_rounded,
          onTap: () {
            Helper.pickVideo().then((value) {
              context.read<HomeBloc>().modifyMedia = value ?? [];
            });
          },
        ),
      ],
    );
  }
}
