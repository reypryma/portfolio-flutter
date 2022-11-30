import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wordpress_api/wordpress_api.dart';
import 'package:nb_utils/nb_utils.dart';

const double kInitWidth = 1507;
const kScreenPadding = const EdgeInsets.symmetric(horizontal: 20);
final String apiUrl = "https://sunaonako.my.id/apps-api/wp/v2/";
// WordpressClient client = new WordpressClient('https://travelsilami.my.id/', 'wp-json/wp/v2');
// final api = WordPressAPI('site.com');

Future<void> launchURL(String url, {bool forceWebView = false}) async {
  await launch(url, enableJavaScript: true, forceWebView: forceWebView).catchError((e) {
    throw '$url is not valid';
  });
}


Widget commonCacheImageWidget(String? url, double height,
    {double? width, BoxFit? fit}) {
  if (url.validate().startsWith('http')) {
    if (isMobile) {
      return CachedNetworkImage(
        placeholder:
        placeholderWidgetFn() as Widget Function(BuildContext, String)?,
        imageUrl: '$url',
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        errorWidget: (_, __, ___) {
          return SizedBox(height: height, width: width);
        },
      );
    } else {
      return Image.network(url!,
          height: height, width: width, fit: fit ?? BoxFit.cover);
    }
  } else {
    return Image.asset(url!,
        height: height, width: width, fit: fit ?? BoxFit.cover);
  }
}

Widget? Function(BuildContext, String) placeholderWidgetFn() =>
        (_, s) => placeholderWidget();

Widget placeholderWidget() => Image.asset('images/img.jpg', fit: BoxFit.cover);
