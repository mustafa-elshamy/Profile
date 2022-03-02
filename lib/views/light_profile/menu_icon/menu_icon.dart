import 'package:flutter/material.dart';
import 'package:profile/bloc/profile_bloc/profile_bloc.dart';
import 'package:profile/constants/colors.dart';
import 'package:provider/src/provider.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
        stream: context.read<ProfileBloc>().appBarWidth,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Color backgroundColor = snapshot.data > .95
                ? MyColors.darkPrimaryColor
                : MyColors.darkPrimaryColor.withOpacity(0.4);
            return ClipPath(
              clipper: CustomIconShape(),
              child: Material(
                elevation: 50,
                child: InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * .065,
                    height: MediaQuery.of(context).size.height * .13,
                    color: backgroundColor,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          }
          return Container();
        });
  }
}

class CustomIconShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 1, 10);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
