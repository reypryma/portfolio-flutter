import 'package:flutter/material.dart';
import 'package:portfolio/components/mobile_desktop_view_builder.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/header/header_body.dart';

import '../config.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: HeaderMobileView(),
      desktopView: HeaderDesktopView(),
    );
  }
}

class HeaderDesktopView extends StatelessWidget {
  const HeaderDesktopView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmall = width < 950;
    final imageWidth = width * 0.47;
    return Container(
      height: 864,
      width: kInitWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: HeaderBody()),
            Image.asset(
              heroImg,
              height: isSmall ? imageWidth : 500,
            )
          ],
        ),
      ),
    );
  }
}

class HeaderMobileView extends StatelessWidget {
  const HeaderMobileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * .9,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset(heroImg)),
            HeaderBody(isMobile: true),
          ],
        ),
      ),
    );
  }
}
