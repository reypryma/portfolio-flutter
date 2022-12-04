import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/utils/hover_extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
          'I\'m a Mobile',
          style: Theme.of(context).textTheme.headline2,
          maxLines: 1,
        ),
        AutoSizeText(
          'Developer < / >',
          style: Theme.of(context).textTheme.headline2,
          maxLines: 1,
        ),
        SizedBox(height: isMobile ?? false ? 20 : 37),
        AutoSizeText(
          'I have 2 years of experience in mobile development in building beautiful apps in Android and iOS',
          style: TextStyle(fontSize: 24),
          maxLines: 3,
        ),
        SizedBox(height: isMobile ?? false ? 20 : 40),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
          ),

          // color: Colors.redAccent,
          onPressed: () =>
              launch(('mailto:smith@example.org?subject=News&body=New%20plugin')),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: isMobile ?? false ? 10 : 17,
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
