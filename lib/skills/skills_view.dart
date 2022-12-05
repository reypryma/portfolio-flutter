import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:portfolio_flutter_web/components/desktop_view_builder.dart';
import 'package:portfolio_flutter_web/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_flutter_web/components/mobile_view_builder.dart';
import 'package:portfolio_flutter_web/skills/outline_skills_container.dart';
import 'package:portfolio_flutter_web/skills/sample.dart';

import '../config.dart';
import '../utils/colour_assets.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({
    required Key key,
  }) : super(key: key);
  static const title = 'Skills';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MobileDesktopViewBuilder(
      desktopView: SkillsDesktopView(),
      mobileView: SkillsMobileView(),
      showMobile: width < 790,
    );
  }
}

class SkillsDesktopView extends StatefulWidget {
  const SkillsDesktopView({
    Key? key,
  }) : super(key: key);

  @override
  State<SkillsDesktopView> createState() => _SkillsDesktopViewState();
}

class _SkillsDesktopViewState extends State<SkillsDesktopView> {
  @override
  Widget build(BuildContext context) {
    final skills = abilities;
    return DesktopViewBuilder(
      titleText: SkillsView.title,
      children: List.generate(
          skills.length,
          (index) => AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: Row(

                      )
                    ),
                  ),
                ),
              )),
    );
  }
}

/*        SizedBox(height: 20),
        for (var rowIndex = 0; rowIndex < skills.length / 5; rowIndex++) ...[
          Row(
            children: [
              for (var index = 0; index < skills.length / 2; index++)
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: index != 0 ? 8.0 : 0),
                    child: OutlineSkillsContainer(
                      index: index,
                      rowIndex: rowIndex,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 10),
        ],
        SizedBox(height: 70),*/

class SkillsMobileView extends StatelessWidget {
  const SkillsMobileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      titleText: SkillsView.title,
      children: [
        for (var index = 0; index < skills.length; index++) ...[
          OutlineSkillsContainer(
            index: index,
            rowIndex: 1,
            isMobile: true,
          ),
          SizedBox(height: 10)
        ]
      ],
    );
  }
}

final skills = [
  'Flutter',
  'PHP/Laravel',
  'Firebase',
  'HTML/CSS',
  'Java/Kotlin',
  'C#',
  'Python',
  'Javascript/Node.js',
  'Agile',
  'Scrum',
];

//Some Only Knows because School Projects
List<SkillModel> abilities = [
  SkillModel(name: 'Flutter & Dart'),
  SkillModel(name: 'PHP / Laravel'),
  SkillModel(name: 'Java / Kotlin'),
  SkillModel(name: 'UI / UX'),
  SkillModel(name: 'Figma / Adobe XD'),
  SkillModel(name: 'Video Editing'),
  SkillModel(name: 'C & C#'),
  SkillModel(name: '.NET'),
  SkillModel(name: 'Python'),
  SkillModel(name: 'Javascript'),
  SkillModel(name: 'WHMCS: Cpanel'),
  SkillModel(name: 'HTML / CSS'),
  SkillModel(name: 'React'),
  SkillModel(name: 'Node.js'),
  SkillModel(name: 'DB: MySQL, SQL Server, Oracle'),
  SkillModel(name: 'Agile'),
  SkillModel(name: 'Github'),
  SkillModel(name: 'Jetbrains IDE, VS Code'),
  SkillModel(name: 'English (507)'),
];

class SkillModel {
  String name;
  String? subtitle;
  bool isChecked;
  int? experienced;
  Widget? widget;
  int? experience;
  int? project;
  Color? color;
  Icon? icon;

  SkillModel(
      {required this.name,
      this.subtitle,
      this.isChecked = false,
      this.widget,
      this.experience,
      this.project,
      this.color,
      this.icon,
      this.experienced});
}
