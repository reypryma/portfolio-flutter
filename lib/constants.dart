import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wordpress_api/wordpress_api.dart';

const double kInitWidth = 1507;
const kScreenPadding = const EdgeInsets.symmetric(horizontal: 20);
final String apiUrl = "https://sunaonako.my.id/apps-api/wp/v2/";
// WordpressClient client = new WordpressClient('https://travelsilami.my.id/', 'wp-json/wp/v2');
final api = WordPressAPI('site.com');

Future<void> launchURL(String url, {bool forceWebView = false}) async {
  await launch(url, enableJavaScript: true, forceWebView: forceWebView).catchError((e) {
    throw '$url is not valid';
  });
}
