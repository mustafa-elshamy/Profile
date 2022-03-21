import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import 'package:profile/bloc/home_bloc/home_bloc.dart';
import 'package:profile/constants/colors.dart';
import 'package:profile/helpers/helper.dart';
import 'package:profile/views/profile/create_post/create_post_header.dart';
import 'package:profile/views/profile/create_post/create_post_text_field.dart';
import 'package:profile/views/profile/create_post/media/choose_media_menu.dart';
import 'package:profile/views/profile/create_post/media/media_section.dart';
import 'package:profile/views/profile/create_post/media/pick_media.dart';
import 'package:profile/views/profile/widgets/custom_grid_view.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  var blocProvider;
  List media = [];

  @override
  Widget build(BuildContext context) {
    blocProvider = context.read<HomeBloc>();
    return GestureDetector(
      onTapDown: (details) {
        if (details.globalPosition.dy <
            MediaQuery.of(context).size.width * .45) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * .5),
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.delta.direction == pi / 2 &&
                  details.delta.distance > 10) {
                Navigator.pop(context);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: MyColors.primaryColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  CreatePostHeader(username: "Username"),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        CreatePostTextField(),
                        media.isEmpty ? SizedBox(height: 40) : Container(),
                        MediaSection(setMedia: setMedia),
                        SizedBox(height: 50)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: ChooseMediaMenu(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  void setMedia(media) {
    setState(() {
      this.media = media;
    });
  }

  @override
  void dispose() {
    blocProvider.createPostStatus = false;
    blocProvider.changePostStatus = false;
    super.dispose();
  }
}
