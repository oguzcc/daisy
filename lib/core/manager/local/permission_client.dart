import 'package:permission_handler/permission_handler.dart';

class PermissionClient {
  PermissionClient._();
  static final PermissionClient _instance = PermissionClient._();
  static PermissionClient get instance => _instance;

  static Future<bool> checkNotificationPermission() async =>
      await Permission.notification.isGranted;

  static Future<bool> checkCameraPermission() async =>
      await Permission.camera.isGranted;

  static Future<bool> checkMicrophonePermission() async =>
      await Permission.microphone.isGranted;

  // Static method to request notification permission
  static Future<bool> requestNotificationPermission() async {
    var result = await Permission.notification.request();
    if (result.isGranted) {
      return true;
    } else if (result.isPermanentlyDenied) {
      // If permission is permanently denied, open app settings
      openAppSettings();
      // return false;
    }
    return false;
  }

  ///Get camera and microphone permission status
  static Future<Map<Permission, PermissionStatus>>
      getCameraAndMicrophonePermissionStatus({bool openSettings = true}) async {
    var result = await [
      Permission.camera,
      Permission.microphone,
    ].request();

    if (result[Permission.camera]!.isGranted &&
        result[Permission.microphone]!.isGranted) {
      // Eğer izinler verilmişse, direkt sonucu döndür
      return result;
    }

    // İzinler kalıcı olarak reddedildiyse ve ayarları açma isteği varsa
    if (openSettings &&
        (result[Permission.camera]!.isPermanentlyDenied ||
            result[Permission.microphone]!.isPermanentlyDenied)) {
      openAppSettings();
    }

    return result;
  }

  /// Request camera and microphone permission
  static Future<Map<Permission, PermissionStatus>>
      requestCameraAndMicrophonePermission() async {
    var result = await [
      Permission.camera,
      Permission.microphone,
    ].request();

    return result;
  }
}
