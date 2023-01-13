import 'dart:math';

import 'package:flutter/material.dart';

class ColorAsset {
  static const Color red = Color(0xFF881239);
  static const Color blue = Color(0xFF313679);
  static const Color green = Color(0xFF26b295);
  static const Color yellow = Color(0xFFf5ae39);

  static const List<Color> all = [red, blue, green, yellow];

  static const Color redAccent = Color(0xFFe16979);

  static const SVBodyWhite = Color(0xFF6F7F92);
  static const SVBodyDark = Color(0xFFF5F5F5);

  static const HueWhite = Color(0xFFf8fbff);
  static const HueDark = Color(0xFF343434);
  static const HueRed = Color(0xFFd74725);
  static const HueYellow = Color(0xFFfab201);
  static const HueBlue = Color(0xFF3256A2);

  static colorRandomColor() {
    Random _random = Random();

    return Color.fromRGBO(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextDouble(),
    );
  }
}

// Light Theme Colors
const appColorPrimary = Color(0xFF5685EC);
const appColorAccent = Color(0xFF03DAC5);
const appTextColorPrimary = Color(0xFF212121);
const iconColorPrimary = Color(0xFFFFFFFF);
const appTextColorSecondary = Color(0xFF5A5C5E);
const iconColorSecondary = Color(0xFFA8ABAD);
const appLayout_background = Color(0xFFf8f8f8);
const appLight_purple = Color(0xFFdee1ff);
const appLight_orange = Color(0xFFffddd5);
const appLight_parrot_green = Color(0xFFb4ef93);
const appIconTintCherry = Color(0xFFffddd5);
const appIconTint_sky_blue = Color(0xFF73d8d4);
const appIconTint_mustard_yellow = Color(0xFFffc980);
const appIconTintDark_purple = Color(0xFF8998ff);
const appTxtTintDark_purple = Color(0xFF515BBE);
const appIconTintDarkCherry = Color(0xFFf2866c);
const appIconTintDark_sky_blue = Color(0xFF73d8d4);
const appDark_parrot_green = Color(0xFF5BC136);
const appDarkRed = Color(0xFFF06263);
const appLightRed = Color(0xFFF89B9D);
const appCat1 = Color(0xFF8998FE);
const appCat2 = Color(0xFFFF9781);
const appCat3 = Color(0xFF73D7D3);
const appCat4 = Color(0xFF87CEFA);
const appCat5 = appColorPrimary;
const appShadowColor = Color(0x95E9EBF0);
const appColorPrimaryLight = Color(0xFFF9FAFF);
const appSecondaryBackgroundColor = Color(0xff343434);
const appDividerColor = Color(0xFFDADADA);
const appSplashSecondaryColor = Color(0xFFD7DBDD);

// Dark Theme Colors
const appBackgroundColorDark = Color(0xFF262626);
const cardBackgroundBlackDark = Color(0xFF1F1F1F);
const color_primary_black = Color(0xFF131d25);
const appColorPrimaryDarkLight = Color(0xFFF9FAFF);
const iconColorPrimaryDark = Color(0xFF212121);
const iconColorSecondaryDark = Color(0xFFA8ABAD);
const appShadowColorDark = Color(0x1A3E3942);