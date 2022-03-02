import 'package:flutter/material.dart';
import 'package:profile/bloc/profile_bloc/profile_bloc.dart';
import 'package:profile/views/light_profile/home/home_page.dart';
import 'package:provider/src/provider.dart';

import 'cv_tab_bar.dart';

class AdsTabBar extends StatefulWidget {
  final List<String> tabsText;
  final List<Widget> tabsWidgets;

  const AdsTabBar({Key key, this.tabsText, this.tabsWidgets}) : super(key: key);

  @override
  State<AdsTabBar> createState() => _AdsTabBarState();
}

class _AdsTabBarState extends State<AdsTabBar> with TickerProviderStateMixin {
  TabController _tabController;
  bool _isFirst = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabsText.length, vsync: this);
    _tabController.addListener(tabControllerListener);
    _tabController.notifyListeners();
    _tabController.animateTo(1, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }

  void tabControllerListener() {
    context.read<ProfileBloc>().updateSelectedCvSection =
        widget.tabsText[_tabController.index];
    if (_tabController.index == 0 && !_isFirst) {
      context.read<ProfileBloc>().updateShowAds = false;
    }
    if (_isFirst) {
      _isFirst = false;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
