import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/constants/colors.dart';
import 'package:profile/views/profile/cover/edit_icon.dart';
import 'package:profile/views/profile/widgets/custom_text.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 110,
        padding: EdgeInsets.only(top: 20, right: 10, left: 15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: MyColors.primaryColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Home",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            Spacer(),
            CircleIcon(icon: Icons.search_rounded),
            SizedBox(width: 10),
            CircleIcon(icon: Icons.notifications_rounded),
          ],
        ),
      ),
    );
  }
}
