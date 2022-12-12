import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/banner_text_animation.dart';
import 'package:portfolio/utils/hover_extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../utils/colour_assets.dart';

class HeaderBody extends StatelessWidget {
  final bool? isMobile;
  const HeaderBody({
    Key? key,
    this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'I\'m a Cross',
          style: Theme.of(context).textTheme.headline2,
          maxLines: 1,
          minFontSize: 14,
          overflow: TextOverflow.fade,
        ),
        AutoSizeText(
          'platform Learner < / >',
          style: Theme.of(context).textTheme.headline2,
          minFontSize: 14,
          maxLines: 1,
        ),
        SizedBox(height: isMobile ?? false ? 16 : 32),
        BannerTextAnimation(isMobile: this.isMobile ?? false,),
        SizedBox(height: isMobile ?? false ? 16 : 32),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: ColorAsset.redAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
          ),

          // color: ColorAsset.redAccent,
          onPressed: () =>
              launch(('mailto:refano@sunaonako.my.id?subject=Challenge%20Opportunity&body=Wahalo!')),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: isMobile ?? false ? 10 : 16,
              horizontal: isMobile ?? false ? 8 : 15,
            ),
            child: Text(
              'Contact Me',
              style: TextStyle(
                fontSize: isMobile ?? false ? 20 : 24,
                color: Colors.white,
              ),
            ),
          ),
        ).moveUpOnHover
      ],
    );
  }
}
