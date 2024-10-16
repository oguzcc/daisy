import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class ShareClient {
  static Future<bool> share(String text) async {
    try {
      final result = await Share.share(text);
      return result.status == ShareResultStatus.success;
    } catch (e) {
      debugPrint('Error sharing: $e');
      return false;
    }
  }

  static Future<bool> copyToClipboard(
      BuildContext context, String? text) async {
    if (text != null) {
      await Clipboard.setData(ClipboardData(text: text));
      return true;
    }
    return false;
  }
}
