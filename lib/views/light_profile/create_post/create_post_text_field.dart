import 'package:flutter/material.dart';
import 'package:profile/bloc/home_bloc/home_bloc.dart';
import 'package:provider/src/provider.dart';

class CreatePostTextField extends StatelessWidget {
  const CreatePostTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: TextField(
        cursorColor: Colors.white60,
        maxLines: 10,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: "Write a post",
          hintStyle: TextStyle(color: Colors.white38, fontSize: 20),
          border: InputBorder.none,
        ),
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        onChanged: (value) =>
            context.read<HomeBloc>().changePostStatus = value.isNotEmpty,
      ),
    );
  }
}
