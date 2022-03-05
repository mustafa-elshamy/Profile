import 'package:flutter/material.dart';
import 'package:profile/bloc/profile_bloc/profile_bloc.dart';
import 'package:profile/constants/colors.dart';
import 'package:profile/views/light_profile/widgets/custom_icon.dart';
import 'package:provider/src/provider.dart';

class SideMenuCard extends StatefulWidget {
  final String text;
  final double elevation;
  final IconData icon;
  final double iconSize;
  final String image;
  final int imageContainerDifference;
  final Color iconColor;
  final Function onTap;
  final bool withSwitch;
  final bool isCardSelected;

  const SideMenuCard(
      {Key key,
      this.text,
      this.elevation = 0,
      this.icon,
      this.iconSize,
      this.image,
      this.imageContainerDifference = 0,
      this.iconColor,
      this.onTap,
      this.withSwitch = false,
      this.isCardSelected = false})
      : super(key: key);

  @override
  _SideMenuCardState createState() => _SideMenuCardState();
}

class _SideMenuCardState extends State<SideMenuCard> {
  bool _switchVal = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Material(
        elevation: widget.elevation,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: widget.onTap,
          child: Material(
            elevation: widget.isCardSelected ? 15 : 0,
            child: AnimatedContainer(
              padding: EdgeInsets.only(right: 10),
              height: MediaQuery.of(context).size.height / 15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: widget.isCardSelected
                    ? Border.all(color: MyColors.primaryColor, width: 3)
                    : Border(),
              ),
              duration: const Duration(milliseconds: 500),
              child: Row(
                children: [
                  CustomIcon(
                    icon: widget.icon,
                    color: widget.iconColor ?? MyColors.primaryColor,
                    size: widget.iconSize,
                    image: widget.image,
                    imageContainerDifference: widget.imageContainerDifference,
                  ),
                  Text(
                    widget.text,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  widget.withSwitch
                      ? Switch.adaptive(
                          value: _switchVal,
                          onChanged: (val) {
                            setState(() {
                              _switchVal = val;
                            });
                          },
                          activeColor: MyColors.primaryColor,
                        )
                      : Icon(
                          widget.isCardSelected
                              ? Icons.keyboard_arrow_down_rounded
                              : Icons.keyboard_arrow_right_rounded,
                          size: 25,
                          color: MyColors.primaryColor,
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
