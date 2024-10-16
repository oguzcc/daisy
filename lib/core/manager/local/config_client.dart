import 'dart:io';

import 'package:flutter/foundation.dart';

sealed class ConfigClient {
  static String get platform {
    if (Platform.isIOS) {
      return 'iOS';
    } else if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isMacOS) {
      return 'Mac';
    } else if (Platform.isWindows) {
      return 'Windows';
    } else if (kIsWeb) {
      return 'Web';
    } else {
      return 'Unknown Platform';
    }
  }

  static bool isIOS() => platform == 'iOS';
  static bool isAndroid() => platform == 'Android';
}
