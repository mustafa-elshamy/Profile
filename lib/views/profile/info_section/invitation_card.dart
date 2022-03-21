import 'package:flutter/material.dart';
import 'package:profile/constants/colors.dart';

class InvitationCard extends StatelessWidget {
  final String invitationCode;

  const InvitationCard({
    Key key,
    @required this.invitationCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        decoration: BoxDecoration(
            border: Border.all(color: MyColors.primaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        child: Center(
          child: RichText(
            text: TextSpan(
                text: "Your code: ",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
                children: <TextSpan>[
                  TextSpan(
                    text: invitationCode,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ]),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}
