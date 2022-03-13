import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/bloc/home_bloc/home_bloc.dart';

import 'package:profile/bloc/profile_bloc/profile_bloc.dart';
import 'package:profile/bloc/story_bloc/story_bloc.dart';
import 'package:profile/views/light_profile/home_page/home_page.dart';
import 'package:profile/views/light_profile/light_profile_page.dart';
import 'package:profile/views/light_profile/side_menu/side_menu.dart';

void main() {
  // runApp(const MyApp());
  runApp(const HomePage());
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
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          canvasColor: Colors.transparent,
        ),
        debugShowCheckedModeBanner: false,
        home: Builder(builder: (context) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: LightProfile(),
            drawer: SideMenu(),
            drawerEdgeDragWidth: MediaQuery.of(context).size.width / 10,
          );
        }),
      ),
    );
  }
}
