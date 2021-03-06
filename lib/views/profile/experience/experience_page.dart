import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/views/profile/experience/experience_card.dart';
import 'package:profile/views/profile/widgets/custom_grid_view.dart';
import 'package:profile/views/profile/widgets/title_text.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({Key key}) : super(key: key);

  @override
  _ExperiencePageState createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  @override
  Widget build(BuildContext context) {
    // return GridView.count(
    //   physics: NeverScrollableScrollPhysics(),
    //   crossAxisCount: 1,
    //   mainAxisSpacing: 20,
    //   childAspectRatio: 4,
    //   padding: EdgeInsets.only(
    //     top: 20,
    //     left: 20,
    //     right: 20,
    //   ),
    //   children: const [
    //     ExperienceCard(
    //       isLast: false,
    //       job: "Art Director",
    //       company: "Pixels LTD",
    //       duration: "Feb 2019 - Preseent",
    //     ),
    //     ExperienceCard(
    //       isLast: false,
    //       job: "Designer",
    //       company: "Fire Media LLC",
    //       duration: "Jul 2018 - Feb 2019",
    //     ),
    //     ExperienceCard(
    //       isLast: true,
    //       job: "UI/UX Designer",
    //       company: "Fire Media LLC",
    //       duration: "Oct 2017 - Jul 2018",
    //     ),
    //
    //   ],
    // );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          text: "Experience",
        ),
        const CustomGridView(
          columnsCount: 1,
          verticalPadding: 10,
          children: [
            ExperienceCard(
              isLast: false,
              job: "Art Director",
              company: "Pixels LTD",
              duration: "Feb 2019 - Preseent",
            ),
            ExperienceCard(
              isLast: false,
              job: "Designer",
              company: "Fire Media LLC",
              duration: "Jul 2018 - Feb 2019",
            ),
            ExperienceCard(
              isLast: true,
              job: "UI/UX Designer",
              company: "Fire Media LLC",
              duration: "Oct 2017 - Jul 2018",
            ),
          ],
        ),
      ],
    );
  }
}
