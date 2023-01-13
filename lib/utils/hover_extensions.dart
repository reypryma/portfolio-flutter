import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:portfolio/components/elevate_on_hover.dart';

import 'device_helper.dart';

extension HoverExtension on Widget {

  static final appContainer = DeviceHelper.isWeb() ? html.window.document.getElementById('app-container') : null;


  Widget get moveUpOnHover {
    return ElevateOnHover(child: this);
  }
}
