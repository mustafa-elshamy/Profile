import 'package:flutter/material.dart';
import 'package:profile/bloc/profile_bloc/profile_bloc.dart';
import 'package:profile/constants/colors.dart';
import 'package:profile/views/light_profile/cover/edit_icon.dart';
import 'package:profile/views/light_profile/menu_icon/menu_icon.dart';
import 'package:profile/views/light_profile/widgets/custom_text.dart';
import 'package:profile/views/light_profile/widgets/number_info.dart';
import 'package:profile/views/light_profile/widgets/custom_icon.dart';
import 'package:provider/src/provider.dart';

class InfoSection extends StatefulWidget {
  const InfoSection({Key key}) : super(key: key);

  @override
  _InfoSectionState createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: Column(
        children: [
          EditIcon(onTap: (){},),
          CustomText(
            text: "Username",
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8,
          ),
          CustomText(
            text: "Username@gmail.com",
            textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black54),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          // SizedBox(height: 8),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     CustomIcon(
          //       image: "assets/images/invitation.png",
          //       size: 40,
          //       color: MyColors.primaryColor,
          //     ),
          //     CustomIcon(
          //       image: "assets/images/map.png",
          //       size: 40,
          //       imageContainerDifference: 17,
          //       color: MyColors.primaryColor,
          //     ),
          //     CustomIcon(
          //       size: 40,
          //       icon: Icons.settings_rounded,
          //       color: MyColors.primaryColor,
          //     )
          //   ],
          // ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StreamBuilder<bool>(
                  stream: context.read<ProfileBloc>().showAds,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return NumberInfo(
                        isSelected: snapshot.data,
                        info: "Ads",
                        number: "100",
                        onTap: () {
                          context.read<ProfileBloc>().toggleShowAds();
                        },
                      );
                    }
                    return Container();
                  }),
              NumberInfo(
                info: "Followers",
                number: "200",
              ),
              NumberInfo(
                info: "Following",
                number: "300",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
