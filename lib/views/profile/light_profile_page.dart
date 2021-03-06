import 'package:profile/views/profile/create_post/create_post_card.dart';
import 'package:profile/views/profile/cv_page/cv_page.dart';
import 'package:profile/views/profile/photos_section/photos_section.dart';
import 'package:profile/views/profile/tab_bars/ads_tab_bar_view.dart';
import 'package:profile/views/profile/tab_bars/home_tab_bar_view.dart';
import 'package:provider/src/provider.dart';

import 'package:flutter/material.dart';
import 'package:profile/bloc/profile_bloc/profile_bloc.dart';
import 'package:profile/views/profile/profile_home/profile_home_page.dart';
import 'package:profile/views/profile/info_section/info_section.dart';
import 'package:profile/views/profile/cover/cover_photo.dart';
import 'profile_home/post_body/post_image.dart';

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
        padding: EdgeInsets.symmetric(vertical: 10),
        children: [
          StreamBuilder<double>(
              stream: context.read<ProfileBloc>().appBarWidth,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data > .95) {
                  return Container(
                      padding: EdgeInsets.only(top: 0, bottom: 20),
                      child: InfoSection());
                }
                return Container();
              }),
          PhotosSection(
            images: [
              for (int i = 0; i < 4; i++)
                PostImage(
                  image:
                      "https://cdn.vox-cdn.com/thumbor/iKqbD98GVm9t-VgiKdSjA2oHomE=/0x0:2439x1625/920x613/filters:focal(1025x618:1415x1008):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/69123675/5.0.png",
                ),
            ],
          ),
          // SizedBox(height: 10),
          // CreatePost(),
          // SizedBox(height: 10),
          // StoryGrid(),
          const SizedBox(height: 10),
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
                            ProfileHomePage(horizontalPadding: 10),
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
                          ProfileHomePage(horizontalPadding: 10),
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
