import 'dart:math';

import 'package:flutter/material.dart';

class ColorAsset {
  static const Color red = Color.fromRGBO(255, 87, 87, 1);
  static const Color blue = Color.fromRGBO(82, 113, 255, 1);
  static const Color green = Color.fromRGBO(97, 242, 162, 1);
  static const Color yellow = Color.fromRGBO(255, 222, 89, 1);

  static const List<Color> all = [red, blue, green, yellow];

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
