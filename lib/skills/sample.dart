import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:portfolio_flutter_web/components/desktop_view_builder.dart';
import 'package:portfolio_flutter_web/skills/skills_view.dart';
import 'package:portfolio_flutter_web/utils/colour_assets.dart';

import '../config.dart';

class KelolaScreenUI extends StatefulWidget {
  // final int? totalItemToDisplay;

  const KelolaScreenUI({
    Key? key,
  }) : super(key: key);

  @override
  MARelatedSleepListComponentState createState() =>
      MARelatedSleepListComponentState();
}

class MARelatedSleepListComponentState extends State<KelolaScreenUI> {
  @override
  void initState() {
    super.initState();
    // init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: '',
      children: List.generate(abilities.length, (index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          delay: 200.milliseconds,
          duration: const Duration(milliseconds: 600),
          child: SlideAnimation(
            horizontalOffset: 50.0,
            child: FadeInAnimation(
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Container(
                        decoration: boxDecorationWithRoundedCorners(
                            backgroundColor: ColorAsset.SVBodyWhite),
                        child: Hero(
                          tag: abilities[index].name + index.toString(),
                          child: Image.asset(authorImage,
                                  height: 100, width: 100, fit: BoxFit.cover)
                              .cornerRadiusWithClipRRect(8),
                        )),
                    8.width,
                    Column(
                      children: [
                        Text(abilities[index].subtitle!,
                            style: boldTextStyle(size: 14), maxLines: 3),
                        8.height,
                        Row(
                          children: [
                            Text('29 minute',
                                style: secondaryTextStyle(size: 12)),
                            16.width,
                            Text('•', style: secondaryTextStyle(size: 12)),
                            16.width,
                            Text('Female Vocal',
                                style: secondaryTextStyle(size: 12)),
                          ],
                        )
                      ],
                    ).expand()
                  ],
                ).paddingBottom(16),
              ),
            ),
          ),
        );
      }),
    );
  }
}
