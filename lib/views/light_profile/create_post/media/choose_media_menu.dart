import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:profile/bloc/home_bloc/home_bloc.dart';
import 'package:profile/helpers/helper.dart';
import 'package:profile/views/light_profile/create_post/media/pick_media.dart';

class ChooseMediaMenu extends StatelessWidget {
  const ChooseMediaMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .85),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PickMedia(
            text: "Photo",
            onTap: () {
              Helper.pickImages().then((value) {
                context.read<HomeBloc>().modifyMedia = value;
                Navigator.pop(context);
              });
            },
          ),
          PickMedia(
            text: "Video",
            onTap: (){
              Helper.pickVideo().then((value) {
                context.read<HomeBloc>().modifyMedia = value;
                Navigator.pop(context);
              });
            },
          ),
        ],
      ),
    );
  }
}
