import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/bloc/home_bloc/home_bloc.dart';
import 'package:profile/views/profile/home_page/app_bar.dart';
import 'package:profile/views/profile/profile_home/profile_home_page.dart';
import 'package:provider/src/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Stack(
          children: [
            Scaffold(
              body: CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    pinned: true,
                    elevation: 0,
                    collapsedHeight: 80,
                    expandedHeight: 80,
                    backgroundColor: Colors.white,
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                    flexibleSpace: CustomAppBar(),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        ProfileHomePage(horizontalPadding: 5),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Builder(
              builder: (context) {
                return StreamBuilder<bool>(
                  stream: context.read<HomeBloc>().showCreatePost,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                        child: Container(
                          color: Colors.white.withOpacity(0.1),
                        ),
                      );
                    }
                    return Container();
                  },
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
