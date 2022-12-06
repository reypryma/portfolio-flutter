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
