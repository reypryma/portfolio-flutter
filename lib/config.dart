import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/utils/colour_assets.dart';

final String urWebsiteUrl = "https://www.sunaonako.my.id";
final String endpointFetch = 'wp-json/wp/v2';
//Show how many per_page ?
final String perPage = "10";

final String mainApiUrl = "$urWebsiteUrl/wp-json";
final double barIconSize = 40.0;
final String connectionProblemError = ' Internet Connection Problem ';
final authorImage = "images/bpfull.jpg";
final heroImg = "images/devheroimg.png";
final logoNav = "images/portf.png";


class ImageProjects{
  static const kelolaku = "projects/1.png";
  static const nakoInfo = "projects/2.png";
  static const antrianSehat = "projects/3.png";
  static const simplePOS = "projects/4.png";
}

/*
Color svGetBodyColor() {
  if (appStore.isDarkModeOn)
    return SVBodyDark;
  else
    return SVBodyWhite;
}*/

Gradient defaultThemeGradient() {
  return LinearGradient(
    colors: [
      ColorAsset.HueYellow,
      ColorAsset.HueRed.withOpacity(0.5),
    ],
    tileMode: TileMode.repeated,
    begin: Alignment.topCenter,
    end: Alignment.bottomLeft,
  );
}

