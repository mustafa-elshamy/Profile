import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:profile/bloc/home_bloc/home_bloc.dart';
import 'package:profile/constants/colors.dart';
import 'package:profile/views/light_profile/cover/profile_circle_icon.dart';
import 'package:profile/views/light_profile/create_post/create_post_header.dart';
import 'package:profile/views/light_profile/create_post/create_post_text_field.dart';
import 'package:profile/views/light_profile/profile_home/post_header.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  var blocProvider;

  @override
  Widget build(BuildContext context) {
    blocProvider = context.read<HomeBloc>();
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * .5),
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.delta.direction == pi / 2 &&
              details.delta.distance > 10) {
            Navigator.pop(context);
          }
        },
        child: Material(
          elevation: 5,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: MyColors.primaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                CreatePostHeader(username: "Username"),
                CreatePostTextField()
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    blocProvider.createPostStatus = false;
    super.dispose();
  }
}
