import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoClient {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  Future<BaseDeviceInfo> get getDeviceInfo async => await deviceInfo.deviceInfo;

  /// These information is not necessary. Just call getDeviceInfo() instead.

  // Future<AndroidDeviceInfo> getAndroidDeviceInfo() async =>
  //     await deviceInfo.androidInfo;

  // Future<IosDeviceInfo> getIosDeviceInfo() async => await deviceInfo.iosInfo;

  // Future<WebBrowserInfo> getWebBrowserInfo() async =>
  //     await deviceInfo.webBrowserInfo;

  // Future<LinuxDeviceInfo> getLinuxDeviceInfo() async =>
  //     await deviceInfo.linuxInfo;

  // Future<MacOsDeviceInfo> getMacOsDeviceInfo() async =>
  //     await deviceInfo.macOsInfo;

  // Future<WindowsDeviceInfo> getWindowsDeviceInfo() async =>
  //     await deviceInfo.windowsInfo;
}
