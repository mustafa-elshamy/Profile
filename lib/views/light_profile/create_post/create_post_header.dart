import 'package:flutter/material.dart';
import 'package:profile/bloc/home_bloc/home_bloc.dart';
import 'package:profile/constants/colors.dart';
import 'package:profile/views/light_profile/cover/profile_circle_icon.dart';
import 'package:provider/src/provider.dart';

class CreatePostHeader extends StatelessWidget {
  final String username;

  const CreatePostHeader({
    Key key,
    this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileCircleIcon(
          radius: MediaQuery.of(context).size.width * .05,
        ),
        SizedBox(width: 10),
        Text(
          username,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
        ),
        Spacer(),
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(5),
          child: StreamBuilder<bool>(
              stream: context.read<HomeBloc>().postStatus,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: snapshot.data ? Colors.white : Colors.black26,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Post",
                      style: TextStyle(
                        color: snapshot.data
                            ? MyColors.primaryColor
                            : Colors.black38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
                return Container();
              }),
        )
      ],
    );
  }
}
