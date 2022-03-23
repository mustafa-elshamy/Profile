import 'package:flutter/material.dart';
import 'package:profile/bloc/home_bloc/home_bloc.dart';
import 'package:provider/src/provider.dart';

class CreatePostTextField extends StatefulWidget {
  const CreatePostTextField({
    Key key,
  }) : super(key: key);

  @override
  State<CreatePostTextField> createState() => _CreatePostTextFieldState();
}

class _CreatePostTextFieldState extends State<CreatePostTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: TextField(
        cursorColor: Colors.white60,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        decoration: const InputDecoration(
          hintText: "Write a post",
          hintStyle: TextStyle(color: Colors.white38, fontSize: 20),
          border: InputBorder.none,
        ),
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        onChanged: (String value) =>
            context.read<HomeBloc>().changePostStatus = value.replaceAll('\n', '').isNotEmpty,
      ),
    );
  }
}
