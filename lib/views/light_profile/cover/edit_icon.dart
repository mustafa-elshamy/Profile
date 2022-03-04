import 'package:flutter/material.dart';
import 'package:profile/constants/colors.dart';

class EditIcon extends StatelessWidget {
  final Function onTap;

  const EditIcon({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: onTap,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Icon(
                  Icons.edit_rounded,
                  color: MyColors.primaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
