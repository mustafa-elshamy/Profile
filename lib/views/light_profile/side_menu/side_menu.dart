import 'package:flutter/material.dart';
import 'package:profile/bloc/profile_bloc/profile_bloc.dart';
import 'package:profile/constants/colors.dart';
import 'package:profile/views/light_profile/info_section/invitation_card.dart';
import 'package:profile/views/light_profile/cover/profile_circle_icon.dart';
import 'package:profile/views/light_profile/side_menu/settings_builder.dart';
import 'package:profile/views/light_profile/side_menu/side_menu_card.dart';
import 'package:profile/views/light_profile/widgets/custom_text.dart';
import 'package:provider/src/provider.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key key}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  bool settingsSelected = false;

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().updateShowSettings = false;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 500,
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Container(
          decoration: BoxDecoration(
              color: MyColors.darkPrimaryColor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: ListView(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            children: [
              Material(
                elevation: 5,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProfileCircleIcon(
                            radius: MediaQuery.of(context).size.height * .08,
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      const CustomText(
                        text: "Username",
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const InvitationCard(invitationCode: "invitation code")
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              SideMenuCard(
                text: "My Addresses",
                image: "assets/images/map.png",
                iconSize: 35,
                imageContainerDifference: 15,
              ),
              SideMenuCard(
                text: "Invite your friends",
                image: "assets/images/invitation.png",
                iconSize: 35,
              ),
              SideMenuCard(
                text: "Settings",
                icon: Icons.settings_rounded,
                iconSize: 35,
                // onTap: () {
                //   context.read<ProfileBloc>().toggleShowSettings();
                //   setState(() => settingsSelected = !settingsSelected);
                // },
                // isCardSelected: settingsSelected,
              ),
              // SettingsBuilder(),
              SideMenuCard(
                text: "Edit Password",
                icon: Icons.lock_rounded,
                iconSize: 35,
              ),
              SideMenuCard(
                text: "Calculate your installment",
                icon: Icons.calculate_rounded,
                iconSize: 35,
              ),
              SideMenuCard(
                text: "Logout",
                icon: Icons.logout_rounded,
                iconSize: 35,
                iconColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
