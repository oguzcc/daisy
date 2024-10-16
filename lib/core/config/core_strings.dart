import 'package:daisy/core/manager/local/config_client.dart';

sealed class CoreStrings {
  static const sentryDnsURL = 'https://sentry.io/';

  static const devUrl = 'http://localhost:3000';
  static const stgUrl = 'https://staging.invoice.com';
  static const prodUrl = 'https://invoice.com';

  static String get sentryDsn {
    switch (ConfigClient.platform) {
      case 'iOS':
        return '$sentryDnsURL/iOSProjectKey';
      case 'Android':
        return '$sentryDnsURL/AndroidProjectKey';
      case 'Web':
        return '$sentryDnsURL/WebProjectKey';
      case 'Windows':
        return '$sentryDnsURL/WindowsProjectKey';
      case 'Mac':
        return '$sentryDnsURL/MacProjectKey';
      default:
        return '$sentryDnsURL/DefaultProjectKey';
    }
  }

  // MARK: Connection
  static const online = 'You are now online';
  static const offline = 'You are now offline';

  // MARK: Date Time
  static const today = 'Today';
  static const yesterday = 'Yesterday';
  static const tomorrow = 'Tomorrow';

  // MARK: Share
  static const copiedToClipboard = 'Copied to clipboard';

  // MARK: Error Messages
  static const defaultErrorMessage =
      'An error occurred. Please try again later.';
  static const serverErrorMessage =
      'Server error occurred. Please try again later.';
  static const noInternetErrorMessage = 'No internet connection.';
  static const unauthorizedErrorMessage = 'Unauthorized. Please login again.';
}
