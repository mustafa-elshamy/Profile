import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:profile/bloc/home_bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:profile/constants/colors.dart';
import 'package:profile/views/light_profile/cover/profile_circle_icon.dart';
import 'package:profile/views/light_profile/create_post/create_post_page.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * .1;

    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () {
          context.read<HomeBloc>().createPostStatus = true;
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.bottomToTop,
              child: CreatePostPage(),
              duration: const Duration(milliseconds: 500),
            ),
          );
        },
        child: Container(
          // width: width,
          height: height,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Row(
            children: [
              ProfileCircleIcon(radius: 20, elevation: 0),
              SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                        hintText: "Write a post",
                        hintStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: MyColors.primaryColor,
                            width: 1.5,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15)),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Image.asset(
                "assets/images/image_gallery.png",
                color: MyColors.primaryColor,
                height: 35,
                width: 35,
              )
            ],
          ),
        ),
      ),
    );
  }
}
