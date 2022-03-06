import 'package:flutter/material.dart';
import 'package:profile/bloc/profile_bloc/profile_bloc.dart';
import 'package:provider/src/provider.dart';

import 'cv_tab_bar.dart';

class TestTabBarView extends StatefulWidget {
  final List<String> tabsText;
  final List<Widget> tabsWidgets;

  const TestTabBarView({
    Key key,
    @required this.tabsText,
    @required this.tabsWidgets,
  }) : super(key: key);

  @override
  State<TestTabBarView> createState() => _HomeTabBarViewState();
}

class _HomeTabBarViewState extends State<TestTabBarView>
    with TickerProviderStateMixin {
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
    return Column(
      children: [
        CVTabBar(tabController: _tabController, tabs: widget.tabsText),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) =>
              SlideTransition(
            child: child,
          ),
        ),
        TabBarView(
          controller: _tabController,
          children: widget.tabsWidgets,
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
