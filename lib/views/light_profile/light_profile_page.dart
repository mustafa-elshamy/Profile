import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:profile/views/light_profile/cover_photo.dart';
import 'package:profile/views/light_profile/info_section.dart';

class LightProfile extends StatefulWidget {
  const LightProfile({Key key}) : super(key: key);

  @override
  _LightProfileState createState() => _LightProfileState();
}

class _LightProfileState extends State<LightProfile> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        CoverDelegate(),
        SliverToBoxAdapter(
          child: Stack(children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 1000,
                  ),
                ],
              ),
            ),
          ]),
        )
      ],
    );
  }
}
