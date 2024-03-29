import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:portfolio/components/mobile_desktop_view_builder.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/menus/next_page_example.dart';
import 'package:portfolio/utils/hover_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/colour_assets.dart';

class FooterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      desktopView: FooterDesktopView(),
      mobileView: FooterMobileView(),
    );
  }
}

class FooterDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    return Container(
      height: 100,
      width: kInitWidth,
      padding: kScreenPadding,
      child: Row(
        children: [
          InkWell(child: Text('© <RePry Ma> $currentYear -- '), onTap: (){
            NextPage().launch(context);
          }),
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(LineIcons.github_square),
                8.width,
                Container(
                    child: Text(
                  'Created Using Flutter, See the source',
                  style: TextStyle(decoration: TextDecoration.underline),
                )).onTap(
                  () {
                    launch('https://s.sunaonako.my.id/resume');
                  },
                ),
              ],
            ),
            mouseCursor: MaterialStateMouseCursor.clickable,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () => launch('https://github.com/reypryma'),
          ),
          Spacer(),
          for (final social in socials)
            IconButton(
              icon: social.icon,
              onPressed: () => launch(social.url),
              color: ColorAsset.redAccent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            )
                .moveUpOnHover
          ,SizedBox(width: 60),
        ],
      ),
    );
  }
}

class FooterMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;

    return Container(
      padding: kScreenPadding,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final social in socials)
                IconButton(
                  icon: social.icon,
                  onPressed: () => launch(social.url),
                  color: ColorAsset.redAccent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                ),
            ],
          ),
          SizedBox(height: 20),
          Text('© <Yoga> $currentYear'),
          SizedBox(height: 20),
          InkWell(
            child: Text(
              'See the source code',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            mouseCursor: MaterialStateMouseCursor.clickable,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              launch('https://s.sunaonako.my.id/resume');
            },
          ),
        ],
      ),
    );
  }
}

class SocialInfo {
  final Widget icon;
  final String url;

  SocialInfo({
    required this.icon,
    required this.url,
  });
}

final socials = [
  SocialInfo(
    icon: FaIcon(FontAwesomeIcons.facebook),
    url: 'https://www.facebook.com',
  ),
  SocialInfo(
    icon: FaIcon(FontAwesomeIcons.instagram),
    url: 'https://www.instagram.com',
  ),
  SocialInfo(
    icon: FaIcon(FontAwesomeIcons.linkedin),
    url: 'https://www.linkedin.com',
  ),
  SocialInfo(
    icon: FaIcon(FontAwesomeIcons.twitter),
    url: 'https://www.twitter.com',
  ),
];
