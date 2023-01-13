import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DeviceHelper {

  static bool isWeb() {
    return kIsWeb;
  }

  static bool isAndroid(){
    return Platform.isAndroid;
  }

}