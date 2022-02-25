import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'package:profile/views/light_profile/light_profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LightProfile(),
      ),
    );
  }
}
