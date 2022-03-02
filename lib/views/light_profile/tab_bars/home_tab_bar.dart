import 'package:flutter/material.dart';
import 'package:profile/bloc/profile_bloc/profile_bloc.dart';
import 'package:profile/views/light_profile/menu_icon/menu_icon.dart';
import 'package:provider/src/provider.dart';

import 'cv_tab_bar.dart';

class HomeTabBar extends StatefulWidget {
  final List<String> tabsText;
  final List<Widget> tabsWidgets;

  const HomeTabBar({
    Key key,
    @required this.tabsText,
    @required this.tabsWidgets,
  }) : super(key: key);

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabsText.length, vsync: this);
    _tabController.addListener(tabControllerListener);
    _tabController.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            CVTabBar(tabController: _tabController, tabs: widget.tabsText),
            SizedBox(
              height: 1000,
              child: TabBarView(
                controller: _tabController,
                children: widget.tabsWidgets,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void tabControllerListener() {
    context.read<ProfileBloc>().updateSelectedCvSection =
        widget.tabsText[_tabController.index];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
