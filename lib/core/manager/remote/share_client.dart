import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';

//! Buradaki mesaj daha sonra değiştirilmesi gerekir.
class ShareClient {
  static Future<bool> share() async {
    try {
      final result = await Share.share(
        "Share your referral code with your friends and earn 10% discount on your next session.",
        subject: "Invite your friends to BillVoice",
      );

      return result.status == ShareResultStatus.success;
    } catch (e) {
      debugPrint('Error sharing: $e');
      return false;
    }
  }
}

enum ShareEnum {
  email('Email'),
  linkedin('LinkedIn'),
  whatsapp('Whatsapp'),
  facebook('Facebook'),
  instagram('Instagram'),
  twitter('Twitter');

  const ShareEnum(this.channel);
  final String channel;
}
