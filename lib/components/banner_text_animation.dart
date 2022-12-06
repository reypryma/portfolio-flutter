import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/utils/colour_assets.dart';

class BannerTextAnimation extends StatelessWidget {
  const BannerTextAnimation({Key? key, required this.isMobile}) : super(key: key);
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 16),
      child: AnimatedTextKit(
        repeatForever: true,
        animatedTexts: [
          buildTyperAnimatedText(text: 'Developing Mobile or Web Apps'),
          buildTyperAnimatedText(text: 'UX Research and UI Design'),
          buildTyperAnimatedText(text: 'Deploy and Apps Maintenance'),
        ],
      ),
    );
  }

  TyperAnimatedText buildTyperAnimatedText({required String text, bool isMobile = false}) {
    return TyperAnimatedText(text,
          speed: Duration(milliseconds: 200),
          textStyle: AutoSizeText(text, maxLines: 3, overflow: TextOverflow.fade, style: TextStyle(fontSize: 24),).style,
    );
  }
}

