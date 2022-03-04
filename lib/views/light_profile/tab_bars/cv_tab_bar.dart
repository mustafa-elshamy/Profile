import 'package:flutter/material.dart';
import 'package:profile/bloc/profile_bloc/profile_bloc.dart';
import 'package:profile/constants/colors.dart';
import 'package:provider/src/provider.dart';

class CVTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String> tabs;

  const CVTabBar({Key key, this.tabController, this.tabs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: DefaultTabController(
        length: tabs.length,
        child: TabBar(
          isScrollable: true,
          controller: tabController,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MyColors.primaryColor),
          tabs: [for (String tabText in tabs) tab(tabText)],
          onTap: (index) {
            tabController.index = index;
          },
        ),
      ),
    );
  }
}

Widget tab(String text) => SizedBox(
      height: 25,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
