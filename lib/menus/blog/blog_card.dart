import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webfeed/domain/rss_item.dart';
import 'package:portfolio_flutter_web/utils/hover_extensions.dart';

import '../experience/experience_container.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
    Key? key,
    this.isMobile,
    required this.article,
  }) : super(key: key);

  final bool? isMobile;
  final RssItem article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      mouseCursor: MaterialStateMouseCursor.clickable,
      onTap: () => launchUrlString(article.link!),
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.redAccent,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: isMobile ?? false ? 20 : 40,
              ),
              child: Text(
                article.title!,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    convertDate(article.pubDate.toString()),
                    style: textStyle(isGrey: true),
                  ),
                  SizedBox(height: 15),
                  Text(
                    removeAllHtmlTags(article.content!.value),
                    style: textStyle(),
                    maxLines: 3,
                  ),
                ],
              ),
            )
          ],
        ),
      ).moveUpOnHover,
    );
  }
}

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}

String convertDate(String dateText) {
  // final date = DateFormat('EEE, yyyy-dd-MMM HH:mm:ss zzz').parse(dateText);
  final parsedDate = DateTime.parse(dateText);
  var newFormat = DateFormat("d MMMM yyyy");
  String updatedDt = newFormat.format(parsedDate);
  // final date = DateFormat('1974-03-20 00:00:00.000').parse(parsedDate.toString());
  return updatedDt;
}
