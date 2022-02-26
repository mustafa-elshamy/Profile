import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:profile/bloc/profile_bloc/profile_bloc.dart';
import 'package:profile/views/light_profile/cover_photo.dart';
import 'package:profile/views/light_profile/cv_tab_bar.dart';
import 'package:profile/views/light_profile/experience/experience_page.dart';
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
  final List<String> _tabs = ["About", "Skills", "Experience"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
                if (snapshot.hasData) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: snapshot.data < 0.95 ? 10 : snapshot.data * 287),
                    child: Material(
                      elevation: 20,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/bg_white.png"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            CVTabBar(
                                tabController: _tabController, tabs: _tabs),
                            SizedBox(
                              height: 1000,
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  Center(
                                    child: Text("2"),
                                  ),
                                  SkillsPage(),
                                  ExperiencePage(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return Container();
              }),
        )
      ],
    );
  }

  void tabControllerListener() {
    context.read<ProfileBloc>().updateSelectedCvSection =
        _tabs[_tabController.index];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
