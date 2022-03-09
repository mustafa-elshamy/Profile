import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/bloc/profile_bloc/profile_bloc.dart';
import 'package:profile/bloc/story_bloc/story_bloc.dart';

import 'package:profile/views/light_profile/light_profile_page.dart';
import 'package:profile/views/light_profile/menu_icon/menu_icon.dart';
import 'package:profile/views/light_profile/side_menu/side_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider(
          create: (context) => StoryBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(canvasColor: Colors.transparent),
        debugShowCheckedModeBanner: false,
        home: Builder(builder: (context) {
          return Scaffold(
            backgroundColor: Colors.white,
            // body: Stack(
            //   children: [
            //     LightProfile(),
            //     Positioned(
            //       top: MediaQuery.of(context).size.height / 4,
            //       child: MenuIcon(),
            //     ),
            //   ],
            // ),
            body: LightProfile(),
            drawer: SideMenu(),
            drawerEdgeDragWidth: MediaQuery.of(context).size.width / 10,
          );
        }),
      ),
    );
  }
}
