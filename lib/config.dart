import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/utils/colour_assets.dart';

final String urWebsiteUrl = "https://www.sunaonako.my.id";
final String endpointFetch = 'wp-json/wp/v2';
//Show how many per_page ?
final String perPage = "10";
const String assetPath = "/assets/";
const String noAssetPath = "";

/*
* fail
* /images/..
* ''images/
*
* WORKING!
* /assets/images/ or /assets/projects
*
* */

final String mainApiUrl = "$urWebsiteUrl/wp-json";
final double barIconSize = 40.0;
final String connectionProblemError = 'Internet Connection Problem ';
final authorImage = "${assetPath}images/bpfull.jpg";
final heroImg = "${assetPath}images/devheroimg.png";
final logoNav = "${assetPath}images/portf.png";


class ImageProjects{
  static const kelolaku = "${assetPath}projects/1.png";
  static const nakoInfo =  "${assetPath}projects/2.png";
  static const antrianSehat = "${assetPath}projects/3.png";
  static const simplePOS = "${assetPath}projects/4.png";
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

