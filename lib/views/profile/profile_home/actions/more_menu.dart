import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/constants/colors.dart';

import '../../../../bloc/home_bloc/home_bloc.dart';

class MoreMenu extends StatefulWidget {
  const MoreMenu({
    Key key,
  }) : super(key: key);

  @override
  State<MoreMenu> createState() => _MoreMenuState();
}

class _MoreMenuState extends State<MoreMenu> {
  HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    homeBloc = context.read<HomeBloc>();
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .8),
      child: Material(
        elevation: 10,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        child: GestureDetector(
          onVerticalDragUpdate: (details) {
            if (details.delta.direction == pi / 2) {
              Navigator.pop(context);
            }
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(children: [
              for (int i = 0; i < 3; i++)
                optionItem("Share post", Icons.share_rounded, onTap: () {}),
            ]),
          ),
        ),
      ),
    );
  }

  Widget optionItem(String text, IconData icon, {Function onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: MediaQuery.of(context).size.height * .06 - 5,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Icon(icon, color: MyColors.primaryColor),
                SizedBox(width: 20),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    homeBloc.setPageBlurring = false;
    super.dispose();
  }
}
