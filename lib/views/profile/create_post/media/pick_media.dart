import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:profile/bloc/home_bloc/home_bloc.dart';

import 'package:profile/constants/colors.dart';
import 'package:profile/helpers/helper.dart';
import 'package:provider/src/provider.dart';

import 'choose_media_menu.dart';

class PickMedia extends StatelessWidget {
  final Function onTap;
  final String text;
  final double verticalPadding;
  final IconData icon;

  const PickMedia({
    Key key,
    this.onTap,
    this.text,
    this.verticalPadding = 0,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width / 2 - 20,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: MyColors.primaryColor, size: 30),
              const SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                    color: MyColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
