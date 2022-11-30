import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WordpressCard extends StatelessWidget {
  const WordpressCard({Key? key, this.isMobile, required this.article}) : super(key: key);
  final bool? isMobile;
  final article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      mouseCursor: MaterialStateMouseCursor.clickable,
      onTap: () => launchUrlString(article['link']),
      child:Container(

      ) ,
    );
  }
}
