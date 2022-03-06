import 'package:profile/views/light_profile/cv_page/cv_page.dart';
import 'package:profile/views/light_profile/tab_bars/ads_tab_bar_view.dart';
import 'package:profile/views/light_profile/tab_bars/home_tab_bar_view.dart';
import 'package:provider/src/provider.dart';

import 'package:flutter/material.dart';
import 'package:profile/bloc/profile_bloc/profile_bloc.dart';
import 'package:profile/views/light_profile/about_me/about_page.dart';
import 'package:profile/views/light_profile/experience/experience_page.dart';
import 'package:profile/views/light_profile/home/home_page.dart';
import 'package:profile/views/light_profile/info_section/info_section.dart';
import 'package:profile/views/light_profile/cover/cover_photo.dart';
import 'package:profile/views/light_profile/skills/skills_page.dart';

class LightProfile extends StatefulWidget {
  const LightProfile({Key key}) : super(key: key);

  @override
  _LightProfileState createState() => _LightProfileState();
}

class _LightProfileState extends State<LightProfile>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverPersistentHeader(
            pinned: true,
            delegate: CoverPhoto(
                coverMaxExtent: MediaQuery.of(context).size.height / 4,
                coverMinExtent: MediaQuery.of(context).size.height / 9),
          )
        ];
      },
      body: ListView(
        shrinkWrap: true,
        children: [
          StreamBuilder<double>(
              stream: context.read<ProfileBloc>().appBarWidth,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data > .95) {
                  return Container(
                      padding: EdgeInsets.only(
                          top: 0,
                          bottom: 20),
                      child: InfoSection());
                }
                return const SizedBox(height: 0);
              }),
          Material(
            elevation: 20,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg_white.png"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: StreamBuilder<bool>(
                  stream: context.read<ProfileBloc>().showAds,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data) {
                        return const AdsTabBarView(
                          tabsText: [
                            "Home",
                            "Current",
                            "Pending",
                            "Suspended",
                            "Finished"
                          ],
                          tabsWidgets: [
                            HomePage(),
                            Text("1"),
                            Text("2"),
                            Text("3"),
                            Text("4"),
                          ],
                        );
                      }
                      return const HomeTabBarView(
                        tabsText: [
                          "Home",
                          "CV",
                        ],
                        tabsWidgets: [
                          HomePage(),
                          CVPage(),
                        ],
                      );
                    }
                    return Container();
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
