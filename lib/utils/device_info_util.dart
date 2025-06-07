import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoUtil {
  static Future<String?> getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final info = await deviceInfo.androidInfo;
      return info.id;
    } else if (Platform.isIOS) {
      final info = await deviceInfo.iosInfo;
      return info.identifierForVendor;
    }
    return null;
  }
}
