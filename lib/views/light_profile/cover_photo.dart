import 'dart:math';

import 'package:flutter/material.dart';
import 'package:profile/constants/colors.dart';
import 'package:profile/views/light_profile/info_section.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

class CoverDelegate extends StatefulWidget {
  const CoverDelegate({Key key}) : super(key: key);

  @override
  _CoverDelegateState createState() => _CoverDelegateState();
}

class _CoverDelegateState extends State<CoverDelegate> {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: FlexibleHeaderDelegate(
          expandedHeight: MediaQuery.of(context).size.height / 4,
          collapsedHeight: MediaQuery.of(context).size.height / 9,
          background: MutableBackground(
            expandedWidget: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                    child: Image.network(
                      "http://cdn26.us1.fansshare.com/photo/facebookwallpaper/beautiful-nature-cover-photos-for-facebook-timeline-facebook-wallpaper-1672643358.jpg",
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                Positioned(
                  top: MediaQuery.of(context).size.height / 6.5,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 7,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1628563694622-5a76957fd09c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.height / 7,
                          ),
                        ),
                      ),
                      InfoSection()
                    ],
                  ),
                ),
              ],
            ),
            collapsedWidget: Container(
              padding: EdgeInsets.only(top: 20, left: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: MyColors.primaryColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1628563694622-5a76957fd09c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Username",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          collapsedElevation: 0),
      pinned: true,
    );
  }
}
