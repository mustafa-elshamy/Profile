import 'package:flutter/material.dart';
import 'package:profile/bloc/profile_bloc/profile_bloc.dart';
import 'package:profile/constants/colors.dart';
import 'package:provider/src/provider.dart';

class CVTabBar extends StatefulWidget {
  final TabController tabController;
  final List<String> tabs;

  const CVTabBar({Key key, this.tabController, this.tabs}) : super(key: key);

  @override
  _CVTabBarState createState() => _CVTabBarState();
}

class _CVTabBarState extends State<CVTabBar> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: TabBar(
        isScrollable: true,
        controller: widget.tabController,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MyColors.primaryColor),
        tabs: [for (String tabText in widget.tabs) tab(tabText)],
        onTap: (index) {
          widget.tabController.index = index;
        },
      ),
    );
  }

}

Widget tab(String text) => SizedBox(
      height: 25,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
