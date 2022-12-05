import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:portfolio_flutter_web/skills/skills_view.dart';
import 'package:portfolio_flutter_web/utils/colour_assets.dart';

class SkillListCheckWidget extends StatefulWidget {
  const SkillListCheckWidget({Key? key}) : super(key: key);

  @override
  State<SkillListCheckWidget> createState() => _SkillListCheckWidgetState();
}

class _SkillListCheckWidgetState extends State<SkillListCheckWidget> {
  List<SkillModel> skillList = abilities;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }


  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ListView.builder(
          itemCount: skillList.length,
          padding: EdgeInsets.all(8),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: skillList[index].isChecked ? ColorAsset.colorRandomColor().withOpacity(0.6) : gray.withOpacity(0.6)),
                    // backgroundColor: appStore.isDarkModeOn
                    //     ? scaffoldDarkColor
                    //     : data.selectSkill.validate()
                    //     ? js_selectSkillBgColor.withOpacity(0.7)
                    //     : white,
                    backgroundColor: whiteSmoke
                ),
                margin: EdgeInsets.symmetric(vertical: 8),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: skillList[index].isChecked ? Row(
                  children: [
                    Icon(skillList[index].isChecked ? Icons.done : Icons.add, color: ColorAsset.HueRed, size: 16),
                    16.width,
                    Text(skillList[index].name, style: boldTextStyle(color: ColorAsset.HueDark)),
                  ],
                ) : FlipAnimation(
                  flipAxis: FlipAxis.y,
                  duration: 2.seconds,
                  child: Row(
                    children: [
                      Icon(skillList[index].isChecked ? Icons.done : Icons.add, color: ColorAsset.HueRed, size: 16),
                      16.width,
                      Text(skillList[index].name, style: boldTextStyle(color: ColorAsset.HueDark)),
                    ],
                  ),
                ),
              ).onTap(() {
                skillList[index].isChecked = !skillList[index].isChecked;
                setState(() {});
              }),
            );
          },
        ),
      ]
    );
  }
}
