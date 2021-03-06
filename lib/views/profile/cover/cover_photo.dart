import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:profile/bloc/profile_bloc/profile_bloc.dart';
import 'package:profile/constants/colors.dart';
import 'package:profile/views/profile/cover/edit_icon.dart';
import 'package:profile/views/profile/cover/profile_circle_icon.dart';
import 'package:profile/views/profile/widgets/custom_icon.dart';
import 'package:provider/src/provider.dart';

class CoverPhoto implements SliverPersistentHeaderDelegate {
  final double coverMinExtent;
  final double coverMaxExtent;

  CoverPhoto({@required this.coverMinExtent, @required this.coverMaxExtent});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    context.read<ProfileBloc>().updateAppBarWidth =
        1 - (shrinkOffset / coverMaxExtent);
    if (shrinkOffset / coverMaxExtent > 0.76) {
      context.read<ProfileBloc>().updateCvTitle = true;
    } else {
      context.read<ProfileBloc>().updateCvTitle = false;
    }

    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
            child: Image.network(
              "http://cdn26.us1.fansshare.com/photo/facebookwallpaper/beautiful-nature-cover-photos-for-facebook-timeline-facebook-wallpaper-1672643358.jpg",
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        Container(
            decoration: BoxDecoration.lerp(
                BoxDecoration(color: Colors.transparent),
                BoxDecoration(
                    color: MyColors.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                shrinkOffset / coverMaxExtent)),

        InkWell(
          onTap: (){
            print("photo");
          },
          child: Visibility(
            visible: shrinkOffset < coverMaxExtent / 20,
            child: TranslationAnimatedWidget(
              enabled: shrinkOffset < coverMaxExtent / 20,
              values: [
                Offset(
                    0,
                    MediaQuery.of(context).size.height / 6.5 -
                        30), // disabled value value
                Offset(
                    0,
                    MediaQuery.of(context).size.height / 6.5 -
                        15), //intermediate value
                Offset(
                    0, MediaQuery.of(context).size.height / 6.5) //enabled value
              ],
              child: Column(
                children: [
                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      height: MediaQuery.of(context).size.height / 7,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "https://images.unsplash.com/photo-1628563694622-5a76957fd09c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.height / 7,
                        ),
                      ),
                    ),
                  ),
                  // InfoSection()
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: shrinkOffset > coverMaxExtent / 20,
          child: TranslationAnimatedWidget(
            enabled: shrinkOffset > coverMaxExtent / 20,
            values: [
              Offset(0, 50), // disabled value value
              Offset(0, 25), //intermediate value
              Offset(0, 0) //enabled value
            ],
            duration: Duration(milliseconds: 500),
            curve: Curves.linearToEaseOut,
            child: Container(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileCircleIcon(
                    radius: MediaQuery.of(context).size.height * .03,
                    onTap: () => Scaffold.of(context).openDrawer(),
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      SizedBox(height: 2),
                      StreamBuilder<String>(
                          stream: context.read<ProfileBloc>().selectedCvSection,
                          builder: (context, cvSectionSnapshot) {
                            if (cvSectionSnapshot.hasData) {
                              return StreamBuilder<bool>(
                                  stream:
                                      context.read<ProfileBloc>().showCvTitle,
                                  builder: (context, cvTitleSnapshot) {
                                    if (cvTitleSnapshot.hasData &&
                                        cvTitleSnapshot.data) {
                                      return Text(
                                        cvSectionSnapshot.data,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.white70),
                                      );
                                    }
                                    return Container();
                                  });
                            }
                            return Container();
                          })
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
        // ),
        // Visibility(
        //   visible: shrinkOffset > coverMaxExtent / 20,
        //   child: Container(
        //     padding: EdgeInsets.only(top: 20, left: 20),
        //     child: Row(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         ProfileCircleIcon(
        //           radius: MediaQuery.of(context).size.height * .03,
        //           onTap: () => Scaffold.of(context).openDrawer(),
        //         ),
        //         SizedBox(width: 20),
        //         Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               "Username",
        //               style: TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 18,
        //                   color: Colors.white),
        //             ),
        //             SizedBox(height: 2),
        //             StreamBuilder<String>(
        //                 stream: context.read<ProfileBloc>().selectedCvSection,
        //                 builder: (context, cvSectionSnapshot) {
        //                   if (cvSectionSnapshot.hasData) {
        //                     return StreamBuilder<bool>(
        //                         stream: context.read<ProfileBloc>().showCvTitle,
        //                         builder: (context, cvTitleSnapshot) {
        //                           if (cvTitleSnapshot.hasData &&
        //                               cvTitleSnapshot.data) {
        //                             return Text(
        //                               cvSectionSnapshot.data,
        //                               style: const TextStyle(
        //                                   fontWeight: FontWeight.bold,
        //                                   fontSize: 14,
        //                                   color: Colors.white70),
        //                             );
        //                           }
        //                           return Container();
        //                         });
        //                   }
        //                   return Container();
        //                 })
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // )
      ],
    );
  }

  @override
  double get maxExtent => coverMaxExtent;

  @override
  double get minExtent => coverMinExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  @override
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration =>
      null;

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;

  @override
  TickerProvider get vsync => throw UnimplementedError();
}
