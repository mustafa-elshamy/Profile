import 'package:flutter/material.dart';
import 'package:profile/bloc/profile_bloc/profile_bloc.dart';
import 'package:profile/views/light_profile/side_menu/side_menu_card.dart';
import 'package:provider/src/provider.dart';

class SettingsBuilder extends StatelessWidget {
  const SettingsBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: context.read<ProfileBloc>().showSettings,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data) {
            return Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                children: [
                  SideMenuCard(
                    icon: Icons.lock_rounded,
                    text: "Edit password",
                    iconSize: 35,
                  ),
                  SideMenuCard(
                    icon: Icons.language_rounded,
                    text: "Language",
                    iconSize: 35,
                  ),
                  SideMenuCard(
                    icon: Icons.dark_mode,
                    text: "Dark mode",
                    iconSize: 35,
                    withSwitch: true,
                  ),
                ],
              ),
            );
          }
          return Container();
        });
  }
}
