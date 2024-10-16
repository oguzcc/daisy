import 'package:url_launcher/url_launcher.dart';

class LauncherClient {
  static Future<void> launchWhatsApp(
      {required String phoneNumber, String? message}) async {
    final Uri whatsappUrl = Uri.parse(
        'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message ?? '')}');
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  static Future<void> callTel({required String phoneNumber}) async {
    final Uri callUrl = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(callUrl)) {
      await launchUrl(callUrl);
    } else {
      throw 'Could not launch $callUrl';
    }
  }

  static Future<void> sendEmail({required String email}) async {
    final Uri emailUrl = Uri.parse('mailto:$email');
    if (await canLaunchUrl(emailUrl)) {
      await launchUrl(emailUrl);
    } else {
      throw 'Could not launch $emailUrl';
    }
  }
}
