import 'package:flutter/material.dart';
import 'package:profile/bloc/profile_bloc/profile_bloc.dart';
import 'package:profile/views/light_profile/about_me/about_me_page.dart';
import 'package:profile/views/light_profile/cv_tab_bar.dart';
import 'package:profile/views/light_profile/experience/experience_page.dart';
import 'package:profile/views/light_profile/home/home_page.dart';
import 'package:profile/views/light_profile/info_section.dart';
import 'package:profile/views/light_profile/new_cover_photo.dart';
import 'package:profile/views/light_profile/skills/skills_page.dart';
import 'package:provider/src/provider.dart';

class LightProfile extends StatefulWidget {
  const LightProfile({Key key}) : super(key: key);

  @override
  _LightProfileState createState() => _LightProfileState();
}

class _LightProfileState extends State<LightProfile>
    with TickerProviderStateMixin {
  TabController _tabController;
  final List<String> _homeTabs = [
    "Home",
    "About",
    "Skills",
    "Experience ",
  ];
  final List<String> _adTabs = [
    "Home",
    "Current",
    "Pending",
    "Suspended",
    "Finished"
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _homeTabs.length, vsync: this);
    _tabController.addListener(tabControllerListener);
    _tabController.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: NewCoverPhoto(
              coverMaxExtent: MediaQuery.of(context).size.height / 4,
              coverMinExtent: MediaQuery.of(context).size.height / 9),
        ),
        SliverToBoxAdapter(
          child: StreamBuilder<double>(
              stream: context.read<ProfileBloc>().appBarWidth,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data > .95) {
                  return Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 60,
                          bottom: 20),
                      child: InfoSection());
                }
                return const SizedBox(height: 10);
              }),
        ),
        SliverToBoxAdapter(
          child: Material(
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
                      _tabController.dispose();
                      _tabController = TabController(
                          length:
                              snapshot.data ? _adTabs.length : _homeTabs.length,
                          vsync: this);
                      _tabController.addListener(tabControllerListener);
                      if (snapshot.data) {
                        _tabController.animateTo(1,
                            duration: Duration(milliseconds: 500));
                      }
                      return Column(
                        children: [
                          CVTabBar(
                              tabController: _tabController,
                              tabs: snapshot.data ? _adTabs : _homeTabs),
                          SizedBox(
                            height: 1000,
                            child: TabBarView(
                              controller: _tabController,
                              children: snapshot.data
                                  ? [
                                      HomePage(),
                                      Text("1"),
                                      Text("1"),
                                      Text("1"),
                                      Text("1"),
                                    ]
                                  : [
                                      HomePage(),
                                      AboutMePage(),
                                      SkillsPage(),
                                      ExperiencePage(),
                                    ],
                            ),
                          ),
                        ],
                      );
                    }
                    return Container();
                  }),
            ),
          ),
        )
      ],
    );
  }

  void tabControllerListener() {
    context.read<ProfileBloc>().updateSelectedCvSection =
        _homeTabs[_tabController.index];
    if (_tabController.index == 0) {
      context.read<ProfileBloc>().updateShowAds = false;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
