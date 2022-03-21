import 'package:flutter/material.dart';
import 'package:profile/bloc/profile_bloc/profile_bloc.dart';
import 'package:page_transition/page_transition.dart';

import 'package:profile/constants/colors.dart';
import 'package:profile/views/profile/cover/edit_icon.dart';
import 'package:profile/views/profile/home_page/home_page.dart';
import 'package:profile/views/profile/info_section/coins_icon.dart';
import 'package:profile/views/profile/info_section/info_tail.dart';
import 'package:profile/views/profile/info_section/invitation_card.dart';
import 'package:profile/views/profile/widgets/custom_text.dart';
import 'package:profile/views/profile/widgets/number_info.dart';
import 'package:provider/src/provider.dart';

class InfoSection extends StatefulWidget {
  const InfoSection({Key key}) : super(key: key);

  @override
  _InfoSectionState createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CoinsIcon(coins: 1000),
            Spacer(),
            CircleIcon(
              icon: Icons.edit_rounded,
              onTap: () {},
            ),
            SizedBox(width: 10)
          ],
        ),
        CustomText(
          text: "Username",
          textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 8,
        ),
        InvitationCard(invitationCode: "invitation code"),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StreamBuilder<bool>(
                stream: context.read<ProfileBloc>().showAds,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return NumberInfo(
                      isSelected: snapshot.data,
                      info: "Ads",
                      number: "100",
                      onTap: () {
                        context.read<ProfileBloc>().toggleShowAds();
                      },
                    );
                  }
                  return Container();
                }),
            NumberInfo(
              info: "Favourites",
              number: "200",
            ),
            NumberInfo(
              info: "Notifications",
              number: "300",
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InfoTail(
              text: "Add story",
              icon: Icons.add_circle,
              iconColor: Colors.white,
              textColor: Colors.white,
              backgroundColor: MyColors.primaryColor,
            ),
            InfoTail(
              text: "Edit profile",
              icon: Icons.mode_edit_outline_rounded,
              iconColor: MyColors.primaryColor,
              textColor: MyColors.primaryColor,
            ),
            InfoTail(
              text: "Settings",
              icon: Icons.settings_rounded,
              iconColor: MyColors.primaryColor,
              textColor: MyColors.primaryColor,
            ),
          ],
        )
      ],
    );
  }
}
