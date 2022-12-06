import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/mobile_desktop_view_builder.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/menus/portfolio/portfolio_view.dart';
import 'package:provider/provider.dart';

import '../config.dart';

class NavigationBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: NavigationMobileView(),
      desktopView: NavigationDesktopView(),
    );
  }
}

class NavigationDesktopView extends StatelessWidget {
  const NavigationDesktopView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationItems = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();
    return Container(
      height: 80,
      width: 1507,
      padding: kScreenPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            logoNav,
            height: 25,
          ),
          // Spacer(),
          Row(
            children: [
              for (var item in navigationItems)
                NavigationBarItem(
                  onPressed: () {
                    scrollController.animateTo(
                      item.position,
                      duration: Duration(milliseconds: 700),
                      curve: Curves.easeInOut,
                    );
                  },
                  text: item.text,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class NavigationMobileView extends StatelessWidget {
  const NavigationMobileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(width: 20),
          TextButton(
            onPressed: () => {},
            child: AutoSizeText('Flutter Portfolio 0.1.1', style: TextStyle(color: Colors.black.withOpacity(0.4))),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          )
        ],
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 650;
    return Container(
      padding: const EdgeInsets.only(left: 48),
      child: InkWell(
        mouseCursor: MaterialStateMouseCursor.clickable,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: isSmall ? 17 : 24,
          ),
        ),
      ),
    );
  }
}
